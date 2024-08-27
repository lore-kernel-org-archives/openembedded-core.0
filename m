Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3652FC54741
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:20 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.71679.1724736253721525522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GRQPPj5L;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a866cea40c4so585821666b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736252; x=1725341052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+jX0Za1isY84Y75rqLvK20wiPEvPXWk+4VJ2myMzHI=;
        b=GRQPPj5LuI+EpsIC+KDN89Y/iTR9pKx/YznkHxzuZZ/VmjVJHaUmHILW691xwoTfUP
         dXrR/8k8UGvYSBN+5T/6A4sZQUfAOPcdff9ZdJmvSSRDPfmCfmoEson72gnJevL8Np6m
         x1HtPAwjkDhCXOQZt1dwLEE4h1u4IAaf5spLVBUc7JbasdZg5uPa+ahyjuyJHWkRNk5M
         lzHrvJybxgzuw7xjLTUNeidsyR6HikgoGxSabIfznJCiHYMf1p5Cbm0/DK38yoTMhEBz
         RgHQ/vtDxbLegPdkn4bE909au6iql6TsBeFOys6csChAh+8uv583VbyN4WaNhoeU5xkF
         PrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736252; x=1725341052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+jX0Za1isY84Y75rqLvK20wiPEvPXWk+4VJ2myMzHI=;
        b=JaXyjSenMj/SkDVWUMhLgBU5nNpDNVuYZ8/uNZLOobqjU8uzLSlNp2N9x8TzbaAfY1
         7Asp/yi32j8/4fQPe7B9VaOdVKpflT9IbOBDNsqdMzCVqnl0XjdfhzZ3GQHbZ+oU7yJR
         yqhIMp5AjaG0t4QFM7sMlGZMS2wRuWVeyT0SEYQXQ1K8QWNS/gCPq1jt0SaKlYcaWd2W
         QzdvM2X1npPOfGcG95/ERlSBBdRg9BLmw7gYtC+wOl2O/2S5vT9c7eeT884j4LIamvkF
         jO1u2qpNTJT8IVlo5jagsEZp8I6UNEY+nkqt2GcuimlFVG+qID/I9Iidxb+FyPNxrCH9
         4UQg==
X-Gm-Message-State: AOJu0YwEyjoZiOOSahqYwXmvwSQs4RJJ6IXAKqTQ5s6YSLaSj56YIg7i
	X9NuCZehffTSs6ugSf/6yg8pNW1j/tfjbmobgsQtbcrmknKoBrIIbLHADQ==
X-Google-Smtp-Source: AGHT+IGAXUjKBFEUmiTGNLQ1dUiyc3nA5fGgX6pPDk2XfNCREMxiFaKJAi91WQzyrXCHqRTGY1JIeQ==
X-Received: by 2002:a17:907:9449:b0:a86:80b7:4743 with SMTP id a640c23a62f3a-a86a51989f7mr746426366b.24.1724736251776;
        Mon, 26 Aug 2024 22:24:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/34] ifupdown: upgrade 0.8.41 -> 0.8.43
Date: Tue, 27 Aug 2024 07:23:44 +0200
Message-Id: <20240827052354.1319810-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203800

From: Alexander Kanavin <alex@linutronix.de>

Do not force CFLAGS (no longer necessary).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch | 3 +--
 ...-Makefile-do-not-use-dpkg-for-determining-OS-type.patch | 7 +++----
 .../files/0001-ifupdown-skip-wrong-test-case.patch         | 3 +--
 ...n2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch | 3 +--
 meta/recipes-core/ifupdown/files/tweak-ptest-script.patch  | 3 +--
 .../ifupdown/{ifupdown_0.8.41.bb => ifupdown_0.8.43.bb}    | 4 ++--
 6 files changed, 9 insertions(+), 14 deletions(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.41.bb => ifupdown_0.8.43.bb} (94%)

diff --git a/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch b/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
index 6c4ed526bfa..83fb706be07 100644
--- a/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
+++ b/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
@@ -1,4 +1,4 @@
-From 8dfbcf02e424ba1fdef587d81c9e08a37ab8c1b6 Mon Sep 17 00:00:00 2001
+From 97b196efe9671d0185d22710371acb52bb7130e2 Mon Sep 17 00:00:00 2001
 From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
 Date: Tue, 2 Jul 2019 20:10:42 +0200
 Subject: [PATCH] Define FNM_EXTMATCH for musl
