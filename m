Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD2BD58077
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.17085.1732536101006531373
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EhwAGuKa;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-431616c23b5so24259025e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536099; x=1733140899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6YoEzPpGC6XIkyjEBwr3IP+Zge6Myl3IwnnSJFq0qY=;
        b=EhwAGuKaZNFLP4wcatDIjQSYqOt1wYvjkjoxx9xae6pEOSv+ham5JbS4pWWvA8lgDu
         xr8rC11x2ruhK6G6BTAel+dPZN0oNVG3PdULWuO+Nhl/C8qyA56HypOYcuSQBoLk0Bv3
         Qm2qIKYkquIprwRtdl/CgPnEm8GuC+fRPvD45KOqgxsct856fu2od6MS/yyoScxiq3zQ
         f+P2Ifm305XyRmd6ZhlY90yzYX7FzZKHiaFYCIZuxJ1cvNwpjUug2X9/dEPQYrqKTdcF
         dUlP5G2mibIokHlQNzkyj3pOprI0blN9VznYm//3SC75KuaMoP8OWKPin0lGGvGfuDZt
         FlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536099; x=1733140899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6YoEzPpGC6XIkyjEBwr3IP+Zge6Myl3IwnnSJFq0qY=;
        b=iEm12B0wSCC2NIB/Q+QQEoaHR5YVaDnAv3/M1ZzvrxRy4HUg2xEkve0A3w6/8x9ATo
         xEvWCanyvUiCGnaanc7Woi2q5NE6nn7RKrvv2YZYKiC/yfMQBqOFjVyMJBdGVbFareY8
         yQLhW6TJKF0ZzPw5XwqIDq1NhyEcvbUdWspfqNXjthV1iTKqtXGJWoTK21rf2HYKfKKW
         nE+oSQPGN2+VqzXzlROyKmXKwcIDQUGjIcBCpzLkRFaOmv7/AqkAEJNuZp9K0DQR/XOK
         gtgMSRw+0PHBV/VjKAqaaZEEqJLaoWIUows7X4HhOn1g7mM/Sp9bi9SokewMTRMf2OAu
         UN4g==
X-Gm-Message-State: AOJu0YwxnWmJhS1ypGHL1Mwy4zDp//xDAvcH9wi5qboNz6LVY5o5p76c
	ynv2Lc7q9uaScK09o4sspS8c9RnxXMdtsTUuRB/4R2hC+3SlnKUJJWMQRA==
X-Gm-Gg: ASbGncvsTPFz4GTkcj/EAn/ByiMqEX27Uljqts75Wud8EpUszrQ22BGiUQvrCjYWUZX
	veekWZP84yV2DIbfYRxvsbzZRULwvZSzeEMuab2ztj/i3k+517z7J3awjU+bRhcrGEUh9dXwkS/
	CavCEfhvE94zyeQv5R28/8jVMDGWdC8pctUi6ofSY6DBN1/2ebq6svrSkMouMNwkqC+PM6ImJgb
	8HyezoWqJx7ZEwI+6xyugG1svleI1P64ALi1K8tkepA1dLjlKP8U3FvIQUrSBVvNVOpQsbsDpLD
	Q0iYR9qOVak=
X-Google-Smtp-Source: AGHT+IHhWuM3+TS+p73vQhpvx8g0DVoQ0Vf4s15ZKS8xgLriOIa9vq43HZ2ALKTsDrhmLOuJya5++g==
X-Received: by 2002:a05:600c:a03:b0:433:c76d:d56b with SMTP id 5b1f17b1804b1-433cdb2fde2mr98211505e9.12.1732536097684;
        Mon, 25 Nov 2024 04:01:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/35] libgpg-error: upgrade 1.50 -> 1.51
Date: Mon, 25 Nov 2024 13:01:03 +0100
Message-Id: <20241125120127.2205232-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207758

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Do-not-fail-when-testing-config-scripts.patch     | 2 +-
 .../libgpg-error/libgpg-error/pkgconfig.patch              | 7 ++-----
 .../{libgpg-error_1.50.bb => libgpg-error_1.51.bb}         | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.50.bb => libgpg-error_1.51.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
index d72838bb05d..0910d6cc632 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
@@ -1,4 +1,4 @@
-From 75622f8b21459eb556b36edc3537fdaded7f04bf Mon Sep 17 00:00:00 2001
+From 581919f3af914c6b62e51b345d5d15e709f20e77 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 28 Feb 2020 09:19:56 +0000
 Subject: [PATCH] Do not fail when testing config scripts
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 794a3993e79..dbf728b2ded 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,7 +1,7 @@
-From ba5ec5615d76dfa4afb429a4e11f3e7e3bc9de76 Mon Sep 17 00:00:00 2001
+From 3529df77cd20253ce2a9c1962d7a72058a04fd98 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 21 Aug 2024 20:03:29 -0700
-Subject: [PATCH 1/2] support pkgconfig
+Subject: [PATCH] support pkgconfig
 
 Upstream-Status: Inappropriate [gnupg upstream will not take this, it has been tried with other components]
 
@@ -241,6 +241,3 @@ index 2d24071..c561725 100644
 -  AC_SUBST(GPG_ERROR_MT_LIBS)
  ])
 +
--- 
-2.25.1
-
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.50.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
index 02cdf7707d8..741969beb09 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "69405349e0a633e444a28c5b35ce8f14484684518a508dc48a089992fe93e20a"
+SRC_URI[sha256sum] = "be0f1b2db6b93eed55369cdf79f19f72750c8c7c39fc20b577e724545427e6b2"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.39.5


