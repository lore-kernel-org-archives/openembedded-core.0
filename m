Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BD6CDB472
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:33:23 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38122.1781857994056230307
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S9Tyqwzx;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-46066e640easo1128694f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857992; x=1782462792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdLnLLqMbheT/sF/Zw7YxxnMjkntbWZ9+3Apqdz8onw=;
        b=S9TyqwzxJurNH9rZu9laCg54aLm3LTHLvVC1oEVQfgT6RVPIBQZS7F22+yEUlh8eXK
         MWmyqOmKyRADTKQueJmOKOMg7E3/EqyTLuTvkNy2klrJRxMkDoE20lUbYQJvL2vTl33N
         VN7c8xkq7QcPw20avDNomM/eB19ZefvcPEPzFN+HibbgEToIB5cHtWynVfMLNaq6X8PE
         PAvPY7+zLv6zpJG6DqEEG04XsBFYk8ynttxGtQlYoBBvqaPaGMf2GX0ljtoPH4eiJm26
         Ox5QWTEyepAtvfMzvTwgoqvAmJLWWYetAQ6QFqnqXK43V0zGRdAM+T8v5mRFYBmwXdWM
         0oRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857992; x=1782462792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LdLnLLqMbheT/sF/Zw7YxxnMjkntbWZ9+3Apqdz8onw=;
        b=MK0qdazCnU8ed8mTST7eRijLlYCuIk6m2YEx/WZYOftfi9qgfhFFYzf+iEc3gjbwkR
         XjL87GbL4oReoYUYZnbyeKu3hvd0ghOVlLBnvfhn0L1kGhs7of0v0Ioncv+49tVWtX1D
         muaVKbIPWVaavpS8BW16CHmKBK383+JdRMBBy4UYgSTf0R+J8RKRg5+Thn5BHJYqAHNf
         WtA5L1MuQ6svXzjnL0aEBPyl4kjccjZM2dOEDuBdRstTTQPksTfVIbLDDtxbr/uMuRG0
         siogxLJhvUEO48XpFSYj7F4RN4qMurBmCkxBv9w6hvtHccRMeLcQ88GtQnsHWD4apPQ4
         KrWQ==
X-Gm-Message-State: AOJu0YwRpvAsPZE3kKSckVWFblgz1QUk7XPyT116liCCxCmCWj1O+Xuq
	hhEcEuzEW1GZU3SDpdJp5v5VbilsQmebMJZHXEwNRCfPWVhX49oBqxQ7oJILL2j4
X-Gm-Gg: AfdE7cl/VhxQ0oGJBVI0ZHzH+C4ItJBeKtXUCtdPTk5GD4SPeTHb6FxXTstLn9/QmlD
	xv38J7RhpyjdY05/83DorBY23M/JYQxKWuYbtmTnMAZV1EjRmkpugmQ/H6SCdtFqP12yh+IKcKy
	RHE0b8UrMOl3Y8RjmvLXNEot47FLjUnKdjSsUbbKSQIFxk0mRbcUMnr6ewRWVVWC8qDeTd1Vros
	MKeCGyW03TZQCQIjcj5p8tQPpvNpU1GYR0MpnSglRlDXkuXGPs/6o6Oxcg7Qd3tgiKvEmmQl0nV
	f6LSfr7kylNnuHGwcnt9O3H++5vINiOr9dpa4ELL3Itqgrw/0BcrfY0HOaGE18/+Qq4od0hcLvl
	OtMwEcYPp1vZBogMpxjJT1BuM6gvpd+zlix3dus2JnRgNvSQqqO0tR5xx/ydc8ZaX6NpjKBSwHo
	9oehbWXEBGVOndeOXdeCtyAqg4oKbjSmGQ5Iuvd1jWPWwHc5gs
X-Received: by 2002:a05:6000:41e6:b0:465:7c2f:c09 with SMTP id ffacd0b85a97d-4657c2f0c7cmr2385777f8f.16.1781857992220;
        Fri, 19 Jun 2026 01:33:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc429a1sm5878368f8f.30.2026.06.19.01.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:33:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/15] lttng-ust: upgrade 2.14.0 -> 2.15.1
Date: Fri, 19 Jun 2026 10:32:47 +0200
Message-ID: <20260619083305.3505156-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619083305.3505156-1-alex.kanavin@gmail.com>
References: <20260619083305.3505156-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239140

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-lttng-ust-common-link-with-liburcu-explicitly.patch | 6 +++---
 ...thon-lttngust-Makefile.am-Add-install-lib-to-setup.patch | 6 +++---
 .../lttng/{lttng-ust_2.14.0.bb => lttng-ust_2.15.1.bb}      | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.14.0.bb => lttng-ust_2.15.1.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
index ceb240680b..d9cf861dbc 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
@@ -1,4 +1,4 @@
-From 1b6bbf14de8fdfe60e446c93969e29bc2cf5f2dc Mon Sep 17 00:00:00 2001
+From 182cb1e754e861a4eff4bde3919bc32462e3072c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 5 Sep 2021 10:44:19 +0200
 Subject: [PATCH] lttng-ust-common: link with liburcu explicitly
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/lib/lttng-ust-common/Makefile.am b/src/lib/lttng-ust-common/Makefile.am
-index 1ccc290..6531fa0 100644
+index c350edc..09212a7 100644
 --- a/src/lib/lttng-ust-common/Makefile.am
 +++ b/src/lib/lttng-ust-common/Makefile.am
-@@ -16,6 +16,7 @@ liblttng_ust_common_la_SOURCES = \
+@@ -18,6 +18,7 @@ liblttng_ust_common_la_SOURCES = \
  
  liblttng_ust_common_la_LIBADD = \
  	$(top_builddir)/src/common/libcommon.la \
diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
index 7bbe5c216e..733a4de456 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
@@ -1,4 +1,4 @@
-From 30660997d220602202d8dc7264e49095a1581947 Mon Sep 17 00:00:00 2001
+From cd2fbbf5454af7c0910549e841b5da7a1b133a89 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 20 Feb 2024 12:19:06 +0000
 Subject: [PATCH] python-lttngust/Makefile.am: Add --install-lib to setup.py
@@ -14,10 +14,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/python-lttngust/Makefile.am b/src/python-lttngust/Makefile.am
-index d53e21d..283901e 100644
+index 30db9fb..d46b6ee 100644
 --- a/src/python-lttngust/Makefile.am
 +++ b/src/python-lttngust/Makefile.am
-@@ -45,7 +45,7 @@ install-exec-local: build-python-bindings.stamp
+@@ -47,7 +47,7 @@ install-exec-local: build-python-bindings.stamp
  	if [ "$(DESTDIR)" != "" ]; then \
  		opts="$$opts --root=$(DESTDIR)"; \
  	fi; \
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb
index 1a15c5b420..d731aa2eb0 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
            "
 
-SRC_URI[sha256sum] = "82cdfd304bbb2b2b7d17cc951a6756b37a9f73868ec0ba7db448a0d5ca51b763"
+SRC_URI[sha256sum] = "37c9b58ea7aa7bc47d6630b52ba1a48ebce095b9a196eab4ddd273d78301792d"
 
 CVE_PRODUCT = "ust"
 
-- 
2.47.3


