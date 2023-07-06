Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F89C3DA40
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 12:01:30 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.20341.1688644881820922092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 05:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=EDxI2Hgy;
 spf=pass (domain: baylibre.com, ip: 209.85.128.49, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so7625055e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 05:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688644880; x=1691236880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HJlC9TT9RzNWeT6OkDZiHB25RplwHbmvzDpyuukWDM=;
        b=EDxI2HgybNcIpbWW2kAtmAGmH+cRutzOU6BSI0doxa9bSTfLQGJRbMh7b40buN24JQ
         +KGZxzHPaq0P36p1rgs0OCeT6VTv2PMDXpPV8Tt/jCJ3Du4uXOew+F8+QgrENN/8Jw5I
         CZawWxork330Yo1SuOiZTlIoqGqatXTkeHjDgEdsor1voEneobroElQ4Znr4mMjwZ6hk
         SHypCxXt0bIhLNXFqJ03fHaZdC4wUThjlu6vdmWe0h2NT06y65zXzyclgosalhzlJcZj
         EFgV/j8mfYB7Uc2d+esnkGveHDca2lTWhBiJbHLzCo3H6N2JOmtS1ebMnJ2ms1WefbFa
         aimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688644880; x=1691236880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HJlC9TT9RzNWeT6OkDZiHB25RplwHbmvzDpyuukWDM=;
        b=HfimkG/IMGTIKUmOzvldK7c0OPXgDVBbSVFZYKAuJh2AGQOSmKIk1cntokdoWN2S85
         +I/o6Ed5qre0h0WGKafii4VjhCQ2bcmrT/YIlJ8nF+r7t5l9mC3e7RBHuFEsv0w0rnLm
         qcWOj9Otty99BUhyN+gPyEWHj74BFkn6PlGvPpPEbILiw63jerqpbxVgCHZYhMd/SM47
         UYq0T4v1LRYOOqyWe2vVfeZHwHMzWsxRP/iMQDPq6M8PVkLUbaIYfFBxYxg/hW/+qVPN
         5L7H9pj1dUVHL4gZKB+q04QKNu+n7Bhjlg0ue/bIfCUEt/EJWOe8ZP1dW27MGeNsDT3V
         85OQ==
X-Gm-Message-State: ABy/qLav37cVwCWTW4rAAzFK+Pcl8cCwAUHypS1KKiOkmP5fFIJY9+Cx
	biUGLhyrzmrI9dMGFX1384ZbKoBLZl9Ky9G4Uyconw==
X-Google-Smtp-Source: APBJJlEYIFEhe6oDF0RvArnIUn1mqexdlxLCWcELXMZO+hWa8KaBiOq1KKnSZRxN7ZRkAx0UrcKiiA==
X-Received: by 2002:a05:600c:29a:b0:3f6:1474:905 with SMTP id 26-20020a05600c029a00b003f614740905mr1587896wmk.29.1688644879638;
        Thu, 06 Jul 2023 05:01:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id e20-20020a05600c219400b003fbca942499sm4910848wme.14.2023.07.06.05.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 05:01:19 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 1/2] less: switch to github URI
Date: Thu,  6 Jul 2023 14:01:04 +0200
Message-ID: <20230706120105.553140-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706120105.553140-1-jstephan@baylibre.com>
References: <20230706120105.553140-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 12:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183932

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


