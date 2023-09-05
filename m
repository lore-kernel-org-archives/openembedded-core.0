Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82F2C83F3E
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 06:36:10 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.15567.1693895768096921723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 23:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cEPwrIA3;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bee82fad0fso12163325ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 23:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693895767; x=1694500567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cfb6afLslNkCssp/qSiHpFuvsC+aFARqy9ifWRbS3KM=;
        b=cEPwrIA3RdA8NGPNAaLkbIkQ6HawfLyDUaWs0fUve0xgBvxHq5CFWyiZWXU1pC+0Uh
         3WfRKQ3qsQUOtFnQAzoiWX43hNuwhDC2IYaR9HFyGJuONrnotHN6lLc57cAshQ3WIWuH
         nFQwl11cNCK+QIR2rTSjK+CumNLj+edifHFeAmuaEVZ+EITmuzgnPpDAishMeI+rVx7Q
         QGOmc9H+Fbvl0O429mlSafgkZr82HFctm1HbWfjLgWhWb6Mu/GqUFh2xoSbTqkM29MLr
         oPCdrHebMa3EwXGQ99vYP8+tc1Y0IgIUOUDmhpY49GybZ39QZK5qOILAi6CP4MnDtYoD
         ptJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693895767; x=1694500567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cfb6afLslNkCssp/qSiHpFuvsC+aFARqy9ifWRbS3KM=;
        b=JyiEMpodTXUvd2KU00ryzTtfir+mXCj1PkWQVsn5y+cj17AguUzjyBl4NjmqWOcyZm
         nU1A+JvgrekV1w2shThS6ZJow/lKsPouuDxs/CSQjowtkIIfCpeDs5JoR/32Os91a691
         XoZWqCHrOwc/Uo84X3ANMhDGo8rcA7Y+K9PY68taFhcoJarst8CjD3A6hpoz1cN51qlX
         mK4zj3PxS5z0ioIAQmXEl7jNB1DbYxp9izp1lSIRfUlGylj/Vx2cFWF0ieqBleTJItoI
         adOgLirTKKQtcrE8+UsUO0zYQeGtOCAB+mAoRZh6wTHVnDPbVX6i+oF5ZMg0vYoX6n0l
         bzgA==
X-Gm-Message-State: AOJu0YxWTKBsZKvQLz/oLhoVc9kwn9KBW5snbo8/6YBBdDDyQ6c/060j
	KjrQTkWXUUIw9V72dvGmq/KmncN3HtERpQ==
X-Google-Smtp-Source: AGHT+IHn/CA1UQwvjH/hJZJt/avy7ecfA7glIjKy+1yyF+CfDVf6VrcOXWdB2IMYGSoBXhVtLAy8kQ==
X-Received: by 2002:a17:902:c38d:b0:1bb:8931:ee94 with SMTP id g13-20020a170902c38d00b001bb8931ee94mr8729187plg.67.1693895767170;
        Mon, 04 Sep 2023 23:36:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id x11-20020a1709028ecb00b001b89a6164desm8519270plo.118.2023.09.04.23.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 23:36:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] tcl: Add a way to skip ptests
Date: Mon,  4 Sep 2023 23:36:04 -0700
Message-ID: <20230905063604.65428-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 06:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187198

Some tests hardcode assumptions on locales, which may not be present in
musl systems e.g., therefore add a way to skip such tests using -skip
option.

Skip unixInit-3* test on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 4 ++--
 meta/recipes-devtools/tcltk/tcl_8.6.13.bb | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index a62b7030821..5b9127784ed 100644
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
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb b/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
index 9eb924b0da8..b33a78e147f 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
@@ -86,6 +86,11 @@ do_install_ptest() {
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
2.42.0


