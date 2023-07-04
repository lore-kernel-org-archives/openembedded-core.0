Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960A5EB64DD
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:09 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.61478.1688484602514986347
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=gw/3RFz1;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3a1ebb85f99so4438546b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484601; x=1691076601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DqPqKXtfJeK2NeJK+GEHC31yaQGT1leajxamhX6KXGo=;
        b=gw/3RFz1f9feE8nX1pZBEP/S/m4SdrJYBtKlp7r4ywsv65dA1LOpk9UPvnVuZn0Okw
         Io/nr6aaGZctdZi43D51hII30ncH7UHjCikY3ZNqwB/t/lXUxZtu68oHL0F0zj67LZn1
         Z/8JLXdjgCXice/SwRIeRlI2LV8NqF7Fvw6VEAkv4Gv8ORMrKJeUbFYzc9VWyLaKH+jK
         23znkFz3KtB9+IJ4WI0SVMzOlaBpv+zzIRHTC/qV0E6bYK59OLIgSJ9IjtWqg5ycuaJl
         +K25gyM5bP7QkZsCVvCCmeOFgFRbomgbEUZuy9pJKAXseZfIK0pmizQ8ODrbwhff+vCu
         pLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484601; x=1691076601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqPqKXtfJeK2NeJK+GEHC31yaQGT1leajxamhX6KXGo=;
        b=OL0pmZVdbjtfSadO2PNlFESKOcJdrYLHFIBvhzXUOszjCP1juqae9FjIF7d49YC+Gi
         2ZxrknqlG477zAGS8V01n3WtJPONlEO7WckFuH728p/XnuZybw7xSPiZ5ew3C01TRB9E
         GFjyU9fNoRHXni6eGSBdzqjI5ZHmxJRBPcEPqTYbGdqU/a+jiFYlhcLiXe0asd8+NeJX
         7vmSQfk483Nw0S0FSlnhtC/4yqvH6iqckhGtHW1PePE+FEUfA8ug2Q93cXB0Y9DmtKYI
         DiwNgfy3tM7bxoKBoJZ+1OjOofQosVF8UArSHrmjBVJL8XOCrZKgGkTvP690iuiTikU7
         +B8A==
X-Gm-Message-State: AC+VfDylB30BsF5xJn9SR2NNOLSI0dfBp4VoNKtda/7ORrsx+/LIusrO
	GFvpkI/vo3dowt4YPznPsIH/ZbMwiVsFk2vW4O0caw==
X-Google-Smtp-Source: ACHHUZ72euUcOCOsHspI4zNnwDgqi6kGMx026cfbjigirfHXiy7pIJFhqAHFuq2Qd/X6QxRldqTc7A==
X-Received: by 2002:a05:6808:543:b0:3a3:7248:252a with SMTP id i3-20020a056808054300b003a37248252amr15359549oig.0.1688484601418;
        Tue, 04 Jul 2023 08:30:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/30] strace: Merge two similar patches
Date: Tue,  4 Jul 2023 05:29:13 -1000
Message-Id: <6080138fd0c27db7029b5a76e69b8dc241ad8dc3.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183846

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Both patches change the same paths to gawk, merge them together
as we only need one patch for this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 79c0b18e29cad337640860f57683f0a170f6daab)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...0001-caps-abbrev.awk-fix-gawk-s-path.patch | 47 -------------------
 .../strace/strace/update-gawk-paths.patch     | 30 ++++++++++++
 meta/recipes-devtools/strace/strace_6.2.bb    |  1 -
 3 files changed, 30 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch b/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
deleted file mode 100644
index 235e803641..0000000000
--- a/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 597cc206d982e7237eb93fdc33e8c4bb6bb2d796 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 9 Feb 2017 01:27:49 -0800
-Subject: [PATCH] caps-abbrev.awk: fix gawk's path
-
-It should be /usr/bin/gawk as other scripts use in this package.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
- tests-m32/caps-abbrev.awk  | 2 +-
- tests-mx32/caps-abbrev.awk | 2 +-
- tests/caps-abbrev.awk      | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tests-m32/caps-abbrev.awk b/tests-m32/caps-abbrev.awk
-index c00023b..a56cd56 100644
---- a/tests-m32/caps-abbrev.awk
-+++ b/tests-m32/caps-abbrev.awk
-@@ -1,4 +1,4 @@
--#!/bin/gawk
-+#!/usr/bin/gawk
- #
- # This file is part of caps strace test.
- #
-diff --git a/tests-mx32/caps-abbrev.awk b/tests-mx32/caps-abbrev.awk
-index c00023b..a56cd56 100644
---- a/tests-mx32/caps-abbrev.awk
-+++ b/tests-mx32/caps-abbrev.awk
-@@ -1,4 +1,4 @@
--#!/bin/gawk
-+#!/usr/bin/gawk
- #
- # This file is part of caps strace test.
- #
-diff --git a/tests/caps-abbrev.awk b/tests/caps-abbrev.awk
-index c00023b..a56cd56 100644
---- a/tests/caps-abbrev.awk
-+++ b/tests/caps-abbrev.awk
-@@ -1,4 +1,4 @@
--#!/bin/gawk
-+#!/usr/bin/gawk
- #
- # This file is part of caps strace test.
- #
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index 0c683496ae..a16ede95c2 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -125,3 +125,33 @@ index dce78f5..573d9ea 100644
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@strace.io>
  # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
+diff --git a/tests-m32/caps-abbrev.awk b/tests-m32/caps-abbrev.awk
+index c00023b..a56cd56 100644
+--- a/tests-m32/caps-abbrev.awk
++++ b/tests-m32/caps-abbrev.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
+diff --git a/tests-mx32/caps-abbrev.awk b/tests-mx32/caps-abbrev.awk
+index c00023b..a56cd56 100644
+--- a/tests-mx32/caps-abbrev.awk
++++ b/tests-mx32/caps-abbrev.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
+diff --git a/tests/caps-abbrev.awk b/tests/caps-abbrev.awk
+index c00023b..a56cd56 100644
+--- a/tests/caps-abbrev.awk
++++ b/tests/caps-abbrev.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
diff --git a/meta/recipes-devtools/strace/strace_6.2.bb b/meta/recipes-devtools/strace/strace_6.2.bb
index 94eb81480b..c7f5b741b2 100644
--- a/meta/recipes-devtools/strace/strace_6.2.bb
+++ b/meta/recipes-devtools/strace/strace_6.2.bb
@@ -9,7 +9,6 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://update-gawk-paths.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
-           file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://ptest-spacesave.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://skip-load.patch \
-- 
2.34.1