@@ -24,7 +24,6 @@ function); did you mean 'FNM_NOMATCH'?
 Upstream-Status: Submitted [https://salsa.debian.org/debian/ifupdown/merge_requests/5]
 
 Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
-
 ---
  archcommon.h | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch b/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
index 6e15a25224d..f84a0a1311a 100644
--- a/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
+++ b/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
@@ -1,17 +1,16 @@
-From 7fe516cbaf9fda09d99dcb54d4645367cffc8a4d Mon Sep 17 00:00:00 2001
+From 4922e2011a0132c122df4f0cf4d66d565c749060 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 9 Jan 2020 15:38:06 +0100
 Subject: [PATCH] Makefile: do not use dpkg for determining OS type
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 0ce2fa3..739aef2 100644
+index 9cd758b..58b4173 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,6 +1,6 @@
@@ -21,4 +20,4 @@ index 0ce2fa3..739aef2 100644
 +ARCH := linux
  
  BASEDIR ?= $(DESTDIR)
- 
+ PKGLIBDIR ?= /lib/ifupdown
diff --git a/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch b/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
index 9ae24da51ee..8aa227c8ecb 100644
--- a/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
+++ b/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
@@ -1,4 +1,4 @@
-From 782d8a869c266820d0f34974436f244f67afaea7 Mon Sep 17 00:00:00 2001
+From ea48a9816643482d438e4bb276c90cd6f02847e4 Mon Sep 17 00:00:00 2001
 From: Zqiang <qiang.zhang@windriver.com>
 Date: Mon, 19 Apr 2021 14:15:45 +0800
 Subject: [PATCH] ifupdown: skip wrong test case
@@ -10,7 +10,6 @@ and are skipped directly.
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Zqiang <qiang.zhang@windriver.com>
-
 ---
  tests/testbuild-linux | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
index 7b4b761e6a6..24e3ba0d9de 100644
--- a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
+++ b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
@@ -1,4 +1,4 @@
-From fc8e8d4cb19ff30e69aa1855332544f1017f974c Mon Sep 17 00:00:00 2001
+From 68b64a5c9d466352b0c161019bd7255e31db9a4c Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Wed, 6 Aug 2014 14:54:12 -0400
 Subject: [PATCH] defn2[c|man]: don't rely on dpkg-architecture to set arch
@@ -13,7 +13,6 @@ like the loopback device not being configured/enabled.
 
 Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
 Upstream-Status: Pending
-
 ---
  defn2c.pl   | 6 +++---
  defn2man.pl | 6 +++---
diff --git a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
index fa6bb84df30..c1953f0691b 100644
--- a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
+++ b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
@@ -1,4 +1,4 @@
-From a6bb2ac5f521c678abbbdb1960d28f750f4357a6 Mon Sep 17 00:00:00 2001
+From 5eede8950e35404b109cc3cf6a53bf3c84b31cfb Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Mon, 3 Feb 2020 17:33:11 +0800
 Subject: [PATCH] Tweak tests of ifupdown to make it work with oe-core ptest
@@ -7,7 +7,6 @@ Subject: [PATCH] Tweak tests of ifupdown to make it work with oe-core ptest
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
 ---
  tests/testbuild-linux | 11 ++++++-----
  1 file changed, 6 insertions(+), 5 deletions(-)
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb
similarity index 94%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.43.bb
index c7004ab41df..1557551d454 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=mast
            file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
            file://tweak-ptest-script.patch \
            "
-SRCREV = "369d9d3c13a0c56ad09fd4f13b4a80eb9a94e270"
+SRCREV = "cf86ad5819aba8f9b020a95257c9a8c4911b1c85"
 
 S = "${WORKDIR}/git"
 
@@ -25,7 +25,7 @@ inherit ptest update-alternatives
 
 do_compile () {
 	chmod a+rx *.pl *.sh
-	oe_runmake 'CC=${CC}' "CFLAGS=${CFLAGS} -Wall -W -D'IFUPDOWN_VERSION=\"${PV}\"'"
+	oe_runmake 'CC=${CC}' "-Wall -W -D'IFUPDOWN_VERSION=\"${PV}\"'"
 }
 
 do_install () {
-- 
2.39.2


