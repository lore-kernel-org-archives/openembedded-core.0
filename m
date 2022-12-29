Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE68AC4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:22:02 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.208892.1672330912473140294
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QecaLsIB;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id g1so13087293edj.8
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 08:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbg3zeA7g5BVYnSCZsk/xmqtO93Ok+77i9hGkdqz5GU=;
        b=QecaLsIBCvBU/CwcQKEwSra3GIQ013shTi7AQafwyUsLTP7W3j1unUPgp9Trl6vU2B
         Nair0ZxGFtG4UsYKNfIAZIsb7+wTOSw9lFB0J/INCS8osfr8R52Nb+nWW0eTn6aZl0Jg
         jHmQeEjq1jgeRHnkkOger7AFNqf+UcPofIFi1i9PPT9BZfLfjXhaIE7fkYFQnnQJB/Ua
         QuoPiahb/dbRPO6hesIsr2R38+TG69DVRCVnrg9QK4RY+GVM6iT4+poTP+XXcmVkFqNb
         wEDcftubr9iRa4B+r5nJ6LAfta0UQh28HYoabPJmjPeHz5HeTSBRO0LWL0nhjqFmNOWz
         pFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbg3zeA7g5BVYnSCZsk/xmqtO93Ok+77i9hGkdqz5GU=;
        b=lTE/GA+vYcW212pvxNT0ZeU99IqHaLq/nJWxPy6O62HGqmVLT8AcgNHdkIc9zTCgHV
         lNoLbJXKOWBgisXVdZDZw7nKmBQgSQQ2lQDJ6/dgfz6PWdHojh6rVegqLDOTEknd+YR5
         HbWu8I4GNxA5wD5B4JJzTljXFKlUoAyHD9ZkksVDowOsbdGr6Aoybor0oGzAvkek03qE
         psBIMaX5fmEh5++GeXLrG9qBp/AAXRWAU27BScnQtV3pl9JLEySJwm5iT+6x696AW98B
         IlGxUUe0jbDFMwu1OC7RPNkDowzx8GoWRehelmi5+8eeeczy5mmOND4aP7ZID9xeFtpw
         /qUw==
X-Gm-Message-State: AFqh2kr0Swycf8feT8TSS5SjwKCTZkatvSPWvln01Rw2Sv5mKUYBD7Ew
	xKjSp6oe7+qT7ZLZXaN20Eq8h5F/IlY=
X-Google-Smtp-Source: AMrXdXukKGd7rMASwJV5uUadHHcjZzt4A3ogrh0EnS2j9tyzsGa5vUFgJge2EGvPFbtp0eAqZPpkFw==
X-Received: by 2002:a05:6402:240d:b0:46d:731f:d726 with SMTP id t13-20020a056402240d00b0046d731fd726mr28270263eda.22.1672330911002;
        Thu, 29 Dec 2022 08:21:51 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v6-20020aa7d9c6000000b00487e4d93863sm2675503eds.22.2022.12.29.08.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:21:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] nativesdk-rpm: don't create wrappers for WRAPPER_TOOLS
Date: Thu, 29 Dec 2022 17:21:32 +0100
Message-Id: <20221229162132.1256730-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229162132.1256730-1-Martin.Jansa@gmail.com>
References: <20221229162132.1256730-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175119

* environment.d/rpm.sh sets the right environment in SDK
  and we don't need to use them

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.18.0.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
index 152cab490d..8eb0ab207e 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
@@ -117,14 +117,6 @@ do_install:append:class-native() {
 }
 
 do_install:append:class-nativesdk() {
-        for tool in ${WRAPPER_TOOLS}; do
-                test -x ${D}$tool && create_wrapper ${D}$tool \
-                        RPM_CONFIGDIR='$'{RPM_CONFIGDIR-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm} \
-                        RPM_ETCCONFIGDIR='$'{RPM_ETCCONFIGDIR-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bindir'))}/..} \
-                        MAGIC=''{MAGIC-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}/misc/magic.mgc} \
-                        RPM_NO_CHROOT_FOR_SCRIPTS=1
-        done
-
         rm -rf ${D}/var
 
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-- 
2.39.0


