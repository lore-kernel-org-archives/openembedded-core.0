Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0A1C001B1
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.20343.1687728168350364996
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=e2ufiA4L;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3113675d582so2165044f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728166; x=1690320166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1AhblZEXTjZ4d7drEpEizY9cC7nHk4N4ohTcvKuwLY=;
        b=e2ufiA4LDwQQbMNGYa/hbqB2LCWk2NnUnXCnq779wxQ3jry1DYb3z5ke5p9/ZAHfni
         hlxOCMSV/0v6BZwHcm6jYIrhASE9E+/zS0fmJFYlgL/fXf/FfU/AywSeMy6yIhrGubVq
         e0KbMNJAGBg6tiAqUvThT2naalHWaWzn+DiVlIsj8eHPqUSLJ3jzSHAlfM7OxBtv0UAi
         +hxpHrJGuJiGuOqcRTtWaqAI3sGmztRPUK/7k+MGZjDOwmxdCVkTy+dPM8jERcPx8EtZ
         bA9rSOC6CcvqWsNSNESlmGoqzeZZDy4K6XnIUh0pM4Kns6nugOmPQd/2vLrLJ76gCyc4
         G2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728166; x=1690320166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1AhblZEXTjZ4d7drEpEizY9cC7nHk4N4ohTcvKuwLY=;
        b=h6w/kjMTxo3UBO0W6VLvpEwd8eWRLdtG3qUV4fMvVYcLaWqJknuXbYt//dbTCHD5ns
         yWf6hWrQl4ak/RzwRguuzuZGTcrBv/NTvibLHkPtWxd6E/JwJrS9gMR9vYKH2hSAzB7B
         M0mAe1r1UCw81VcA+ZKcL2lhal0XO814b9EKJ0fb8vUemNyTTJC4TLo/P3NAz9IdaKIG
         L/xyXzlNFFLcs+ovhP9NN21LfCF4OQikCn2jlhoXl3qqjHcGYdma0521u/bAicG6h/cN
         LzSa6TUcfa2xAPaPxCLAqUODCUxihJJQt+gri2A7RLa325j8qFQ0F0cBGzpsM0dGzdBJ
         AK+w==
X-Gm-Message-State: AC+VfDzL/MmJJfMPrAGilpM+9Dbr/FDsmqPwK/8fW5jUNBB3cxQT5UCR
	RKcbgPixZpXtIC28fSnsFoduqrK+lFWpIA==
X-Google-Smtp-Source: ACHHUZ4JocbVlHUlhE4TDfTo7KqsvPKuktbIcgsjEsa0OoIgbnyedWC3tUiGzJMaZlCKTqza3BdAUw==
X-Received: by 2002:a5d:618b:0:b0:313:f366:2c69 with SMTP id j11-20020a5d618b000000b00313f3662c69mr64623wru.46.1687728166561;
        Sun, 25 Jun 2023 14:22:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/21] lua: update 5.4.4 -> 5.4.6
Date: Sun, 25 Jun 2023 23:22:24 +0200
Message-Id: <20230625212241.915739-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183379

License-Update: formatting

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../lua/lua/CVE-2022-28805.patch              | 26 --------
 .../lua/lua/CVE-2022-33099.patch              | 61 -------------------
 .../lua/{lua_5.4.4.bb => lua_5.4.6.bb}        |  6 +-
 3 files changed, 2 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-devtools/lua/lua/CVE-2022-28805.patch
 delete mode 100644 meta/recipes-devtools/lua/lua/CVE-2022-33099.patch
 rename meta/recipes-devtools/lua/{lua_5.4.4.bb => lua_5.4.6.bb} (89%)

