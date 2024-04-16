Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574E0C05023
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 12:07:21 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.18821.1713269237497951199
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 05:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Zt+mit2y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ed0e9ccca1so3914119b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713269237; x=1713874037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYXXpsSj0/8WO7rjA589X296bqhGLkX/mK5/tL3rPTc=;
        b=Zt+mit2yHBp56vJic93R9ukECGbGwzldImmwKlYYsRdu861usRUuo/zDi5ayTxa4Jm
         2MXvCynL88o98jKkK7VMkEinn8o5InAEvJqD/7CbJiV6GiEVnyBkg07+UkvaY/SMNaT8
         Mkaa2jjhdT2pr0n4tAL61RRyrmcHqL8RL6me00UucD/qWv0G4+ANqGqzsIu1iF6nBcDq
         lUNjdN8pxxo6UKsALx8vZ0cd8mK4NaTcYJkXdfnpO8gjvct7ytUi5NFGG46gowndohAh
         /2ay9kEEuVECfOHtImsOsQLjlwFgKiLrioN/Gy69YfdT09a5WMcKfF01nN0pPXTS7Gtp
         nQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713269237; x=1713874037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYXXpsSj0/8WO7rjA589X296bqhGLkX/mK5/tL3rPTc=;
        b=aMwf7Mdk11TGI/Rvhmlv773LYWOFVtn9+0WtmTkIXfeVhCej5vGppCSI5a//s+2z78
         IejZa+TCy8LUrkR2BqewwcKwGkK/2y7jUoBXLb3A9PJNEZp8rv6tfydjr2AbQk7Tg6Ih
         867blDflCkjkhC5xKU/y6wjPH2dU/XWbE4Rx86CCcfPM4RnU08NAqVRiQD6gG52fbfqx
         bjxRusUfVax+yoArdwpJjCzkQwtNJQEHGjG6UsyUvXCRPuH+DeWPiuv5kBEmK0AkYYOt
         fwu6L7u+yewkJoqWvr8rE0DhJB43hE79yLjUT2ihnFtuU/sDoNru4zBdx1wSYERLPWSS
         vYzw==
X-Gm-Message-State: AOJu0Yxrty3EzFmGdzDAtdPQGlh6Bw8taHpEJx4RazJsHaDo9H4/uGuT
	2K+MPJ8O3smCJ8ofaiCBozA+5hRjqo3ev2nds1rYs8CBPdV2Clh3pQ+dIs1BY+iv7HIbwFPIbkY
	Rxoo=
X-Google-Smtp-Source: AGHT+IFRMc1ZhjNEF7T7KuPAVyGBVM2j9JrlVIQV4u4xYpvdmzFPpGnyFfz6IlnEE2UETS6mTyL7dw==
X-Received: by 2002:a05:6a00:3d4d:b0:6ea:afd1:90e6 with SMTP id lp13-20020a056a003d4d00b006eaafd190e6mr12082276pfb.6.1713269236825;
        Tue, 16 Apr 2024 05:07:16 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id j5-20020aa78d05000000b006edd9339917sm8746111pfe.58.2024.04.16.05.07.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 05:07:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/10] tcl: Add a way to skip ptests
Date: Tue, 16 Apr 2024 05:06:55 -0700
Message-Id: <a70f9039259d7d38c5a3e50f7003d3228d1ab692.1713268959.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713268959.git.steve@sakoman.com>
References: <cover.1713268959.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 12:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198445

From: Khem Raj <raj.khem@gmail.com>

Some tests hardcode assumptions on locales, which may not be present in
musl systems e.g., therefore add a way to skip such tests using -skip
option.

Skip unixInit-3* test on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit fa66f1cee2d88c2276442e8b4aaeccde5490f9ea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 4 ++--
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index a62b703082..5b9127784e 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -3,9 +3,9 @@
 # clock.test needs a timezone to be set
 export TZ="Europe/London"
 export TCL_LIBRARY=library
-
+SKIPPED_TESTS=
 for i in `ls tests/*.test | awk -F/ '{print $2}'`; do
-    ./tcltest tests/all.tcl -file $i >$i.log 2>&1
+    ./tcltest tests/all.tcl -file $i -skip "$SKIPPED_TESTS" >$i.log 2>&1
     grep -q -F -e "Files with failing tests:" -e "Test files exiting with errors:" $i.log
     if [ $? -eq 0 ]; then
         echo "FAIL: $i"
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
index b591671868..f8f3d7dd3f 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -89,6 +89,11 @@ do_install_ptest() {
 	cp -r ${S}/tests ${D}${PTEST_PATH}
 }
 
+do_install_ptest:append:libc-musl () {
+	# Assumes locales other than provided by musl-locales
+	sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="unixInit-3*"|' ${D}${PTEST_PATH}/run-ptest
+}
+
 # Fix some paths that might be used by Tcl extensions
 BINCONFIG_GLOB = "*Config.sh"
 
-- 
2.34.1


