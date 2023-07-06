Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8556EB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:40 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.26486.1688656055752649789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cOab4dte;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b8033987baso14126685ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656055; x=1691248055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ha4W09TZuvouG2rC0SgoWUqzqMggcDIlvLRJe7+4OrI=;
        b=cOab4dteELRdvGtBKZVmyd8RhtKkWU+DQzUBrLV4G6O+H5HbraeGC6oTNvG5k7gYXx
         aa3CGOS1j1IfEKSJ6Vsgx0N2DugXLIO2m8vqKpLUYrG2GRpVrWOdJGCiSLMBgahgb+tY
         GG457mXmfObHjl0vMK7TB+eLeyFee5Y3lHEWTfHrZWUPRlNiaafKs5zY67MdO+sytTq2
         8XVxB8PLQw8anOWHZMCULGpret5+dGWP1nWogBfEyvcuwUs6tAphfQEh9SUAasCHpNrs
         wLKeq8alLxN6xQlVsx9oEbM+uXC0foGCl+yPrPASHu23jt/CmhUeCSFC8ak0tEGLN7UW
         eCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656055; x=1691248055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ha4W09TZuvouG2rC0SgoWUqzqMggcDIlvLRJe7+4OrI=;
        b=iSSaviQ8g95ZOOJNLVRHQwmG7npNHJoqysJvUoPf/JXZGZcIvMFl7EnkHlASSvjI8p
         cO7BoLeUM5dby9nhQgKDkyqh1p1mgezDYfXIw0P/82Tw6qMjFieeDXzMhJkpZIoLdkJ0
         jvGpeThmUQ9oSQIgl9xD8et+Q9xz4+kKpWqgUeIzbsGZ53G68U3+mEd4hG/mv2gIHwFN
         biKSkmMlA6MppR33mwrkF0RpJ3q1BvFxJFMOB01BOTzPOCWYmZxx3LzbFuXdTbKxoVAC
         llFxZketT4hBN0+pMaW+hAWX1FKjtVRSHUL16C1At72d2LG6GkKFYjzlXaFkMoFqXura
         EKGA==
X-Gm-Message-State: ABy/qLZmP9aMnc2AK3zcCKFbU4+IEntCnhcpanO6eeF6Eywa91S1NJJF
	8dgi3iuL6wTtHSyRGKYg3sneY8eJckgfb0L97WY=
X-Google-Smtp-Source: APBJJlF0yhJhZSDlw/rQFV8aKsJyTEvby+viarERNmCI3zkomlLeeQR2uESN4xHz0YU9kmB8x8+j7A==
X-Received: by 2002:a17:903:11c9:b0:1a1:d54b:71df with SMTP id q9-20020a17090311c900b001a1d54b71dfmr3724343plh.0.1688656054715;
        Thu, 06 Jul 2023 08:07:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/28] strace: Merge two similar patches
Date: Thu,  6 Jul 2023 05:06:30 -1000
Message-Id: <81af8c6fdc6f0b6617b7258c9b3e2e26a76db5c8.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183980

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Both patches change the same paths to gawk, merge them together
as we only need one patch for this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 79c0b18e29cad337640860f57683f0a170f6daab)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 6080138fd0c27db7029b5a76e69b8dc241ad8dc3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...0001-caps-abbrev.awk-fix-gawk-s-path.patch | 47 -------------------
 .../strace/strace/update-gawk-paths.patch     | 30 ++++++++++++
 meta/recipes-devtools/strace/strace_5.16.bb   |  1 -
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
diff --git a/meta/recipes-devtools/strace/strace_5.16.bb b/meta/recipes-devtools/strace/strace_5.16.bb
index 60d452fd17..d97a1260d1 100644
--- a/meta/recipes-devtools/strace/strace_5.16.bb
+++ b/meta/recipes-devtools/strace/strace_5.16.bb
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


