Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77065C4332F
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:34 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.8676.1637163333148805699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Oj3RRwYA;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id i5so5519949wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fAmapJsaed3sWdU6Cdo7GYa/QQGq6PcwHv+caAT41Ws=;
        b=Oj3RRwYAwo9WEowYvNJO/EqO27kr9X8jXFQHdmO3hXggIp3jLU+g3ZgmpKx4k5OGav
         dsWyuML5p/jHU6+51rf1m5CIW85nZz561ls1hN+Bjx3pOeU5ofYXFSbUI/c3dXXOqvyh
         k5u1kAh3U0Jeu9Snog11fePZw+Qii7Zo7uH/rj6NCpMMWj7ngZtHUDefJaRo5iPTbAVh
         dMQJcyLRGP5zpwCko7bd7IMch9sf5sJ+Dvn1J7Z43QBhDhzHfkIoO6vuM/7+Xv3aU6cd
         wiQ83L9jPFuQB/b0HoXrT2Q65FBWCVkaU5AcrdRicOqfkQbPKdXMmadUg99PusnzflkF
         bh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fAmapJsaed3sWdU6Cdo7GYa/QQGq6PcwHv+caAT41Ws=;
        b=cwHSgoenuCWMg1ENrGA/++0sQgXEhWrZdT57rCdoUns0cYMSF9OVja6gAADSBGtR1B
         goC98M0gf3XKzxwT7LHyvYyCeosoF0Ie6PM+3Mut7WJAHfFhExai38ooLI1ArS/TdUho
         6+ZT2XpS+JqhF/czbmryXpWzUMgQdf7BKJMib4f0Np3bmtJa9cxAZSNnMAo871aUQ8cX
         B9JyYjKJFp6hZ19DDa5iiclb5MdfCbWFdP1nlWKKsWS18EzK94/C5byWLA6LdduD1878
         cTYqvTAIYZzk3/P17bmrc4qg7O+//j6bNqnYzZSpZ8CAk7nYyPD0Z6t88EK7fkv+tIxw
         v2Gw==
X-Gm-Message-State: AOAM532d63sj6Kz6U3ghRnmh+rc38tgb8nrEhaUOpSdu18ydfsJPEmuC
	jiLoFC8+T+NE0N0zzIlQf8zTH5WFtmY=
X-Google-Smtp-Source: 
 ABdhPJyzVLzTWsoCj4OIsxi5HZhiWzxqqEqMjODzSKnawwi69D9mG45VoqT0653ZaSLVbngZbFqoNA==
X-Received: by 2002:adf:f6cf:: with SMTP id y15mr22279418wrp.56.1637163331721;
        Wed, 17 Nov 2021 07:35:31 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/36] libunistring: address automake 1.16.5 failures
Date: Wed, 17 Nov 2021 16:34:57 +0100
Message-Id: <20211117153525.257146-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158403

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...IT_PACKAGE-work-with-Automake-1.16.4.patch | 57 +++++++++++++++++++
 .../libunistring/libunistring_0.9.10.bb       |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/libunistring/libunistring/0001-Make-gl_INIT_PACKAGE-work-with-Automake-1.16.4.patch

diff --git a/meta/recipes-support/libunistring/libunistring/0001-Make-gl_INIT_PACKAGE-work-with-Automake-1.16.4.patch b/meta/recipes-support/libunistring/libunistring/0001-Make-gl_INIT_PACKAGE-work-with-Automake-1.16.4.patch
new file mode 100644
index 0000000000..d8424f28d4
--- /dev/null
+++ b/meta/recipes-support/libunistring/libunistring/0001-Make-gl_INIT_PACKAGE-work-with-Automake-1.16.4.patch
@@ -0,0 +1,57 @@
+From 15e4365267e316f15222b8bf9f0a7cd0db231e9c Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Sun, 8 Aug 2021 01:58:42 +0200
+Subject: [PATCH] Make gl_INIT_PACKAGE work with Automake >= 1.16.4.
+
+Reported and analyzed by Nicole Mazzuca <mazzucan@outlook.com> in
+<https://lists.gnu.org/archive/html/bug-libunistring/2021-08/msg00002.html>.
+
+* m4/init-package-version.m4 (gl_INIT_PACKAGE): Use a new macro
+gl_INIT_EMPTY.
+(gl_INIT_DUMMY): Expand to empty in two steps, via a new macro
+gl_INIT_DUMMY2.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ ChangeLog                  | 10 ++++++++++
+ m4/init-package-version.m4 | 12 ++++++++----
+ 2 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/m4/init-package-version.m4 b/m4/init-package-version.m4
+index f131a84..a26b1ab 100644
+--- a/m4/init-package-version.m4
++++ b/m4/init-package-version.m4
+@@ -1,5 +1,5 @@
+-# init-package-version.m4 serial 1 (gettext-0.18)
+-dnl Copyright (C) 1992-2009 Free Software Foundation, Inc.
++# init-package-version.m4 serial 2
++dnl Copyright (C) 1992-2021 Free Software Foundation, Inc.
+ dnl This file is free software, distributed under the terms of the GNU
+ dnl General Public License.  As a special exception to the GNU General
+ dnl Public License, this file may be distributed as part of a program
+@@ -77,7 +77,7 @@ AC_DEFUN([gl_INIT_PACKAGE],
+             m4_bpatsubst(m4_dquote(
+                 m4_defn([AM_INIT_AUTOMAKE])),
+               [AC_PACKAGE_NAME], [gl_INIT_DUMMY])),
+-          [AC_PACKAGE_TARNAME], [gl_INIT_DUMMY])),
++          [AC_PACKAGE_TARNAME], [gl_INIT_EMPTY])),
+       [AC_PACKAGE_VERSION], [gl_INIT_DUMMY])
+     [AC_SUBST([PACKAGE], [$1])
+      AC_SUBST([VERSION], [$2])
+@@ -85,7 +85,11 @@ AC_DEFUN([gl_INIT_PACKAGE],
+   m4_define([AM_INIT_AUTOMAKE],
+     m4_defn([gl_RPL_INIT_AUTOMAKE]))
+ ])
+-m4_define([gl_INIT_DUMMY], [])
++m4_define([gl_INIT_EMPTY], [])
++dnl Automake 1.16.4 no longer accepts an empty value for gl_INIT_DUMMY.
++dnl But a macro that later expands to empty works.
++m4_define([gl_INIT_DUMMY], [gl_INIT_DUMMY2])
++m4_define([gl_INIT_DUMMY2], [])
+ AC_DEFUN([gl_RPL_INIT_AUTOMAKE], [
+   m4_ifval([$2],
+     [m4_fatal([After gl_INIT_PACKAGE, the two-argument form of AM_INIT_AUTOMAKE cannot be used.])])
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/libunistring/libunistring_0.9.10.bb b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
index 589faacb05..0692bbcb44 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.10.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
@@ -22,6 +22,7 @@ DEPENDS = "gperf-native"
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+           file://0001-Make-gl_INIT_PACKAGE-work-with-Automake-1.16.4.patch \
 "
 SRC_URI[md5sum] = "0d3274e9838396b12200f8b54ddaf43b"
 SRC_URI[sha256sum] = "a82e5b333339a88ea4608e4635479a1cfb2e01aafb925e1290b65710d43f610b"
-- 
2.20.1


