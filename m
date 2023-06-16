Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2F9EB64D8
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:29 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.251.1686926248243841884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=e9sW3ICL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b51414b080so5576725ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926247; x=1689518247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwts3NQiJIOFLCKzb9UKHTxaTeb+E2eWlkZMiv+ik2g=;
        b=e9sW3ICLyOpt7uy8ZymCmSViuRvnb6jLOxkOvEaYqXyELHwLYNuJPAc67qFQeoIU2o
         7WvVuRVC0CJm3/OrPGHX82WH0UKtM5rajyoW9MphI7iVnIntT/CV1eKER1IWHSqtZYY4
         5tqGiQOnRfPRZsCRZie70w1uNZpDjkkO/zUGsMhrW6qYdszXdGwiO/+WXkCNxgMup5bc
         W7rg8ngOrGh3DQ/0bcLN32SclelNg5ZnCBeae3Bza6715fE0EhpSaPFXluiZ7XGHNcIF
         7VtX2Ol1GnnjADy1QIOzdoymZRZiEy09OAulus6IfL7AJY8BOTVym4GON0+SOvsppo3o
         0aUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926247; x=1689518247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwts3NQiJIOFLCKzb9UKHTxaTeb+E2eWlkZMiv+ik2g=;
        b=b2MdSw3pEsTlKV5ghGh1vxH6szhnm0xInYR91k6R749vDuOhr3RpImNJubzvm0PpvP
         L7GC6Kk8kR9j+2fKkPoYoeH+eVGjcZ0+UJEDo2jxvrWUvd/PaOhf8wbulYywerxye6EZ
         PrVbsoaG4dTZPzZXR3E6SfQJb40zNxUpDe1q9HzTdXs7fVYKu+HDg2YtAeP66tXcAYuc
         8W8VbmhDY8URbmiQn/shdDnb4lYG96/VxgSC2f5b0aTV8pgg6yZbDdxH17nV2vf8Wp0S
         Ulc/uoetAcQ4Cnxyj+gYNlCGj+R4ahKRLH/19UQcQ+4PYAzP1nE0dmgMJBWwMcPHHkMK
         8SEA==
X-Gm-Message-State: AC+VfDxtPXDhOPpo5/9uTK1Ea9JqrdRLO0JDaPXfMZnKo6CMXbumDp2+
	/m3m/grQBFiC2F+1UqJF0CFMEQn4nZEDuDYz46Y=
X-Google-Smtp-Source: ACHHUZ4wSsM80UFAZNV7D5oBzuwh4+B+nUSyjsluIbpMetGj6qUIaor/5/bVtr4neI1X6qGmOV5dFg==
X-Received: by 2002:a17:902:d2c7:b0:1af:9c06:22e5 with SMTP id n7-20020a170902d2c700b001af9c0622e5mr1732021plc.69.1686926247265;
        Fri, 16 Jun 2023 07:37:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/24] ell: upgrade 0.56 -> 0.57
Date: Fri, 16 Jun 2023 04:36:54 -1000
Message-Id: <3d3f9b4dce794114628a15bf375a8f91b7169a27.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183024

From: Markus Volk <f_l_k@t-online.de>

ver 0.57:
	Fix issue with handling Generic Netlink cancel requests.

ell 0.57 is required for iwd 2.5

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f13fe33403f077802640e70a84596546d555c3b9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ell/{ell_0.56.bb => ell_0.57.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.56.bb => ell_0.57.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.56.bb b/meta/recipes-core/ell/ell_0.57.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.56.bb
rename to meta/recipes-core/ell/ell_0.57.bb
index 0ace622835..09a0831fbe 100644
--- a/meta/recipes-core/ell/ell_0.56.bb
+++ b/meta/recipes-core/ell/ell_0.57.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "58eb8b2b64087f7479d5db6a830a0656c536d93e5f11d4c9a4443ce8760a1b63"
+SRC_URI[sha256sum] = "7603928ee584b758ca27c67e4dc513049a09b038d7d28459a9440f8443c91018"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.34.1


