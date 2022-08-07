Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C3CC3F6B0
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 22:26:23 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.18965.1659911177530587862
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 15:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eAdSdGsI;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 12so7110228pga.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 15:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=rqjFviOTyz3rrev+vEE0p3IYaFtkKVYq9zjp1EXxdrk=;
        b=eAdSdGsIdBz7HdSxDDfumy4G6jnhCdchIZjazUmMrwhoBQVRX43ZO2Otj5Y00aJDSV
         V2e+JRANJ6s7f4KDyhO5yJQPBWkDu7RhM+DA8Q2jpIPiHCIFwOex8shYSiM/FtJkALvM
         NORRLcYXklEYW5iqF7cAmTQWmmubJV4lBocTtmOU1NycU/Xld5mt8khCpdumTec3XRXT
         KPqAByg0Ova+6VNSk0Gn7sq4hwdjfmxFIcUYY+0/Se4k07oEZ54eN78H/+eZ9rqa/jft
         GexfiOPp3IP72PazxMh5OhAaxgPKmY1JfyT76Fhzqy7hZOFTLe+/kgR1C+GXg3qQ8I/U
         a1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=rqjFviOTyz3rrev+vEE0p3IYaFtkKVYq9zjp1EXxdrk=;
        b=2hmLY+tUKyTJtnwGRDgFtzxTYT6H0UkvNx0r/uSX5m37umRrVhdQQidvlyD20Ljos2
         s7mH8DaqZ60ThkE97sTSsIw8N9TN5Eyv89QPtwhAeFet1GbY1bm4VAunvP5S510jj5Ih
         2ZX5mqOLPYEwe5xlAg/SrOfetuUMHcULQVqvUazkSTor0ZiqVuydvAqam2BATLWt302k
         1HPAqeVZiV/XZvxA+5F8iyT0VUmu2Kg2GxXYnCdnMIV1gt3qPtNfr7kDIsoHP2Lq+Y+D
         IAv6Cd1jp5NXZJ1XdoYamCHPDVMP91oU6FXp/khX2R9VD00RO1hxOs3pRLN9ud0Gbwzx
         uwzg==
X-Gm-Message-State: ACgBeo1kypx+2QGMjbgGYOQt38riUqEmGBl0ySh1mxzX14dTQNvjyARv
	8nb+H8n89h3WV4anHKx6FcsdMacRQaM=
X-Google-Smtp-Source: 
 AA6agR40cXlOLS8imP8Gr6ZlxFeB9K3eTdLrtMGqnfFs10dsVpEA24SBWf1sC0KlttsfjHFg/UO9dw==
X-Received: by 2002:a63:db17:0:b0:41b:8e02:3e80 with SMTP id
 e23-20020a63db17000000b0041b8e023e80mr13612309pgg.235.1659911176349;
        Sun, 07 Aug 2022 15:26:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 n6-20020a170902e54600b0016d773aae60sm7181776plf.19.2022.08.07.15.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 15:26:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils-cross: Disable gprofng for when building cross
 binutils
Date: Sun,  7 Aug 2022 15:26:11 -0700
Message-Id: <20220807222613.1173589-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 22:26:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169007

This does not work in cross settings yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-cross.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 02ec891606d..835d4fa69b7 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -16,6 +16,7 @@ SRC_URI += "file://0002-binutils-cross-Do-not-generate-linker-script-directo.pat
 # and mean the linker scripts have to be relocated.
 EXTRA_OECONF += "--with-sysroot=${STAGING_DIR_TARGET} \
                 --disable-install-libbfd \
+                --disable-gprofng \
                 --enable-poison-system-directories \
                 --with-lib-path==${target_base_libdir}:=${target_libdir} \
                 "
-- 
2.37.1


