Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C6EC77B7F
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 22:30:38 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.58543.1682807435071036375
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 15:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=naf/wKsl;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5068638856dso204525a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 15:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682807433; x=1685399433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YseuYVoJ7HIkjRuETEsihYNXYw843628UAxVHeAGmbc=;
        b=naf/wKslaaG+BmL5HJOPIeRosN5arBwXlpMfzBObGNrN1BGtmcVtI+0Nb3vtyCBUno
         R6POlpAsXWjaIi7c5mrEXPCeNA6miaxJSe952YMp10/+UIQQeHPTYp3tK1pQ9bkL8s/A
         od3gFgtRlTkolgR4Kb1aerKhFdhxs15L+cuVNFPN6RI7mT7PsGT/KmuJU2LSQk8+0OJJ
         D0Tf/sMVrKvg+pJW94Y5oK7rhrWpWFf40wxSghAn5mHHHp/4rFJ+UgHmyd2o6u55XvFT
         zPQU/MLk3BLeofTDC9KdlmDa5e/n0dI/FHtorD4h6xcnx3w0c25/BlSGY2L3B3Ps1lbk
         2Khg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682807433; x=1685399433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YseuYVoJ7HIkjRuETEsihYNXYw843628UAxVHeAGmbc=;
        b=iA/HlHcQFKp5tW10DjV8oT3PqtmcCz8jUnCmDRevtCgEjHIwnAualkzIE7SKcmsCDg
         qZVw880iMbbjVGrI7gNNtUqLFBsqUCYMlFr6nsXXBjvuvgO8yFTMCYcslcYQnwqVFKkY
         1Bx+QQBAlLyiPCqNE0mjmgjaKHemROEhlBVxCcyvWs8yZQ3M+KWaK2+Sx84iULgiYwyR
         r+oF4/GSoyhlJ502GKHmH3m1h2Yw2W9EiJp5WDIYQrMEM9qfGpyYU2IZypYcoGzdJRpD
         IFVyjV3H+GDqh/gr23s2819Q+IvMtwTLGMcxZO9BipAWNECaPRyp1I7elEeVMVNCX9DZ
         3Trw==
X-Gm-Message-State: AC+VfDyYZu+O0PIbqntA2NuBlf4tTKY5R/dKF8ZSQWbhyS1euYS9QN1U
	cUN20xyiEPgwFP8YxO5hVPdsYfJ1LNs=
X-Google-Smtp-Source: ACHHUZ5VtUQ2iRr2DgxvVhsXET4j2iPW/iSOSYqSFxqVQQFN4ITSbLVT/xntLhL9+2GY/1DLIm5HgA==
X-Received: by 2002:a05:6402:5254:b0:502:c397:adc8 with SMTP id t20-20020a056402525400b00502c397adc8mr7773878edd.1.1682807432992;
        Sat, 29 Apr 2023 15:30:32 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aec7a.dynamic.kabel-deutschland.de. [95.90.236.122])
        by smtp.gmail.com with ESMTPSA id i17-20020a056402055100b0050685927971sm10600968edx.30.2023.04.29.15.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 15:30:32 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH 2/2] kea: upgrade 2.2.0 -> 2.3.7
Date: Sat, 29 Apr 2023 22:30:07 +0000
Message-Id: <20230429223007.86655-2-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230429223007.86655-1-changhyeok.bae@gmail.com>
References: <20230429223007.86655-1-changhyeok.bae@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 22:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180561

Fix buildpaths issue.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../recipes-connectivity/kea/{kea_2.2.0.bb => kea_2.3.7.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.2.0.bb => kea_2.3.7.bb} (91%)

diff --git a/meta/recipes-connectivity/kea/kea_2.2.0.bb b/meta/recipes-connectivity/kea/kea_2.3.7.bb
similarity index 91%
rename from meta/recipes-connectivity/kea/kea_2.2.0.bb
rename to meta/recipes-connectivity/kea/kea_2.3.7.bb
index 2c2e5a74dd..8335629474 100644
--- a/meta/recipes-connectivity/kea/kea_2.2.0.bb
+++ b/meta/recipes-connectivity/kea/kea_2.3.7.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=97ce14bdd2733f5b84ab5e29380d057d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -18,7 +18,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "da7d90ca62a772602dac6e77e507319038422895ad68eeb142f1487d67d531d2"
+SRC_URI[sha256sum] = "3aa58fd8042ce49a502ddaa5fa88f5700073ffe03ff967e9f9b7cc32f58cc65b"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
@@ -46,7 +46,7 @@ do_configure:prepend() {
     # replace abs_top_builddir to avoid introducing the build path
     # don't expand the abs_top_builddir on the target as the abs_top_builddir is meanlingless on the target
     find ${S} -type f -name *.sh.in | xargs sed -i  "s:@abs_top_builddir@:@abs_top_builddir_placeholder@:g"
-    sed -i "s:@abs_top_srcdir@:@abs_top_srcdir_placeholder@:g" ${S}/src/bin/admin/kea-admin.in
+    sed -i "s:@abs_top_builddir@:@abs_top_builddir_placeholder@:g" ${S}/src/bin/admin/kea-admin.in
 }
 
 # patch out build host paths for reproducibility
-- 
2.34.1


