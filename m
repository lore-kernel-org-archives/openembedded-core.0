Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2986EFF884A
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:14 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31991.1777064227499277757
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EmvXgiOY;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so42146295e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064226; x=1777669026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5pGbKtl4qnVIGrQ5r3MHb0Q+pMQTAAdpsDc2EgOY2I=;
        b=EmvXgiOYeK4V4Xzs7Td8n0tAE6B78w9gopeZzwQ9ir7uB5ejzht7EWF1oYzNmRaRXB
         /0tWHOH4ig8Vx9aFK8vhI56WZ8zIPepa32Fvtyh8IXOwxZA4OFluNeArtgzDr8eIrc/2
         N1WejjWSxSJDPiknTbiYZGyin4F2n7xGPzOq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064226; x=1777669026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r5pGbKtl4qnVIGrQ5r3MHb0Q+pMQTAAdpsDc2EgOY2I=;
        b=pefW0cwKAlYeIPsMZMfqzHrCnGed1DZwJDF0d/eY+fjMHqtFACwMds1FEOwrKGqJSr
         LVEowedYqBzFS7dkhsAh5RhwCoBecnefuismKpvIGgz3RqzvBb42zB3W9y7cFb1XLChY
         XRpaH3PwAUNiO20DWwApl2IzrSlJm3a0cvj0f+y6bl9zI96sUk6ZQ6CpzL5oW+z0PSJK
         Zr4qjYDvM9vicVvngO9sB0xG22qVYnBVpfpYuDfk3Wu9KLs4RM6bNWkFGOz183PjJghj
         +HL5zV3NcqpZ8Lo86ROK5LY+LHz5Q2riCZEoXcr4Z3xq4I5QQ94k+kJOra+QxFxaXnxf
         s/Ug==
X-Gm-Message-State: AOJu0Ywsdv3kR8iqh9ac+ci0OHK9QxvvIsVd2vMknIj0XsnWcXbSdv6E
	3GoF29CK9qkXfwi8wAA+L8jf5wtT6nCBWYkj/b9nh4ZeOimQ21v53yE7jGVrhmhnLjIY+RH5ZMw
	+2/abkKbdNtxm
X-Gm-Gg: AeBDievkrRBZA/CiHzgrr6+sPSsvM5F75z/LV3aSxPcEAAz+Nf8MfPkLxM5nzb1/yU7
	Hd2QkFUYnO5s6zklj5n7+HeyMDmmMIRJAQbmLKCM8TeRQ9Mrul7PTIwhTm5DOImCuyoBDBPe+IM
	jKmzXfPamXtQJV1i66WmDY+BOZT2tdmBRsxCQT4TuOa0c69YlOOPB3X7AzPWEUI+4Hwx3PjAftL
	yHG6DQsGgoQHUVlz+vugIEke8kB2kppiC8GHcViqsd4ziGOnC59hQQ+jRE5att3I/99GZk+2LG3
	H3yaBwve3ePhSDDdKHlmUnG1mjwTjkiVTnlF0NKWioA6PnJPUb67/FLQ2+lMNK/XGnLKOC8kNfw
	r+GIrB9WkNX+xtN+/RBbwE1HJzNU6CS0LuXfl/H4fbnNOVqTovvYVQhztyeijgCwQ8aJqoHWx3W
	chapVG1QbiHI0JIF6LCflWWX4t/OdJ5xaxlP5OElFyNSyzhInSD3AJPRoHwBaxMPL6ke7VbRk81
	hmVot6tbBD8/DEGP/qz7IUJsBpgxKBTzpDXGg==
X-Received: by 2002:a05:600c:8b6b:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-488fb8859ddmr438786675e9.2.1777064225621;
        Fri, 24 Apr 2026 13:57:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 49/66] pseudo: Add fix for glibc 2.43
Date: Fri, 24 Apr 2026 22:55:48 +0200
Message-ID: <689bd1811c2300263a8a86ba3b46bbc6b1622323.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235922

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to add a fix for a function definition to work with glibc 2.43.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7d35b0e7929d666af783db835a3a809f8f6ce429)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 0f063f18812..3ae560487bd 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"
+SRCREV = "56e1f8df4761da60e41812fc32b1de797d1765e9"
 S = "${WORKDIR}/git"
 PV = "1.9.3+git"
 

