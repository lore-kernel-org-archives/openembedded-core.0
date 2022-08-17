Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF07C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 07:05:03 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.25908.1660719894563230614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 00:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YlI7m/e1;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id x23so11255341pll.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 00:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=CdD9nbD1kjMYvSsoREGfXHZl0kbpmFLxLN6/eANoKCY=;
        b=YlI7m/e1KlhFq0HDOV+dnXMK+XBlU4tRc0SVylwboSoQ30Ug8GjZu3wnAb5OSrMZBs
         V9GoLuRYPMtF1lGKnJ3jOeiLe/kHYpJSoJRycb6THpVaAnHN/VLLnp8NbwOXv5Y2fLfA
         0STvG4hD/3Y4Lq2RpaQWGvtBDHF+p4yW9cd4w6dKPZ3ncd11fvYUnN4LN3wm71tXvods
         L1DRtVKOgHMr8Wv5vC9TAz8sYDl+MEY3lWoAQoED/W+Zlwvit28DQU1TyuWjpiMud5EF
         SGcvQzUAN7EgEKYg9l1ONNNkIM+tL6Ha3O8xEPAoxO67Lp0RGPouEvvY51gw+vC+JD0+
         wWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=CdD9nbD1kjMYvSsoREGfXHZl0kbpmFLxLN6/eANoKCY=;
        b=haVqcE+tXfGmMrqIMoKtbBR7ypugt6tEC5vLQ4PXUOV+CAnyzRbUsqzSql/v83ikv7
         3zOou22eaqcrtc1YzzLHhMqcWjidjobcDnLn7nW3+ER2ZUxtEQ26jkcE+iip8HhkgV1L
         1poitiEVKMp+wfl2xoJGOx9tRXtpqKviq30x+eBTciNn5OqF0CxQnYy6//MjjAf2KWDF
         2il2+O+Jgm5JU4lQmx0Dp+Qlq3C+F0ZOKa/vEBpEBGihfYsSdDUKu2UnZpdE7QVKq7q7
         JQp4JjCYIcjFNANhN4E5QxFhWctwGK4BbzYeAObov7M9TWQfPbCi81+MoaJ25mm8V3cC
         5pDw==
X-Gm-Message-State: ACgBeo3cdkbKH3V9wJg3pXcCAIVKQIQzi4nZhWNDi7lA81vvE5ADB4d4
	sYXGFgL63CxxfsUEfZEdUaSsvn76y02O9w==
X-Google-Smtp-Source: 
 AA6agR5ENmf7vXrTVFKgrphWg5DxEU4ErdPQPQmyiKKcSc6wnj/cpHSMC/04DKjYaro7KdBt8oRSyQ==
X-Received: by 2002:a17:90b:3807:b0:1f4:ecf7:5987 with SMTP id
 mq7-20020a17090b380700b001f4ecf75987mr2312838pjb.13.1660719893564;
        Wed, 17 Aug 2022 00:04:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 196-20020a6218cd000000b0052b94e757ecsm9638546pfy.213.2022.08.17.00.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 00:04:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 6/7] autoconf: Fix strict prototype errors in generated
 tests
Date: Wed, 17 Aug 2022 00:04:39 -0700
Message-Id: <20220817070440.537761-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220817070440.537761-1-raj.khem@gmail.com>
References: <20220817070440.537761-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 07:05:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169472

This will fix issues with autoconf tests which fail due to lacking
prototypes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.37.2


