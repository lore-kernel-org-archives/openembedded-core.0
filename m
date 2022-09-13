Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD1AC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:18:40 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.5278.1663078710036554503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3Yp7+xEN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id b21so11971605plz.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=BVemcmZRxNCWoBiM7hbQ5TJR9ko4A5+Yu1skZwzBCvw=;
        b=3Yp7+xENqB6ooBLiIUl2gbcGsqiBESyXLB3Whj/f5IjLteIlIv/QYgyu3Mn7fGUN1+
         wUWxguN2IeHAZ9G98UBQthudEDzO3YUu6ab0OpOSYU8dKS/Wi4qVK86s/Chyyqk8k0D4
         oAh+6DMolkAqz4WLpxSI+xqfpLCS1gd2uObRGJbLrPuVISkydSSmbLc9C4KUspTLdEYZ
         vSdIg7OmcIiNKJWjT2bSxj2ArmcBiRi58slZ1oMse70lntMiX1BuuhrPvpBeVd8GWqJ3
         O3qgU9luWd1TbCDKwG/6XMdHnXkR0bqwArMzH7NWXca5DExIEIHMsi43qSPWaB/++H8L
         ipdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BVemcmZRxNCWoBiM7hbQ5TJR9ko4A5+Yu1skZwzBCvw=;
        b=mlzfWfJpP9ZrHLVU5isakF6YB2REvm9l8JGpEcZY6E+mOC33YoGp4oGx5Osag9u93H
         7cQYnS82GHs8iLfkpKDbYKIyPAx9LiqbtBCYJRSXzRzBOs93UOxH0EENkddQ5N47qiH0
         AHYz7t3EOfZA+UsJf79R2E81ek9Jt/Fo+6NMi9y7Eb6ST25XnN08GvzNYpFYh5SLN1vI
         4ucnnwyvfdpae+ZTp8HQLK2dj3iMpc0f9ef0TCQ6RAjW1D8Dl9d2xNpUXAHmulOccmbj
         t7A2IHD1EezTRn7ZsQj+RWd5oJlJNGu4GyCcDoRt+4Y14cbVMRpVA9Mm8N6Vr7k+8ajQ
         SDLg==
X-Gm-Message-State: ACgBeo0LFUYwbIknpw/IIMU2kNWpJ4SRtIdR4aq2E4Ti5sG3ohU+1sJ0
	IjeKQ+P5pp3vTNM3VA8EYXuj4K6u53C44ILa
X-Google-Smtp-Source: 
 AA6agR6TIlCP6FEScmWQcxRBsxuPLfYWPFzkwVzMg7T0dHsN79F6/AC4lZ13LaYfkpMKyvltpfmyeg==
X-Received: by 2002:a17:902:b286:b0:176:979b:9f73 with SMTP id
 u6-20020a170902b28600b00176979b9f73mr32886135plr.126.1663078709041;
        Tue, 13 Sep 2022 07:18:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa796ab000000b0053bf1f90188sm8086424pfk.176.2022.09.13.07.18.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:18:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/16] autoconf: Fix strict prototype errors in
 generated tests
Date: Tue, 13 Sep 2022 04:17:48 -1000
Message-Id: 
 <7863774e4f436a5aefa86f7fe0d4dec6c336e8db.1663078051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663078051.git.steve@sakoman.com>
References: <cover.1663078051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:18:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170586

From: Khem Raj <raj.khem@gmail.com>

This will fix issues with autoconf tests which fail due to lacking
prototypes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb477854ba230d8a8370f24880bd421607399e5a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...totype-for-functions-with-no-paramet.patch | 64 +++++++++++++++++++
 .../autoconf/autoconf_2.71.bb                 |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-specify-void-prototype-for-functions-with-no-paramet.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/0001-specify-void-prototype-for-functions-with-no-paramet.patch b/meta/recipes-devtools/autoconf/autoconf/0001-specify-void-prototype-for-functions-with-no-paramet.patch
new file mode 100644
index 0000000000..4d8aa296cd
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/0001-specify-void-prototype-for-functions-with-no-paramet.patch
@@ -0,0 +1,64 @@
+From 7ccfea413216bddd988823acf4e93421ea0f7f9f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 16 Aug 2022 18:35:45 -0700
+Subject: [PATCH] specify void prototype for functions with no parameters
+
+Compilers defaulting to C99 flag such functions as warning which fails
+to compile when using -Werror
+
+Fixes
+error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/autoconf-patches/2022-08/msg00003.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/c.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/lib/autoconf/c.m4
++++ b/lib/autoconf/c.m4
+@@ -127,7 +127,7 @@ m4_if([$2], [main], ,
+ [/* Override any GCC internal prototype to avoid an error.
+    Use char because int might match the return type of a GCC
+    builtin and then its argument prototype would still apply.  */
+-char $2 ();])], [return $2 ();])])
++char $2 (void);])], [return $2 ();])])
+ 
+ 
+ # AC_LANG_FUNC_LINK_TRY(C)(FUNCTION)
+@@ -151,7 +151,7 @@ m4_define([AC_LANG_FUNC_LINK_TRY(C)],
+ #define $1 innocuous_$1
+ 
+ /* System header to define __stub macros and hopefully few prototypes,
+-   which can conflict with char $1 (); below.  */
++   which can conflict with char $1 (void); below.  */
+ 
+ #include <limits.h>
+ #undef $1
+@@ -162,7 +162,7 @@ m4_define([AC_LANG_FUNC_LINK_TRY(C)],
+ #ifdef __cplusplus
+ extern "C"
+ #endif
+-char $1 ();
++char $1 (void);
+ /* The GNU C library defines this for functions which it implements
+     to always fail with ENOSYS.  Some functions are actually named
+     something starting with __ and the normal name is an alias.  */
+@@ -252,7 +252,7 @@ dnl other built-in extern "C" functions,
+ dnl when it actually happens.
+ [AC_LANG_PROGRAM([[$1
+ namespace conftest {
+-  extern "C" int $2 ();
++  extern "C" int $2 (void);
+ }]],
+ [[return conftest::$2 ();]])])
+ 
+@@ -2457,7 +2457,7 @@ using std::strcmp;
+ 
+ namespace {
+ 
+-void test_exception_syntax()
++void test_exception_syntax(void)
+ {
+   try {
+     throw "test";
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.71.bb b/meta/recipes-devtools/autoconf/autoconf_2.71.bb
index 799191e2ca..239b268119 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.71.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.71.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/autoconf/${BP}.tar.gz \
            file://preferbash.patch \
            file://autotest-automake-result-format.patch \
            file://man-host-perl.patch \
+           file://0001-specify-void-prototype-for-functions-with-no-paramet.patch \
            "
 SRC_URI:append:class-native = " file://no-man.patch"
 
-- 
2.25.1


