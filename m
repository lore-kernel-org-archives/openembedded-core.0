Return-Path: <ecordonnier@snapchat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54BBC54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 12:37:59 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.4095.1663072671709696487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 05:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snapchat.com header.s=google header.b=R6MLFLg0;
 spf=pass (domain: snapchat.com, ip: 209.85.216.43,
 mailfrom: ecordonnier@snapchat.com)
Received: by mail-pj1-f43.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so11223221pjl.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 05:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snapchat.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=1Q09A8lXx0R3zXFSBhgbPyhIWtrPswSPSdR22q6ZUWc=;
        b=R6MLFLg0ZW6Ghw1D9YtRpqE+5TNmtkWhLm5zKubcLKkwL/2WX8Cz8WE8LfajkF+Hx+
         Vp4u9CgDYTZHhQesTVY/r5XjoeemW08oHczS/COo9sP8YOVmeYd4Mhtum1foBqLURnCr
         +YDdnuMyvZ8drLE30cAeOr7IcfEkvS6jpW2DI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=1Q09A8lXx0R3zXFSBhgbPyhIWtrPswSPSdR22q6ZUWc=;
        b=yWcmF3+gHTAaY+k6C8cVDfsZv6iKOX1tAOXtnIoVyHglZWBUYyGsdXx4IX9ogl06iu
         Ld+bhC2gIrfsWLoLaKiOxym3xmKXPQCLj+1VpDq8mWATmQj/6bviCVLmtoKoSFq7QK/p
         S6FVZsW+F0hkm/itkAB0lEZLJb5uzefL6VjYjyfucUtG5ApBy6UKcfZP/DPYvb9Qg4Xe
         TTI0/MiZKB4GOUiVw91yQMf9F8l82YgIrAeCHRv7NPG4X0Qyj9APSonMQJNhDUV0YdWr
         2M/tzhnEes8+zhGnlK0mXO92+xDw705N+TZiox706tc0yJg67wJFK9enyaarJahgjxBr
         wK+A==
X-Gm-Message-State: ACgBeo1JN2tQaIZO/VFpDGJ1r854q3J/rzSwDITo+qbxJ4G5z1q3LyIB
	GXjMjTb+djCL11WZ94HNM6V9ydSQTQddOafM/wc=
X-Google-Smtp-Source: 
 AA6agR7mKJiDpHN8tyjmkea5YFLEDQ7liSWwwdRT5bPZWu83dq3yLtmzdGWUU1Ze8+wPg8M1beRB9g==
X-Received: by 2002:a17:902:edd5:b0:174:a6e6:51f4 with SMTP id
 q21-20020a170902edd500b00174a6e651f4mr31851780plk.82.1663072670594;
        Tue, 13 Sep 2022 05:37:50 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.26])
        by smtp.gmail.com with ESMTPSA id
 x8-20020a17090a46c800b001f319e9b9e5sm7074888pjg.16.2022.09.13.05.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 05:37:50 -0700 (PDT)
From: Etienne Cordonnier <ecordonnier@snapchat.com>
X-Google-Original-From: Etienne Cordonnier <ecordonnier@snap.com>
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Alex Feinman <afeinman@snap.com>
Subject: [PATCH] opkg: enable zstd support
Date: Tue, 13 Sep 2022 14:37:41 +0200
Message-Id: <20220913123741.3416807-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 12:37:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170575

This allows the use of zstd for opkg packages by using OPKGBUILDCMD:
OPKGBUILDCMD = "opkg-build -Z zstd"

Signed-off-by: Alex Feinman <afeinman@snap.com>
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-devtools/opkg/opkg_0.6.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
index 7b351e8123..e38d9d6f3f 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
@@ -30,7 +30,7 @@ inherit autotools pkgconfig ptest
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR ??= "${target_localstatedir}/lib"
 
-PACKAGECONFIG ??= "libsolv"
+PACKAGECONFIG ??= "libsolv zstd"
 
 PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
     gnupg gpgme libgpg-error,\
@@ -39,6 +39,7 @@ PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
 PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
 PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
+PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
 PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
 
 EXTRA_OECONF:class-native = "--localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
-- 
2.36.1.vfs.0.0


