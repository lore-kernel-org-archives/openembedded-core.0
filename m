Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CA8C0015E
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 09:28:19 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.17713.1688635695734466466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 02:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=g0G0JX1K;
 spf=pass (domain: baylibre.com, ip: 209.85.167.41, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f122ff663eso590437e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 02:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688635693; x=1691227693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HJlC9TT9RzNWeT6OkDZiHB25RplwHbmvzDpyuukWDM=;
        b=g0G0JX1K8Ebg3L/GFGKtVgqPLIuKtJl82r21dUag0xbsD5WXsOJYZUh1O99+HdDjCx
         SwPbRVkeIYiLBiBlpmUkl4kS8GMlJn6dxA9HJZuTQF+0Js3hHNxF5jPQGrxVrI7TNi75
         bZhIbPCMzlYTY0mjg2UhLJl5VH+Uc75Im0C4n/SzcRf0Sbe+jnMGw6EWoFBuoX5XS7HG
         pS1yF5MX7GivKp2mOnXWjRcqj9EWWclKXhGd5+MdrKZkQrPMDUVROfFoqwYjrFBuQA/b
         SYqiJpOG+Gc5kJ1C5SRVo0dHBZNPzjlGuwYmYqOLcv6P5j+IC5RQDvykn96zxKeWlq9z
         A44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688635693; x=1691227693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HJlC9TT9RzNWeT6OkDZiHB25RplwHbmvzDpyuukWDM=;
        b=DFS+8Akts6PW2Dp1IIvJzNbCMkUEY6ssvvXvnWoWTvZGx1avJyKgdt3uKQFZU6q6KF
         eub9pa+4PEnBAJUmVY0iFjm0nBgTpF/m1v1puNrpLZy3oc1DOgAUrmWzPC6D2ZLcp1nV
         +/sgbldiKQ0WEg66a/eJSi7olIhyoc982jngGLuJJzn8rWr5k0LiCCatcuhm3EZbnZ5i
         N4/dM7ZeqwMSxFBgSsYYIgbI6qYbeONC2r8fZolKksEOZvYdCut5k0p2iLA9upppwV0V
         A7n8neabH1L38WngEM18sPcqIsLU5KGgOb8Ju8KelDfMA7eucO3ZXYBGFEmvp2ICGohJ
         4w+A==
X-Gm-Message-State: ABy/qLZHVIj8lHH0c0h0sUhZddij1bYXBJqMRJiq62o9h6/YlPUNZ1PV
	yP/ja6hgfotoIWxIT2NwmfUdsYU9AxcuWuKFucCW7Q==
X-Google-Smtp-Source: APBJJlFUndY5z/vthdayW+G/h02bYsLVoPJQv7NkXPg66bAjw3lb2dvLNlDdwxvvLhX6QVkDcWEazg==
X-Received: by 2002:a05:6512:4025:b0:4fb:90f7:6769 with SMTP id br37-20020a056512402500b004fb90f76769mr1211899lfb.21.1688635693441;
        Thu, 06 Jul 2023 02:28:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id p14-20020a056000018e00b003113ed02080sm1339926wrx.95.2023.07.06.02.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 02:28:13 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 1/2] less: switch to github URI
Date: Thu,  6 Jul 2023 11:28:05 +0200
Message-ID: <20230706092806.507075-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706092806.507075-1-jstephan@baylibre.com>
References: <20230706092806.507075-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 09:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183920

as of today, release tarballs are fetched from [1] but the less test code is not
bundled within these releases. A github issue has been opened asking for
maintainer to bundle it [2]

In order to add ptest for less, switch to github URI. This commit can be reverted
if release tarballs from [1] bundle the test code in the future.

[YOCTO #15073]

[1]: http://www.greenwoodsoftware.com/
[2]: https://github.com/gwsw/less/issues/344

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/recipes-extended/less/less_633.bb | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/less/less_633.bb b/meta/recipes-extended/less/less_633.bb
index 2defb5ccb7a..e6535d16a78 100644
--- a/meta/recipes-extended/less/less_633.bb
+++ b/meta/recipes-extended/less/less_633.bb
@@ -23,16 +23,23 @@ LICENSE = "GPL-3.0-or-later | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://LICENSE;md5=1b2446f5c8632bf63a97d7a49750e1c6 \
                     "
-DEPENDS = "ncurses"
+DEPENDS = "ncurses groff-native"
 
-SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "git://github.com/gwsw/less.git;protocol=https;branch=master"
+SRCREV = "0d7ca880375bde651313f03f7115d26921b43722"
 
-SRC_URI[sha256sum] = "2f201d64b828b88af36dfe6cfdba3e0819ece2e446ebe6224813209aaefed04f"
-
-UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
+S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
 
+# According to the README of the project when getting code from git we should run
+# the following command before running the configure script
+do_configure:prepend () {
+        cd ${S}
+        make -f Makefile.aut distfiles
+        cd -
+}
+
 do_install () {
         oe_runmake 'bindir=${D}${bindir}' 'mandir=${D}${mandir}' install
 }
-- 
2.41.0


