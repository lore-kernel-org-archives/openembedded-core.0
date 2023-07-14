Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E18C001B0
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 16:18:34 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.3096.1689351509091727550
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 09:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mqbynUWb;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: festevam@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-565e4741723so287336eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 09:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689351508; x=1691943508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mzFtgE7W9p+ORo18tXAyusEtxnewfXX+DYtgNSWP45A=;
        b=mqbynUWbOGxj0y9JxbfeYoDnAMWHVI4aDVDfb/SCr32cSkI0VWgBFs2ly08UJy8Cmd
         TtY9gQxK6fT5OhISOEFQlcQS/199LJbWQclylT1/3IvsQJP1QZNmv53FbSkorMg42vys
         XTMvnZAVMdy+2c7ehpy/SOeG3WRbdHBTsVF6aQrk3cY+OL98f0OhlNUaV/XIcCpc3Jv1
         qbDNvESIrkYufnk5L+u+uvAY4CZYy0und6NULugpVj+hsMZ+YuXwaJgH8LxUluHWE7FV
         6JOdynAy3oYti6VepLta5S4+UyBaOzHif4ZZWh11vqczwsi3nsX9NItfF0UlZLCyALK6
         5DwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689351508; x=1691943508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzFtgE7W9p+ORo18tXAyusEtxnewfXX+DYtgNSWP45A=;
        b=UYpQdNiaYCz6pIMdF4dkWEFQXDTlolhheGSQskxUceRI8Cnl4bU3ZnF7lL/iuZQf4d
         9iKgsekkhe7ySaNyGeSN/8XXRFeNIVU1hJ3kNb7LUeDD2mrFXgDOsUjumI3g0VF7vNkm
         39M1O1InQm9dPGTIVdY2n/Ago15B9Q49y1jblYZKHrV2NxiBkvV8OGQOSmX7A7SSdTzd
         kG/injR8sjWOGFVeEIKX97PypMLnkUj9pjsXSia0MKROFTILXjO02u1vpH7MYQfI+7YS
         pQO7zhK2CEv59sAvE+D1yzFUNKEBnWev2m6sbqjiy4sq//ny99yg3d0JyNgQRwmFrAMf
         oTZw==
X-Gm-Message-State: ABy/qLYwaGJPxi/++AgwDOJeJ13LE+N9REgxUXcZNH24clUpilt8PPOu
	midc5cZQ1HLudBwTwQNetYbkBgscI3LMkg==
X-Google-Smtp-Source: APBJJlG/dKTUsmg5aVgYOOKT57iAEfzRYWd3EIUV8PxB67zBDvpuDC5gZXXY9vu1D3qObHTNSnMigQ==
X-Received: by 2002:a4a:b206:0:b0:563:3b56:5dc1 with SMTP id d6-20020a4ab206000000b005633b565dc1mr3811719ooo.0.1689351508020;
        Fri, 14 Jul 2023 09:18:28 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:313d:de97:6253:5730])
        by smtp.gmail.com with ESMTPSA id t5-20020a4aadc5000000b005255e556399sm3648104oon.43.2023.07.14.09.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 09:18:27 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] u-boot: Switch to nobranch=1
Date: Fri, 14 Jul 2023 13:18:22 -0300
Message-Id: <20230714161823.20685-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 16:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184273

From: Marek Vasut <marex@denx.de>

U-Boot 2023.07.y tags are not in the master branch, switch to nobranch=1
to be able to pull arbitrary commit from arbitrary branch.

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 56f9be010793..29beac4c1127 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,7 +14,7 @@ PE = "1"
 # repo during parse
 SRCREV = "05aa6516c6bb419d01d69fac457c0de563bfd694"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;nobranch=1"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.34.1


