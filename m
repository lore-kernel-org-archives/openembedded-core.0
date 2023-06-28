Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB42EB64DD
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:24 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.7295.1687919420566473841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Vq/xpPl8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-666e6541c98so5128558b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919419; x=1690511419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VkgDxOLJ3Os3D9EaaMghO7hnOSQPrv/NmAUbDJWxXQ=;
        b=Vq/xpPl8gSNGXTq4TWHhBYsfwb2rXnKvVMAAhVL7Y5MftOHudiNuAuoDBHEcq25xV9
         7m17Z4koXr9ne8TQENJi2Ll3ksxlNCegPIAMFA7z/tTg7vz4+eZi95JYE+VKwWLFIQnM
         jpI7sDXpAjR2PGPBTTC+IGOGoTqzj5dUpD0+UfWuJsMZpHOsdPTtrkAZA46m2s2l55gc
         jVwOYY7LHnB85YpHk2HzR54dmIfooLxbNsTdRHj5MABOkEboaxkEFTpwzj46p/dkbrLn
         o2JcOC2SiuGAADs1rny29YLst/p6JfTagns3oXQODImdbOsXmB6B4dhAtNcnofqpnG42
         tt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919419; x=1690511419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VkgDxOLJ3Os3D9EaaMghO7hnOSQPrv/NmAUbDJWxXQ=;
        b=M+uI71AXteCSKTxIh1q11H5ztCYY/p0OOdvBjqW6zOTJP1apKrruTbxPwvsD7Trihq
         BduGPaibpLJEEglOd0F7ek03xH5ieHUnBpy9Md831glRPGLqKOR+TlJkdBbNjTHC8q0k
         VnCKieX3oeNldwckFObOejLL7Qmgsceyc/x5t/eqmTxpzqorfuLkOCakUuDo4hJVEpc7
         NK4yRsKkDC/3aiMiMABKZXbQb9WAk2M3KQj33CbC3yQhrRAmo4yuacZTH3VD6v3PCYXj
         1Rs38n6eWKjsnTnr0XCe4wkXshH7EBfngzPkeezYQ91aiJUCR3ym1B7PDuChU4J6lPGK
         J6eQ==
X-Gm-Message-State: AC+VfDxHDpN1zcGHkualGI4dIG7ajATs+AtlZa0C/iuW2QszhRqOebxC
	JZoC4cNr9m3aC7+W0wWt37IhxT7eyEH2s8W/ACZZHg==
X-Google-Smtp-Source: ACHHUZ4krXBIQwO5v8Tltyc8izX6sAn7hLiXik/KlS4swk1GSGTwnLt/Gh8O13gaIYCzplPRELT/5g==
X-Received: by 2002:a05:6a20:3d90:b0:12b:e9a0:f015 with SMTP id s16-20020a056a203d9000b0012be9a0f015mr2503263pzi.17.1687919419528;
        Tue, 27 Jun 2023 19:30:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/30] pkgconf: upgrade 1.9.4 -> 1.9.5
Date: Tue, 27 Jun 2023 16:29:31 -1000
Message-Id: <046e33769121aee169ffb6c790a880dc420a5a76.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183524

From: Ross Burton <ross.burton@arm.com>

Changes from 1.9.4 to 1.9.5:
----------------------------

* Fix incorrect assumptions involving the use of ctype(3) functions.
  Patch by Taylor R Campbell.

* Fix detection of provided functions on autoconf.
  Patches by Harmen Stoppels.

* Fix deletion of tests/meson.build by the autoconf build system.
  Patch by h30032433.

* Fix quoting rules in argvsplit.c.
  Patch by huyubiao.

* Update libpkgconf documentation and documentation building scripts.
  Patches by Andrew Shadura.

* Enforce maximum package count correctly for --modversion.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fb9e05592e7c1c61a677d9cb842c9adc84689dde)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pkgconf/{pkgconf_1.9.4.bb => pkgconf_1.9.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.9.4.bb => pkgconf_1.9.5.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.9.4.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.9.4.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
index ab0f371093..4bdf03c574 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.9.4.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "daccf1bbe5a30d149b556c7d2ffffeafd76d7b514e249271abdd501533c1d8ae"
+SRC_URI[sha256sum] = "1ac1656debb27497563036f7bffc281490f83f9b8457c0d60bcfb638fb6b6171"
 
 inherit autotools
 
-- 
2.34.1


