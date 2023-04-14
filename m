Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EDCC77B79
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 15:55:22 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.14260.1681487715905714925
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 08:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YCEBVWEN;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id h24-20020a17090a9c1800b002404be7920aso19082152pjp.5
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 08:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681487715; x=1684079715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EUGqrRJVF0Fp9silHTVBCU+qW05koc5IWfzjv5+KDdg=;
        b=YCEBVWENdxjfBHlEOXPp/eVxkLCkRlHWPlw0RjpQQc15ZJ5wadSp1a9parY9PpGf8O
         f9IgHlNCvXKoSIbBA/AnFy0p/+izS7O94rgJtu4Iu/DoucRe4Emk8G3p/AKMrqJBBSBB
         LCzF2vRuH4qMBeihG+EzmQwd00O84kdiii2QVfUgBGH5MoY/XIpJHV60E0M2WcLvIFsG
         L+iV7/G2rS5iAGqjP7eL6QABsqqfbPZTe9PHedKcjdE0Jb64Jix6H1tu/x+emh6fUZN7
         SyoaQTM5rj1F2fwvbveuVAaIdlG6xfHZZuR44aEcH0tzWQHMjQnNdhBy7Y4IjSC0tLJw
         mfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681487715; x=1684079715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUGqrRJVF0Fp9silHTVBCU+qW05koc5IWfzjv5+KDdg=;
        b=QdSHB56vymiInk++y7FVJOpnb3R2KentC+xSiJIkQ89MQUgoRLwr95OGEPYStA5lXU
         3CedmcsHimUqO3reme8+7Tcy0A+8BSyTrKOuAThCERSxFudLFKdAQYisgaMle6xPmmVm
         7Y56YUl86fSLXUJ9wWDH1r0FSWe7756PIi8vCuAQ0oOv1WNCKhgGfMeNh9L13YRS8ljV
         Du6s4FegTiwlalLpPHq3NYlTfrrnNjFLhM3luM7wALWMf5dsoV6+XUHQQRSloRPUix9p
         8kUJWO/AioDJmxndQBI+OToNiRXYmjAnONDdrGVNstcboScq1uEl8bySGQhaL/JM1l/9
         jN9Q==
X-Gm-Message-State: AAQBX9cpCdALGb8bucr4HGv+128azkS2taHDOLVI+cz+3LbhCecSVUQq
	3hVCR6slejb6jAV/YoQrSQLbCgQ9C/s=
X-Google-Smtp-Source: AKy350ZFtf9CXYfHpgwlNl9uH4oUi/wzZVlxgCESjk0kpEwe6C2Qmx9Jx6xEzBSbWy2aTaIU0hCC0Q==
X-Received: by 2002:a17:902:c40e:b0:1a2:9994:c340 with SMTP id k14-20020a170902c40e00b001a29994c340mr4013864plk.46.1681487714737;
        Fri, 14 Apr 2023 08:55:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id u3-20020a17090282c300b001a1c721f7f8sm3218900plz.267.2023.04.14.08.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 08:55:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] gawk: Disable known ptest fails on musl
Date: Fri, 14 Apr 2023 08:55:10 -0700
Message-Id: <20230414155511.91980-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 15:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180001

Add needed locale rdeps on musl as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Delete failing tests on musl

 meta/recipes-extended/gawk/gawk_5.2.1.bb | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.2.1.bb b/meta/recipes-extended/gawk/gawk_5.2.1.bb
index e381bad148..bbb26231a1 100644
--- a/meta/recipes-extended/gawk/gawk_5.2.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.2.1.bb
@@ -62,8 +62,21 @@ do_install_ptest() {
 	rm -f ${D}${PTEST_PATH}/test/timeout.*
 }
 
-RDEPENDS:${PN}-ptest += "make"
+do_install_ptest:append:libc-musl() {
+	# Reported  https://lists.gnu.org/archive/html/bug-gawk/2021-02/msg00005.html
+	rm -f ${D}${PTEST_PATH}/test/clos1way6.*
+	# Needs en_US.UTF-8 but then does not work with musl
+	rm -f ${D}${PTEST_PATH}/test/backsmalls1.*
+	# Needs en_US.UTF-8 but then does not work with musl
+	rm -f ${D}${PTEST_PATH}/test/commas.*
+	# The below two need LANG=C inside the make rule for musl
+	rm -f ${D}${PTEST_PATH}/test/rebt8b1.*
+	rm -f ${D}${PTEST_PATH}/test/regx8bit.*
+}
+
+RDEPENDS:${PN}-ptest += "make locale-base-en-us"
 
-RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us locale-base-en-us.iso-8859-1"
+RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us.iso-8859-1"
+RDEPENDS:${PN}-ptest:append:libc-musl = " musl-locales"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.40.0


