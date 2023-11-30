Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E717CC07CA9
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:20 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.5282.1701377894903192947
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uTnRKxpF;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5c194b111d6so1167872a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377894; x=1701982694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tjr1RYqS9hLvb+dQHc8WH1Eht5yA2zr8NykdXhqJFJY=;
        b=uTnRKxpFwNo2tfj9xojq+VUVC0XnOQtBOdDw4GYb/22B+FlobdumYO2hsoBfftpm07
         WqPkMNPFC68Lj5QeJGom0Aht0Po31G6TFF82IGKXbCWWZfQ/wSNsMqExnv5J+UT1GmBj
         JYCa8KlvsgNQss9yaToZ4JoGpe8blq/JCgxpbn/FpyiYYbu0eO7eLv77r39NbHsZWFDh
         0Nw5UXOKlUQ+Wm9vuGEkiNRRX/fZK9Pg+jnPQ7BuPsg24Ro40jN5KJ/awnY8umppt+6X
         VaZ2qNoCL79KDHj9oPh56UkX/ea9QwiuyvlUGXmKTeTjE+6zrnhzr9kbZrajbtgFe4iR
         FQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377894; x=1701982694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tjr1RYqS9hLvb+dQHc8WH1Eht5yA2zr8NykdXhqJFJY=;
        b=dtrSFxXB5jhKdqgYQ2rXmXEfRJ8Cqaqbme7dfV3ZFKAU6pLLXJpQQimPiChaaSSPnt
         Kl9qmsDa3GQSFjuE0LqRtT8Hy8knHqY0syLjutUSTPRr8FvQYD9lAnwZX84yvobLhiUM
         ZQY1lf55UTdJ7NuwyQH5eD2O/9U78OhQ46wMuZYZ1ZTA5VRw1K/lT66L/EPZ65lzq2jX
         Ra0srI09CocdzoyJGY3pd3vmfgW7rF7GHWtnpyuBHEIb/VQPTkjoPGW40+5UWY6LZ2H5
         3FdGnQmmyl6c3EbasqieTcyC7xCTRFp6VxMYWmyXJhwRhlzSvzb0CzlO+1p8+uX3s6yI
         qNIg==
X-Gm-Message-State: AOJu0YzMXid5TjemCrlc5/co2wB/AgPFtts+4amXmr9gQlKqx1kYZUC6
	rzYeqfk6JpdqcaAUWAogU2GBOwKwagHZhHpDRvGODA==
X-Google-Smtp-Source: AGHT+IG72LcMBDaHerJVrQYVGgMWUssh2M9wg5+FbqGUFd30Wy+J2FGK7BUe2jDTO9Vzw749O/3/TA==
X-Received: by 2002:a05:6a20:42a3:b0:187:ce5a:2a90 with SMTP id o35-20020a056a2042a300b00187ce5a2a90mr32502878pzj.51.1701377893965;
        Thu, 30 Nov 2023 12:58:13 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.58.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:58:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 20/25] strace: backport fix for so_peerpidfd-test
Date: Thu, 30 Nov 2023 10:57:28 -1000
Message-Id: <40127d0427d02d0c44d17b9959c5eae4d91d3f10.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191538

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Backport the fix for the so_peerpidfd-test:
   44cf51a38 tests: fix so_peerpidfd test
and drop the patch that skipped that test.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0a52da6530ebba08f9a3b30d5098b0c3ef1730d7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../skip-test-so_peerpidfd.gen.test.patch     | 25 ---------------
 .../strace/tests-fix-so_peerpidfd-test.patch  | 32 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_6.5.bb    |  2 +-
 3 files changed, 33 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
 create mode 100644 meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch

diff --git a/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch b/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
deleted file mode 100644
index 5c73e1f10e..0000000000
--- a/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 002d9f2512245536dfc8d62db429d97e2216ec3a Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <Randy.MacLeod@windriver.com>
-Date: Fri, 6 Oct 2023 12:08:23 -0700
-Subject: [PATCH] skip tests/so_peerpidfd.gen.test
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
----
- tests/so_peerpidfd.gen.test | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/so_peerpidfd.gen.test b/tests/so_peerpidfd.gen.test
-index 64ad3a2..f89da9f 100755
---- a/tests/so_peerpidfd.gen.test
-+++ b/tests/so_peerpidfd.gen.test
-@@ -1,4 +1,5 @@
- #!/bin/sh -efu
- # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (so_peerpidfd --trace=getsockopt -y); do not edit.
- . "${srcdir=.}/init.sh"
-+skip_ "Test fails due to apparently trivial log format differences"
- run_strace_match_diff --trace=getsockopt -y
--- 
-2.39.0
-
diff --git a/meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch b/meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch
new file mode 100644
index 0000000000..62f73d3643
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch
@@ -0,0 +1,32 @@
+From 44cf51a38cce1e90bb6c22208fa45f95cdcc8f5d Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@strace.io>
+Date: Sat, 14 Oct 2023 08:00:00 +0000
+Subject: [PATCH] tests: fix so_peerpidfd test
+
+* tests/so_peerpidfd.c (print_pidfd): Fix expected output.
+
+Fixes: v6.5~38 "net: implement decoding of SO_PEERPIDFD socket option"
+Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2243631
+
+Upstream-Status: Backport [https://github.com/strace/strace/commit/44cf51a38cce1e90bb6c22208fa45f95cdcc8f5d]
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+---
+ tests/so_peerpidfd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/so_peerpidfd.c b/tests/so_peerpidfd.c
+index 33988edec..dfad1c434 100644
+--- a/tests/so_peerpidfd.c
++++ b/tests/so_peerpidfd.c
+@@ -37,7 +37,7 @@ print_pidfd(int *p)
+ 	if (rc < 0)
+ 		printf("%p", p);
+ 	else
+-		printf("%d%s", *p, pidfd_suffix);
++		printf("[%d%s]", *p, pidfd_suffix);
+ }
+ 
+ static void
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/strace/strace_6.5.bb b/meta/recipes-devtools/strace/strace_6.5.bb
index d6475e8db9..d1536b1e8d 100644
--- a/meta/recipes-devtools/strace/strace_6.5.bb
+++ b/meta/recipes-devtools/strace/strace_6.5.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
-           file://skip-test-so_peerpidfd.gen.test.patch \
+           file://tests-fix-so_peerpidfd-test.patch \
            "
 SRC_URI[sha256sum] = "dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980"
 
-- 
2.34.1


