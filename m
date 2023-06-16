Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801A0EB64DC
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 16:16:29 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.2941.1686932181823118206
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 09:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=g3SRWO89;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30fbf253dc7so748571f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 09:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686932180; x=1689524180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1ZTiJrS10X832QZkX8koATCIgLAS2pSqnLfFR3aR/g=;
        b=g3SRWO89PYxXDs9zajW6pzXuIf0P1rx9zdqTdYqxYYBK7gOya02sox+claC6LLdnbG
         X2zOhtopO9Q1uLIjy46OGIMee0mXfjx8ihvRNQFXX20QSW051vWQy2TJPtEiRB4rCz/I
         SLtgugx3cfkJ4LGkM8AWxyFSfCLUxMB2KACnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686932180; x=1689524180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m1ZTiJrS10X832QZkX8koATCIgLAS2pSqnLfFR3aR/g=;
        b=kvRVR639XxCCkzV9aJPuWq3YxLsrQfQiABWkcnTm+ssV8PF/KWPUmuE+vDT7KTDvsy
         BMvc5v0sDXYEwkl0UEPD9Lz6OHMilwdWa6Vsq+8zUX1m2VpQpfpuP/3ENO6pxLlcBQqs
         VUXYpRBxAKSu5DWa/LDZeKOoz+KgnqVh6P78YmxtX9VGtnRiQzCbKM0kMk84zXonC52y
         YR+xINEhUPiVZFllXNigiJpqqEQL9AeViMYDl5OijdjEuI/e//hJ3DWJKmVV4O8QmoMx
         /VWx4ipmCO1h73SUKPaa5W0qAkYVH4/e+emLVmlNkl5lcbrmEgKJwG/xPDTKRW3RZINh
         n7jA==
X-Gm-Message-State: AC+VfDxsldxdVoj+iIPh0PZaxKqnoC6UdCUUxqsymy4gCMrgsy8+of3z
	hsPUEQQm695nCuORZFwVxJpRxaKeOQRc1lTBmY4=
X-Google-Smtp-Source: ACHHUZ6/GzDhcDQtREro63TSum/H1XtqzGiDA7lPJ9HQw70SbvJIMvoPvuqSiSOrHDIeoKkzEdNZXg==
X-Received: by 2002:a5d:5648:0:b0:311:b18:9ca4 with SMTP id j8-20020a5d5648000000b003110b189ca4mr7853795wrw.17.1686932179695;
        Fri, 16 Jun 2023 09:16:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b814:609:2b03:c353])
        by smtp.gmail.com with ESMTPSA id c16-20020a7bc010000000b003f7f60203ffsm2617520wmb.25.2023.06.16.09.16.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 09:16:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] strace: Merge two similar patches
Date: Fri, 16 Jun 2023 17:16:18 +0100
Message-Id: <20230616161618.1839310-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616161618.1839310-1-richard.purdie@linuxfoundation.org>
References: <20230616161618.1839310-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 16:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183049

Both patches change the same paths to gawk, merge them together
as we only need one patch for this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...0001-caps-abbrev.awk-fix-gawk-s-path.patch | 47 -------------------
 .../strace/strace/update-gawk-paths.patch     | 30 ++++++++++++
 meta/recipes-devtools/strace/strace_6.3.bb    |  1 -
 3 files changed, 30 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch b/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
deleted file mode 100644
index 235e8036419..00000000000
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
index 0c683496ae9..a16ede95c26 100644
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
diff --git a/meta/recipes-devtools/strace/strace_6.3.bb b/meta/recipes-devtools/strace/strace_6.3.bb
index a85294d3c24..7ba9fcc4681 100644
--- a/meta/recipes-devtools/strace/strace_6.3.bb
+++ b/meta/recipes-devtools/strace/strace_6.3.bb
@@ -9,7 +9,6 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://update-gawk-paths.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
-           file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://ptest-spacesave.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://skip-load.patch \
-- 
2.39.2


