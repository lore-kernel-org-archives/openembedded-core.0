Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FFDC001DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 13:09:50 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.21760.1688648983166222702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 06:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=HM1Q8gKP;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso7260435e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 06:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688648981; x=1691240981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HJlC9TT9RzNWeT6OkDZiHB25RplwHbmvzDpyuukWDM=;
        b=HM1Q8gKPckiXI5zKsU4NP7kXVDgha2EA6DJPfifVrSEv+z544VExxWi2cz7t37ofg2
         N3r3LzbDCl/JP2a7Kv9ugaK3qkTfg42KvvszcdXeMU5iwtudgcESo6RXqzULKKRhb03p
         aVFuuN+oGmOxZhlpBI9vWSNh8rz5+JxNxou8ClTLdaXlGR4ML6DuRC7MmGQFxk414+od
         vwkW5+ToyEG8FqvtVHuNPatL5Bh0lHeeupq7rl/WSQ30CyOV8ijGSBY7fLctKtGm8piR
         tFROFJGJR0G6pbfsYxwiffvC2h6DUy1Fq29Yx5dfFI/YfAA9fDOMoV7/TnZbPRwDtzSn
         EhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688648981; x=1691240981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HJlC9TT9RzNWeT6OkDZiHB25RplwHbmvzDpyuukWDM=;
        b=XmL5p/2OL1Biz7mTumCOXJj0RE3lrXi6lMVGG0U3aoIc2dKi60h9lX6GQ2/hk4C97W
         j8Isw0uqVzwIzKmBuzkk82gCjmHrV976pmVygIcSmfn2R7Y52lc522EiYcEpGuy8/wr+
         FSWxRnUqncCXnR/gz3oNAfcgpYLDQy2G78b3pw1xOAM2iT0cIFwiyii/isa2cG2ux5Rw
         WBVF8i2iXsag5wDMgIp6P54XEWiHE3ACx0AY+0U5ooh3w1VM7EBOezdZOPA7YwK1XPa8
         4RuxL5x8bA36FAkJwR6h5Fxqo7OkmdlFfD0cud3MJ9z/DEyRbMsoY8dbsRhdvCOM+7SQ
         RcCQ==
X-Gm-Message-State: ABy/qLa4dXhUC1uTPoZu7fAq6ZNCsnXjoKGZ3GsIifxULL2lcHQZ+DmT
	1+rWVY6y/YySlWBYyVXudr1LVJx8CIvGPT7J2XO7ZA==
X-Google-Smtp-Source: APBJJlEr2C6LZGvpm1qeuvaurOFL4DCTKiA7019Y12mi2FOE4MNYoQZsjRR5DJn//INvgkRiEeRORA==
X-Received: by 2002:a05:600c:b45:b0:3fb:bc6d:41f1 with SMTP id k5-20020a05600c0b4500b003fbbc6d41f1mr1364542wmr.17.1688648981370;
        Thu, 06 Jul 2023 06:09:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id v13-20020a5d43cd000000b00314427091a2sm1828419wrr.98.2023.07.06.06.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 06:09:41 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v4 1/2] less: switch to github URI
Date: Thu,  6 Jul 2023 15:09:33 +0200
Message-ID: <20230706130934.586539-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706130934.586539-1-jstephan@baylibre.com>
References: <20230706130934.586539-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 13:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183944

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