diff --git a/meta/recipes-devtools/lua/lua/CVE-2022-28805.patch b/meta/recipes-devtools/lua/lua/CVE-2022-28805.patch
deleted file mode 100644
index 3680c715a70..00000000000
--- a/meta/recipes-devtools/lua/lua/CVE-2022-28805.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 1f3c6f4534c6411313361697d98d1145a1f030fa Mon Sep 17 00:00:00 2001
-From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
-Date: Tue, 15 Feb 2022 12:28:46 -0300
-Subject: [PATCH] Bug: Lua can generate wrong code when _ENV is <const>
-
-CVE: CVE-2022-28805
-
-Upstream-Status: Backport [https://github.com/lua/lua/commit/1f3c6f4534c6411313361697d98d1145a1f030fa]
-
-Signed-off-by: Steve Sakoman <steve@sakoman.com>
----
- src/lparser.c         |  1 +
- 1 files changed, 1 insertions(+)
-
-diff --git a/src/lparser.c b/src/lparser.c
-index 3abe3d751..a5cd55257 100644
---- a/src/lparser.c
-+++ b/src/lparser.c
-@@ -468,6 +468,7 @@ static void singlevar (LexState *ls, expdesc *var) {
-     expdesc key;
-     singlevaraux(fs, ls->envn, var, 1);  /* get environment variable */
-     lua_assert(var->k != VVOID);  /* this one must exist */
-+    luaK_exp2anyregup(fs, var);  /* but could be a constant */
-     codestring(&key, varname);  /* key is variable name */
-     luaK_indexed(fs, var, &key);  /* env[varname] */
-   }
diff --git a/meta/recipes-devtools/lua/lua/CVE-2022-33099.patch b/meta/recipes-devtools/lua/lua/CVE-2022-33099.patch
deleted file mode 100644
index fe7b6065c2a..00000000000
--- a/meta/recipes-devtools/lua/lua/CVE-2022-33099.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 42d40581dd919fb134c07027ca1ce0844c670daf Mon Sep 17 00:00:00 2001
-From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
-Date: Fri, 20 May 2022 13:14:33 -0300
-Subject: [PATCH] Save stack space while handling errors
-
-Because error handling (luaG_errormsg) uses slots from EXTRA_STACK,
-and some errors can recur (e.g., string overflow while creating an
-error message in 'luaG_runerror', or a C-stack overflow before calling
-the message handler), the code should use stack slots with parsimony.
-
-This commit fixes the bug "Lua-stack overflow when C stack overflows
-while handling an error".
-
-CVE: CVE-2022-33099
-
-Upstream-Status: Backport [https://github.com/lua/lua/commit/42d40581dd919fb134c07027ca1ce0844c670daf]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ldebug.c | 5 ++++-
- lvm.c    | 6 ++++--
- 2 files changed, 8 insertions(+), 3 deletions(-)
-
---- a/src/ldebug.c
-+++ b/src/ldebug.c
-@@ -824,8 +824,11 @@ l_noret luaG_runerror (lua_State *L, con
-   va_start(argp, fmt);
-   msg = luaO_pushvfstring(L, fmt, argp);  /* format message */
-   va_end(argp);
--  if (isLua(ci))  /* if Lua function, add source:line information */
-+  if (isLua(ci)) {  /* if Lua function, add source:line information */
-     luaG_addinfo(L, msg, ci_func(ci)->p->source, getcurrentline(ci));
-+    setobjs2s(L, L->top - 2, L->top - 1);  /* remove 'msg' from the stack */
-+    L->top--;
-+  }
-   luaG_errormsg(L);
- }
- 
---- a/src/lvm.c
-+++ b/src/lvm.c
-@@ -656,8 +656,10 @@ void luaV_concat (lua_State *L, int tota
-       /* collect total length and number of strings */
-       for (n = 1; n < total && tostring(L, s2v(top - n - 1)); n++) {
-         size_t l = vslen(s2v(top - n - 1));
--        if (l_unlikely(l >= (MAX_SIZE/sizeof(char)) - tl))
-+        if (l_unlikely(l >= (MAX_SIZE/sizeof(char)) - tl)) {
-+          L->top = top - total;  /* pop strings to avoid wasting stack */
-           luaG_runerror(L, "string length overflow");
-+        }
-         tl += l;
-       }
-       if (tl <= LUAI_MAXSHORTLEN) {  /* is result a short string? */
-@@ -672,7 +674,7 @@ void luaV_concat (lua_State *L, int tota
-       setsvalue2s(L, top - n, ts);  /* create result */
-     }
-     total -= n-1;  /* got 'n' strings to create 1 new */
--    L->top -= n-1;  /* popped 'n' strings and pushed one */
-+    L->top = top - (n - 1);  /* popped 'n' strings and pushed one */
-   } while (total > 1);  /* repeat until only 1 result left */
- }
- 
diff --git a/meta/recipes-devtools/lua/lua_5.4.4.bb b/meta/recipes-devtools/lua/lua_5.4.6.bb
similarity index 89%
rename from meta/recipes-devtools/lua/lua_5.4.4.bb
rename to meta/recipes-devtools/lua/lua_5.4.6.bb
index 26ec35f997a..eabfc895754 100644
--- a/meta/recipes-devtools/lua/lua_5.4.4.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.6.bb
@@ -1,20 +1,18 @@
 SUMMARY = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=307;endline=330;md5=79c3f6b19ad05efe24c1681f025026bb"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=303;endline=324;md5=e05449eb28c092473f854670c6e8375a"
 HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
-           file://CVE-2022-28805.patch \
-           file://CVE-2022-33099.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
            "
 
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
 PV_testsuites = "5.4.4"
 
-SRC_URI[tarballsrc.sha256sum] = "164c7849653b80ae67bec4b7473b884bf5cc8d2dca05653475ec2ed27b9ebf61"
+SRC_URI[tarballsrc.sha256sum] = "7d5ea1b9cb6aa0b59ca3dde1c6adcb57ef83a1ba8e5432c0ecd06bf439b3ad88"
 SRC_URI[tarballtest.sha256sum] = "04d28355cd67a2299dfe5708b55a0ff221ccb1a3907a3113cc103ccc05ac6aad"
 
 inherit pkgconfig binconfig ptest
-- 
2.30.2


