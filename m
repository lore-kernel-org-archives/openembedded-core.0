Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C911C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:55 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.5700.1678402727312226076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mQa98+/s;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 16so2015101pge.11
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOw95XhUWVDtKGN2d1Os3nu5EQ2slHJm/t/MXXjGHoI=;
        b=mQa98+/sQ+3jMYN37RutQEEsc2osUovPvhkB2Iej2J47aNCh916M/l0FOCrkuW/I+M
         Nyx2cYN99USRAEJWA/psygvwtM2pxuZGurMhteiXIsPBKAHU7um4vUpy/7YgpbXxF9ZC
         iJOm1Nsl8GNRsYJI/DDIoTLFGlEGlnP1seXcJbfCP0qe750uKlEjH4cTfOsIJ8YBNRA2
         UEX2szXcY7vo9aet2+cjhleZLLZ4Bz2O/EVl2nON7EqW3X4o6wQvs4bMrALhNjbD94hu
         w1o8aJc6R927FQJPcVMHCvQ0JUzaSxYmYRUy4Mz5onXGEtrCvsT59DOVdKGm7BQ5F2FO
         ZU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOw95XhUWVDtKGN2d1Os3nu5EQ2slHJm/t/MXXjGHoI=;
        b=YlapvjXQ5ZbMADakzA3DBXGqSfRnPeoHHK2cQs+3rDWr5p6893JRV2BjEBpz+f2Mav
         FJaLaQaSq6Jip/Go1leBXt2s8TxNjO+gahNyvE+NBL+58yphFsL1Pn9HM/weMXk+V0Xz
         13yrEfJh9G4G0vBOSMlTrAaWlxZa1JAcTJeNbzVbo1LEI5LneiPVZSq88q1g/iIQ7y7x
         Z8f2EytXqZtYHNa2lT3Zfl7knwYcVFhOo1FvivRYKZcGfPD97IdPL94VQXTouPeS5xBj
         T5jvpN5k02Kb6aHIuv6BumlYUJb3Jf2gWYlPZgu4XKATrQBZT5Swm6hWtW3s3XfZtTod
         gHwA==
X-Gm-Message-State: AO0yUKVBiCRvhEs7QyPs6zZq0WMF8EJmfBigXm3AfHxQuYIC0Q0uTJIV
	rBg5i2Jhuh9kJBzH0GBdffI7VJRv5/dyzJba8tg=
X-Google-Smtp-Source: AK7set9NBJLjut5iNN4xS2AZKr3gJa4w887wYhC8a209R9c8GExnoiV5eVtfGvPdlREfQjQ+Hky/dg==
X-Received: by 2002:aa7:842e:0:b0:5a8:aa77:1835 with SMTP id q14-20020aa7842e000000b005a8aa771835mr19032538pfn.33.1678402726482;
        Thu, 09 Mar 2023 14:58:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 19/27] mesa-demos: packageconfig weston should have a dependency on wayland-protocols
Date: Thu,  9 Mar 2023 12:57:54 -1000
Message-Id: <0130e0cceeb506787ee7b9e8d895a9d6f8798d32.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178292

From: Carlos Alberto Lopez Perez <clopez@igalia.com>

wayland-protocols is a required depency of mesa-demos when the 'wayland'
packageconfig option is enabled. Usually this doesn't lead to a build
failure because mesa itself depends on wayland-protocols, but when using
other graphics drivers this can cause the following build falure:

| ../mesa-demos-8.5.0/meson.build:69:2: ERROR: Dependency "wayland-protocols" not found, tried pkgconfig
| ERROR: meson failed

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 89615b56899eed7b5c6ad731e2168d99a30fba6c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
index 6e9b95e1e2..12f41d75a5 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
@@ -30,7 +30,7 @@ PACKAGECONFIG[gles1] = "-Dgles1=enabled,-Dgles1=disabled,virtual/libgles1"
 PACKAGECONFIG[gles2] = "-Dgles2=enabled,-Dgles2=disabled,virtual/libgles2"
 PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},,freeglut"
 PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
-PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native wayland-protocols"
 PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libglu"
 
 do_install:append() {
-- 
2.34.1


