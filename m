Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2271AC10F1A
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:02 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.19244.1713529195162971008
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AgaCzj1u;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-571d6d1943fso541930a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529193; x=1714133993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCgvdfhiAf+O0n6dAewDU88nC9L4Fp1eoCQXkneMJWk=;
        b=AgaCzj1ucdcR6+GtmYQyRgM9UBcduwy7xEhx15pqb1ABPkRLF8YYZfXEn21AARau7j
         HvjCjRibkXvAoSetWwE4xpqK5/dU60K2tgQjmLr4ljm6a7HwoAqpxlULmU8IuaX4bIJd
         e/pPzEKg3/GU6NJRInWFlJlAFNYtC3AwvwSBFLMmAh6qTYjK/buUph6tgbVXkq2YrhR6
         TElwAkWa+NINiSStN+YVHzjwe0vgLaHdQlq1WI7752ulrzyhrKJdsCGODOhapRojfniz
         L4pTrf1Jf6fLlCB785X0cjxiHVwl85AfAECEWLJ3418UDNd3lklAAH6DmD80DBx91QLG
         /J5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529193; x=1714133993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCgvdfhiAf+O0n6dAewDU88nC9L4Fp1eoCQXkneMJWk=;
        b=ZlP/r0ipcEMjUDH2O+/QjJEM2D8Qy5eacWWVJWJGC7xn0o6OZRgn5WN1PALDOePW3m
         R1DVwUIzSbZBmTLuOqDr0dY1voIaCJcikO9mJiZ648VxOuK1iyqAoCfV/2vBq+nHikjo
         WVwsXNFQyC/cA/5yPfu+4rOlh64stjvGcUsTA+buZWXCPKH5q4qtLUEyPeTtGrHBchnF
         qFMoGOsohB9Bw8g5KNKtJ4ZgGTXfGCHsRoZO9nwB1761duSUBotrKHyeYvYzSufMyfqo
         7f/jXq6ZuLwji62W0d1riGJHn3V+hwKmS774V6+LVESbJY0YLtCsLCQkOa9SxaK1CTwU
         UwcA==
X-Gm-Message-State: AOJu0YwHZxhZf31TDzjIJ/gI5RO6mE5e2topiiVzi4YI0CILMovALyLF
	7kQqlRGiahL4l/b2FQ0EQUxMDwKfTTsTHrcCgm0As9QCgxwOdQmVlBMZ+A==
X-Google-Smtp-Source: AGHT+IHzCIbS7U7KcRxODxUlkbsiwHCyI2OzFZt2RsZsQWKmwzIAy+Waf6qOhR3DA2Vr3zOdhqwhSA==
X-Received: by 2002:a50:d74b:0:b0:56e:2b0b:58 with SMTP id i11-20020a50d74b000000b0056e2b0b0058mr1466621edj.10.1713529193301;
        Fri, 19 Apr 2024 05:19:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:19:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/19] expect: mark patches as Inactive-Upstream
Date: Fri, 19 Apr 2024 14:19:33 +0200
Message-Id: <20240419121945.1920944-7-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198535

There's every indication that this is an ex-expect:
last release in 2018, stale tickets, cvs server gone.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../expect/expect/0001-Resolve-string-formatting-issues.patch   | 2 +-
 meta/recipes-devtools/expect/expect/0001-configure.in.patch     | 2 +-
 .../expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch      | 2 +-
 ...1-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch | 2 +-
 meta/recipes-devtools/expect/expect/0002-tcl.m4.patch           | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/expect/expect/0001-Resolve-string-formatting-issues.patch b/meta/recipes-devtools/expect/expect/0001-Resolve-string-formatting-issues.patch
index af1d8c626c2..bfb6dcd89ae 100644
--- a/meta/recipes-devtools/expect/expect/0001-Resolve-string-formatting-issues.patch
+++ b/meta/recipes-devtools/expect/expect/0001-Resolve-string-formatting-issues.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 23 Mar 2017 13:44:41 +0200
 Subject: [PATCH] Resolve string formatting issues.
 
-Upstream-Status: Inappropriate [upstream seems dead]
+Upstream-Status: Inactive-Upstream [no activity since 2018; cvs server went read-only]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  exp_clib.c | 4 ++--
diff --git a/meta/recipes-devtools/expect/expect/0001-configure.in.patch b/meta/recipes-devtools/expect/expect/0001-configure.in.patch
index 7595a254a8f..618c4bee8eb 100644
--- a/meta/recipes-devtools/expect/expect/0001-configure.in.patch
+++ b/meta/recipes-devtools/expect/expect/0001-configure.in.patch
@@ -1,7 +1,7 @@
 Allow cross compiling.
 
 Signed-off-by: Anders Roxell <anders.roxell@enea.com>
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [no activity since 2018; cvs server went read-only]
 ---
 diff -uNr a/configure.in b/configure.in
 --- a/configure.in	2012-12-14 15:31:32.623180450 +0100
diff --git a/meta/recipes-devtools/expect/expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch b/meta/recipes-devtools/expect/expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch
index 37512fb9bc8..d73f4c34215 100644
--- a/meta/recipes-devtools/expect/expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch
+++ b/meta/recipes-devtools/expect/expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch
@@ -10,7 +10,7 @@ Aborted (core dumped)
 
 Use PATH_MAX to fix the problem.
 
-Upstream-Status: Pending [Upstream seems dead]
+Upstream-Status: Inactive-Upstream [no activity since 2018; cvs server went read-only]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
diff --git a/meta/recipes-devtools/expect/expect/0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch b/meta/recipes-devtools/expect/expect/0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch
index b1d322d5c95..40f7f3bd85a 100644
--- a/meta/recipes-devtools/expect/expect/0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch
+++ b/meta/recipes-devtools/expect/expect/0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch
@@ -42,7 +42,7 @@ Example:
  }
 Author: Sergei Golovan <sgolovan@debian.org>
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [no activity since 2018; cvs server went read-only]
 This patch is backported from fedora changes for expect:
 http://pkgs.fedoraproject.org/cgit/rpms/expect.git/commit/
 ?h=master&id=b6737eed550be93182f2ed194e836a6cbbcf4fa3
diff --git a/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch b/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
index dc4c6ba4066..eb178f462ac 100644
--- a/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
+++ b/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
@@ -1,7 +1,7 @@
 Use proper -L path when cross compiling.
 
 Signed-off-by: Anders Roxell <anders.roxell@enea.com>
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [no activity since 2018; cvs server went read-only]
 ---
 diff -uNr a/tclconfig/tcl.m4 b/tclconfig/tcl.m4
 --- a/tclconfig/tcl.m4	2012-12-14 09:16:58.789861281 +0100
-- 
2.39.2


