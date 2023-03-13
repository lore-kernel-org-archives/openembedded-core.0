Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110A1C6FD1C
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 11:06:44 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.17031.1678705602890399046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 04:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iPZVivq6;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id r18so10911950wrx.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 04:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678705601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L9z6H/N8oRmCzEjXmFIBgCkHBZT8DiHxDfA6zpJmyHQ=;
        b=iPZVivq6pfVdX7NHh67ORrcdI2IE8pES0+xtVYWy5Toj7ix2+G2+gm8JsY+7ShBYsV
         YYNH2tjln6KRsrVpdFCR5pvbZtUZuniltGiDZpVdSrMGhT4qp1D/d5+F1Opkm2DQkaXZ
         c5EBabSqG6g2XwPNiZvm748YnimMeQjIYXpyVt4MDz7P5qfSlN50tiWL+X/2ZRdZv8Wc
         TDJH4cYTp2+SwTymYRwHrFBC1wVyVYKC5e7AAACfqouZGAnhN+DM4H4AamtFxGhFtVc4
         7HrJzYY99oS+Cias3Bl7zKSamKea1hwHPCcUP9+3y81yi/S2rqq4KsGveTnHuqukTGTA
         Nj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678705601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9z6H/N8oRmCzEjXmFIBgCkHBZT8DiHxDfA6zpJmyHQ=;
        b=UbZQ6HMq0BHosO9UTO+AMoJoSxEI3zK5wvGhITD3axSVTpe2ZVtfsa7MR7tsRnqQyP
         5Dod6Ycmf/FF/03OX3bloRAXqu2F0o7hpoAIs48MJ2S3nRpxehh4qWcLS4S0bnMLHsZM
         HqpVa9fF4hr3dp9lJ7lpRJO2dExDZ6Dus3P31TNNEfjcrLGAXVGfaDfsSNfJXycWxcRg
         FTF7H3nVxMdXwaFmZAPeixtMF50bU2T2ImhigTgUcu7KssNmP8OaHGme4ojiY47GK4t7
         Na2UZAGJ4Kkn5rPx1ImwC97DA/HvLUTLW36q60nvhZqseGHNvCufFqayM1juGENOwg30
         1ctQ==
X-Gm-Message-State: AO0yUKXZ6vuk3V9eU9eEnyheQmgjkSy29mNPIWnYzrXE/ZK6V+ROiwf1
	PKNUwiWlFcsiybxhEkKsQcsAFdZyKeE=
X-Google-Smtp-Source: AK7set8vKT5tBcf/pwwAE5Up6yhMdBFWWQw4A4FenkG4hx47/TmLp/egaZ92r0IhPWv472UKNOLImQ==
X-Received: by 2002:adf:e343:0:b0:2c7:f56:285b with SMTP id n3-20020adfe343000000b002c70f56285bmr24487504wrj.63.1678705601156;
        Mon, 13 Mar 2023 04:06:41 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d4e0e000000b002cde626cd96sm7660873wrt.65.2023.03.13.04.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:06:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] timezone: use 'tz' subdir instead of ${WORKDIR} directly
Date: Mon, 13 Mar 2023 12:06:30 +0100
Message-Id: <20230313110631.3591204-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 11:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178429

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/timezone/timezone.inc     | 6 ++++--
 meta/recipes-extended/timezone/tzcode-native.bb | 3 ---
 meta/recipes-extended/timezone/tzdata.bb        | 2 --
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 1834665a1e..eec7177228 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -8,10 +8,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
 PV = "2022g"
 
-SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
-           http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
+SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
+           http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
            "
 
+S = "${WORKDIR}/tz"
+
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
 SRC_URI[tzcode.sha256sum] = "9610bb0b9656ff404c361a41f3286da53064b5469d84f00c9cb2314c8614da74"
diff --git a/meta/recipes-extended/timezone/tzcode-native.bb b/meta/recipes-extended/timezone/tzcode-native.bb
index e3582ba674..d0b23a9d80 100644
--- a/meta/recipes-extended/timezone/tzcode-native.bb
+++ b/meta/recipes-extended/timezone/tzcode-native.bb
@@ -1,10 +1,7 @@
 require timezone.inc
 
-#
 SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 
-S = "${WORKDIR}"
-
 inherit native
 
 EXTRA_OEMAKE += "cc='${CC}'"
diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index 7f4322d867..ce725008c0 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -4,8 +4,6 @@ DEPENDS = "tzcode-native"
 
 inherit allarch
 
-S = "${WORKDIR}"
-
 DEFAULT_TIMEZONE ?= "Universal"
 INSTALL_TIMEZONE_FILE ?= "1"
 
-- 
2.39.2


