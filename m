Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E77C47422
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 07:09:58 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.3986.1705475397211521897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 23:09:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dcBK+EEK;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6d9b5c4f332so6001595b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 23:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705475396; x=1706080196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Uia2QeSVilAB1bkR7hIqUNWTgwNcqN5mmFfpW4YcRw=;
        b=dcBK+EEKo+8wnrIsnX97tXJmbemPvRmf3N+itfoeh+OSPpMKcOd5MZLT6hzgo3Jtk2
         3ElkGL0oBcU0f3lvq2Czm4AtnfdpJHfgtpN4CZPGSfUVeHX/ycl5vEoT5y50zoHTdjrA
         fcZm1neyZ4HiBUSgLtMJwOwrBF3iCctS9igDB0msXFYjkr2XdTb9J/68sue97v+qrWG3
         e5PhrGMihmP2PFVuA3ZLGC/+dwqZ4WLR8Sze5naFORCA9jgQe4sTQLAq3bHwdqQjb/AE
         jZ7AAV+egA7I+a0hUwJkeAg9A7++a4lrz7L8heT/ru2xmAyp4h9FgvEz1fXK+2QCA9tq
         yqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705475396; x=1706080196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Uia2QeSVilAB1bkR7hIqUNWTgwNcqN5mmFfpW4YcRw=;
        b=W9s3GcNhUoT+KWdiT4woQb66ePkLBVqFJXa0vnuZNKLgUzZKADrVY9WvltW2YkpTai
         pUFMkLoewZkRM2LbqI3KRlsraXCqnMXmiGiiIGsBeaHSsu6YMx7KpuJphzSh0w5Fk9E4
         7nXaOLYK5IGeOkVqsghjgFB9f2EH/2PctKVld7AVZTKxtRBgzJrZoy2iYmETgksY7wv4
         m71Mcx5ryZ9dFyn6OMwYhpFArKxMZPeqQ8NXZgVH+SYVKFXx4FEycks5HqQECtaTvZzd
         8H7sV8ypObmnUqfJIeUidXJmlgE/SMCxjL0Tcs8WXqxNwMtLK02qXULZ7N0SN4zGIk1J
         i9VA==
X-Gm-Message-State: AOJu0YwMwZyy7jyczDDNZ2nTica9CZKLaVfpY9MmpFqEn24zA7zzrONM
	fuGqMZ5fhwT6MiDeET9PBz8eCysLBWJKyg==
X-Google-Smtp-Source: AGHT+IHATHlwI8wPmkhLwOCT6nTRMrzh0Hpyh2vmRDOW2AT5ye15vyyEqcsyGiVAFXHbSoecIw+djQ==
X-Received: by 2002:a05:6a20:9f09:b0:19b:21ba:e13a with SMTP id mk9-20020a056a209f0900b0019b21bae13amr2529853pzb.77.1705475396300;
        Tue, 16 Jan 2024 23:09:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::b80b])
        by smtp.gmail.com with ESMTPSA id qn4-20020a17090b3d4400b0028b3539cd97sm15466375pjb.20.2024.01.16.23.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 23:09:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] coreutils: Fix build with clang
Date: Tue, 16 Jan 2024 23:09:51 -0800
Message-ID: <20240117070953.1058681-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193893

Add a gnulib patch to fix build with clang-18

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-posixtm-pacify-clang-18.patch        | 38 +++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.4.bb  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0001-posixtm-pacify-clang-18.patch

diff --git a/meta/recipes-core/coreutils/coreutils/0001-posixtm-pacify-clang-18.patch b/meta/recipes-core/coreutils/coreutils/0001-posixtm-pacify-clang-18.patch
new file mode 100644
index 00000000000..e6c84be3c41
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0001-posixtm-pacify-clang-18.patch
@@ -0,0 +1,38 @@
+From 67c298c36f69b6906840b7584be06b7b5f33f829 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 16 Jan 2024 17:21:08 -0800
+Subject: [PATCH] posixtm: pacify clang 18
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Khem Raj in:
+https://lists.gnu.org/r/bug-gnulib/2024-01/msg00045.html
+* lib/posixtm.c (posixtime): Pacify clang 18 by converting bool to int.
+Arguably this is a bug in draft C2x, since the non-pointer args to
+ckd_add should promote just like any other expressions do;
+but that’s not clang’s fault.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-gnulib/2024-01/msg00046.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ChangeLog     | 10 ++++++++++
+ lib/posixtm.c |  2 +-
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/lib/posixtm.c b/lib/posixtm.c
+index ef9f55f873..a072c7cad0 100644
+--- a/lib/posixtm.c
++++ b/lib/posixtm.c
+@@ -191,7 +191,7 @@ posixtime (time_t *p, const char *s, unsigned int syntax_bits)
+              | (tm0.tm_min ^ tm1.tm_min)
+              | (tm0.tm_sec ^ tm1.tm_sec)))
+         {
+-          if (ckd_add (&t, t, leapsec))
++          if (ckd_add (&t, t, +leapsec))
+             return false;
+           *p = t;
+           return true;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/coreutils/coreutils_9.4.bb b/meta/recipes-core/coreutils/coreutils_9.4.bb
index c0ca150253b..f233ce07eb8 100644
--- a/meta/recipes-core/coreutils/coreutils_9.4.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.4.bb
@@ -16,6 +16,7 @@ inherit autotools gettext texinfo
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
+           file://0001-posixtm-pacify-clang-18.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6e5c07e040b275e52"
-- 
2.43.0


