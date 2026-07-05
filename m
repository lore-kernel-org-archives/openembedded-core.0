Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9B2C4450D
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:20 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139230.1783291389877391392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=235ZipvK;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so23873445e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291388; x=1783896188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCaQkGUUyJm1fhF98POSNhfIU+DAkZxA69aWTTEUumc=;
        b=235ZipvK0JE5M4nY9KcvZBVjNlzIjUr//l4ibJTcSjyG4NdoNJdbtNCXC5oefut24g
         ZA4NLd8qbI7a88818cUGiGhqFYDctBAU4r8esC46B8+EMp2JvWt65X6BsQ1jH2gYvS7z
         a+SixeVpvnS66PAn8zBUG/o/DvAIO+p/86YsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291388; x=1783896188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WCaQkGUUyJm1fhF98POSNhfIU+DAkZxA69aWTTEUumc=;
        b=pPhaOfkJNey/WOdzbbRCaQQeraItFofJIX+x+4K66GQAfddeCAfkZDweLVuYxz+450
         wXu3L++vxwkzuzEZNvw99tcsJpxm7DuxgDlAwkedEVGln/8sq31EOMFJVaTDia9rY77E
         XAZ0qWyzPu0wKjdiKmTBqlDsZKbTMBzhn6qNvORg5fY/U1RM2ZcJGG6chO5WGMuua72G
         eAN4nIBAxFb7enPQui68/QSsEjcQxUUGw+CsdD+MlGYnK9tYOiZWLdRkZ6GrDQl6Twg5
         cyZllMUT12/ZhtfAxFIJThQtTBAn6FtGE6KHJbSU1HdEPm4SeJRSsOnpd6KtHzeEvCm3
         dvrw==
X-Gm-Message-State: AOJu0YwSgjFwV55X9xpWBTyI7LVHWwHf1V5K6d8ytemq4KB3fr6uTT7P
	jDKDU2Oj8qHHd49CzJO0M50b4IwgK5cMmBlnxxVJ4LM+B4niDnNRBm3hC2ChYdpcNs6tQ8vLeUm
	iYcqLFaY=
X-Gm-Gg: AfdE7cnec2qpWHvvqwPKvdjLgWKbcBcQR1/opyTxHHCgWLnXxxfvKgRXznibZ6g/2M2
	4CmA69T8DcbfWbZTxn0iBOwjeV5vHzGXfDIOebCE/+okj4EbFMqQYu3rgTb/1xZPDkaMZLXCV0m
	kxge+G4I6xAy+cmmD2ELTaz6sx47T78GqCqr0QTKCazrJyvwrEfoS0ZyzJ6jdaoXNatIi9rIWys
	39dffLP0MOV1fl5RiICBWPhmjANUxnbQ3z8ciS3O9zGmJZKOghBat5JP5q0XCvCQmiDToeiNUye
	NdzSn4aw8jEUkdySfpcV0CZ+UDm4jci2AwyE601/Q+7hJK+NxfdjVrlKFXyLmTnxIKWOkL0Wy9f
	oK1JfL6aFJGykAABR7BE6/nr4SqHU8kXzVaphDKRPk7JGq70s3+V09TZvaKMfr21MmFUkjpwVAa
	CuaE2kUwFzj1mShCOlQEJLmws+eQ==
X-Received: by 2002:a05:600c:314f:b0:493:b2c1:b2f9 with SMTP id 5b1f17b1804b1-493d11cf274mr90792875e9.8.1783291388115;
        Sun, 05 Jul 2026 15:43:08 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 42/55] strace: remove skip-bpf.patch
Date: Mon,  6 Jul 2026 00:41:32 +0200
Message-ID: <81af90dd1c49853d6189fa491b766a7b05d2f6cf.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240196

From: Alexander Kanavin <alex@linutronix.de>

Issue was resolved in https://github.com/strace/strace/commit/982e5ff96a670473187ccdf6e2d8ddb3c40c82e1

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 52fd493a9851a44bc836a712800584cd93564240)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../strace/strace/skip-bpf.patch              | 25 -------------------
 meta/recipes-devtools/strace/strace_6.19.bb   |  1 -
 2 files changed, 26 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/skip-bpf.patch

diff --git a/meta/recipes-devtools/strace/strace/skip-bpf.patch b/meta/recipes-devtools/strace/strace/skip-bpf.patch
deleted file mode 100644
index b058b0ba03d..00000000000
--- a/meta/recipes-devtools/strace/strace/skip-bpf.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-These tests failed when upgrading to 6.18. Skip them for now until the issue can be resolved
-as the upgrade is needed for newer kernel versons.
-
-Upstream-Status: Inappropriate [issue reported at https://github.com/strace/strace/issues/370]
-
-Index: strace-6.16/tests/bpf-v.gen.test
-===================================================================
---- strace-6.16.orig/tests/bpf-v.gen.test
-+++ strace-6.16/tests/bpf-v.gen.test
-@@ -1,4 +1,5 @@
- #!/bin/sh -efu
- # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (bpf-v -a20 -v -e trace=bpf); do not edit.
- . "${srcdir=.}/init.sh"
-+skip_ "Test doesn't work atm"
- run_strace_match_diff -a20 -v -e trace=bpf
-Index: strace-6.16/tests/bpf.gen.test
-===================================================================
---- strace-6.16.orig/tests/bpf.gen.test
-+++ strace-6.16/tests/bpf.gen.test
-@@ -1,4 +1,5 @@
- #!/bin/sh -efu
- # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (bpf -a20 ); do not edit.
- . "${srcdir=.}/init.sh"
-+skip_ "Test doesn't work atm"
- run_strace_match_diff -a20 
diff --git a/meta/recipes-devtools/strace/strace_6.19.bb b/meta/recipes-devtools/strace/strace_6.19.bb
index 7b8d4851fb5..39c9b8cd451 100644
--- a/meta/recipes-devtools/strace/strace_6.19.bb
+++ b/meta/recipes-devtools/strace/strace_6.19.bb
@@ -12,7 +12,6 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://ptest-spacesave.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://skip-load.patch \
-           file://skip-bpf.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \

