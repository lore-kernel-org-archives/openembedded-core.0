Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F682E77346
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 22:05:59 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.30528.1696025155755128092
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 15:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=CEKapgef;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-405524e6740so128258555e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 15:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696025154; x=1696629954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8uh52poCWNj/CoIq9JwSqEDJnJwqrR5j0gPe20nLPU=;
        b=CEKapgefoGBL7D1T1bnmWdnAVWXSYoGsiMZZqJgH2O5Rf4l+4wwIbyE0LzZTWyCWwF
         ntNSQ/CKdYikyriUGQ44oAEvPOHWhAeBpeQtkx6aEDCyXISF2cOv66TYsxUwOPn9CZxq
         ZW5X54BCjUFn/M8NU2bA2TS61uYc78JvoEIrKu4ff40fRI5d09YUcyCf1ztF9Zkg40GE
         PxeoE4roe6REV87owB0snTR3K7OLqnRvCzEdC9kSgGEHsn2zUjKm6xv7NcwnNDcCNXsu
         TLYOVhcnRvz7608xt6QJR/HVbVsw4QvDTQSyRAe52gRz1u1g4CFl/GFwaiasHGhhhPjo
         /jEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696025154; x=1696629954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8uh52poCWNj/CoIq9JwSqEDJnJwqrR5j0gPe20nLPU=;
        b=lr6tds4xjy+MS1XP1U94FjlmtNVmlwo3IQol7EP9ez8dSvSQuBuBxZdMW2UCaiF4yI
         k/kOCwjxBEUrsm1e1Y7GYtB9BQhdfos5DVdHrcR5bEUXL36taI4ifQKVa3iuegfGDLb3
         gSmqqsOBmDEfaqnUWf+FzLmn8gjvphwCoXXoaesEaWaF/ZxKBBLR6rOFNk9We8uiRaVq
         eA4p42LX6IhoRcXsOaZ/ix2u5r+8RsgjCdoH1TVzW7Erctt9wAxzCa0ZQYUpWG4qyh4E
         qpyK2hoN1Ydz4NqOYLTaewoUH+5jeAAuLq5Lndd2gF1+hOTf3+k8HvcWv3hA17ndpmmt
         PWig==
X-Gm-Message-State: AOJu0YywJnSSWM4b7/T3WYH6iL+qDmSY4KN5lf5L/7zAkcrPSMVO0Ev4
	+ubN/oQ/sYrmhrbn0s+zdNoBQYkz9YCnUfxO6HI=
X-Google-Smtp-Source: AGHT+IEfx2eTOqyLrqXzF7ElN/ravqML2cXSaR0uUYtiBJspZ5RgvCkTRJarr7OSm/iJ9wKx91M5KQ==
X-Received: by 2002:a05:600c:2303:b0:405:dbe2:df10 with SMTP id 3-20020a05600c230300b00405dbe2df10mr4729662wmo.35.1696025153845;
        Fri, 29 Sep 2023 15:05:53 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id t15-20020a1c770f000000b00406408dc788sm2210046wmi.44.2023.09.29.15.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 15:05:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 3/4] QA, ptest: Detect build-system test harnesses
Date: Sat, 30 Sep 2023 00:05:02 +0200
Message-Id: <20230929220503.3169745-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230929220503.3169745-1-yoann.congal@smile.fr>
References: <20230929220503.3169745-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 22:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188451

From: Jérémy Rosen <jeremy.rosen@smile.fr>

most build-systems have a way to implement a "make check" or equivalent
command that will run tests in the source directory.

This heuristic will detect the keywords in the build-system configuration
that activates tests.

Note that in the case of autotools, we use Makefile.in as our source
instead of Makefile.am to easily follow includes. Filenaming conventions
for autotools files are not reliable enough to do naive matching.

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/insane.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 31db707a33..a5d3793265 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1386,6 +1386,18 @@ python do_qa_patch() {
     elif match_line_in_files(srcdir, "**/*.py", r'\s*(?:import\s*pytest|from\s*pytest)'):
         oe.qa.handle_error("unimplemented-ptest", "%s: pytest-based tests detected" % d.getVar('PN'), d)
 
+    # Detect meson-based tests
+    elif os.path.exists(os.path.join(srcdir, "meson.build")) and match_line_in_files(srcdir, "**/meson.build", r'\s*test\s*\('):
+        oe.qa.handle_error("unimplemented-ptest", "%s: meson-based tests detected" % d.getVar('PN'), d)
+
+    # Detect cmake-based tests
+    elif os.path.exists(os.path.join(srcdir, "CMakelists.txt")) and match_line_in_files(srcdir, "**/CMakeLists.txt", r'\s*(?:add_test|enable_testing)\s*\('):
+        oe.qa.handle_error("unimplemented-ptest", "%s: cmake-based tests detected" % d.getVar('PN'), d)
+
+    # Detect autotools-based·tests
+    elif os.path.exists(os.path.join(srcdir, "Makefile.in")) and (match_line_in_files(srcdir, "**/Makefile.in", r'\s*TESTS\s*\+?=') or match_line_in_files(srcdir,"**/*.at",r'.*AT_INIT')):
+        oe.qa.handle_error("unimplemented-ptest", "%s: autotools-based tests detected" % d.getVar('PN'), d)
+
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2


