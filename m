Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id F106C7F225
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 09:55:01 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q17so14674522wrx.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Oct 2019 02:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qwv8cCDRg70tIyuTZqTBfyE3J5iFNKh0WhKgi2COD9k=;
	b=Q3iSaJHdPr+3X0DppJKESXlYBeVHkOotqAGQEouQDLO98d6ts1DMAXj8CX3EH/uqON
	7HHV5PImvpFb7p1Vgww3s/ALrQT01V0w6VQeyVSBQzN+di0K0bHaKZtglaz+Et4SXzSo
	dMSkaBFSk7Tl10PhykvPjCVEY51J19W2Nz6zsyPHY2YT+n2AaEVP99CTVQa07DM61dDT
	BzgbIvB5eD8NlqCP0UsXjnAmpDx1N1Oj3QP6WUEj0yojddY+vzRuQ/lCd2QedSpJmZSV
	7zwhLGMErSLm5gsj/uNSOpMUN0V+lFs9CQ4+Dy39cO71MeW10N8wxFNKFEjTitiSCMoM
	1mGg==
X-Gm-Message-State: APjAAAUZROzup7q/INrbMjVv6B+gN42iCJr+3IK0cN8NLh+rqWkz4/cl
	thBnyq2Kbd5isiRyRBCY4XBGEGVa
X-Google-Smtp-Source: APXvYqw2irlA4sObJ7624Sg/JwzO+fxIWyGl/pN9Vnwc5YPz7VXtET8iZVSdVSDaTjgyJwTzpriw/Q==
X-Received: by 2002:a05:6000:1002:: with SMTP id
	a2mr16806655wrx.272.1569923702086; 
	Tue, 01 Oct 2019 02:55:02 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g185sm3070875wme.10.2019.10.01.02.55.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 01 Oct 2019 02:55:01 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Oct 2019 10:54:50 +0100
Message-Id: <20191001095452.37335-3-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191001095452.37335-1-git@andred.net>
References: <20191001095452.37335-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 2/4] ruby: configure mis-detects isnan/isinf on musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Oct 2019 09:55:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The configure script does not detect isnan/isinf as macros
as is the case in musl:
    checking for isinf... no
    checking for isnan... no

Backport an upstream patch from 2.7.0-preview1 to address this:
    checking whether isinf is declared... yes
    checking whether isnan is declared... yes

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v3:
* use upstream patch instead of setting CACHED_CONFIGUREVARS
* rebase on top of CVE duplication patches removal
---
 ...ck-finite-isinf-isnan-as-macros-firs.patch | 101 ++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.5.5.bb      |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch

diff --git a/meta/recipes-devtools/ruby/ruby/0001-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch b/meta/recipes-devtools/ruby/ruby/0001-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch
new file mode 100644
index 0000000000..4cc1fa027f
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch
@@ -0,0 +1,101 @@
+From 3a8189530312e81d6c005c396565f985a47f3383 Mon Sep 17 00:00:00 2001
+From: nobu <nobu@b2dd03c8-39d4-4d8f-98ff-823fe69b080e>
+Date: Fri, 8 Feb 2019 07:22:55 +0000
+Subject: [PATCH] configure.ac: check finite,isinf,isnan as macros first
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+[ruby-core:91487] [Bug #15595]
+
+git-svn-id: svn+ssh://ci.ruby-lang.org/ruby/trunk@67036 b2dd03c8-39d4-4d8f-98ff-823fe69b080e
+
+---
+Upstream-Status: Backport [https://github.com/ruby/ruby/commit/74f94b3e6ebf15b76f3b357e754095412b006e94]
+(modified so as to apply cleanly here)
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+---
+ aclocal.m4                    |  1 +
+ configure.ac                  | 13 ++++---------
+ tool/m4/ruby_replace_funcs.m4 | 13 +++++++++++++
+ 3 files changed, 18 insertions(+), 9 deletions(-)
+ create mode 100644 tool/m4/ruby_replace_funcs.m4
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 18ba297b05..2a907b3467 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -13,3 +13,4 @@
+ 
+ m4_ifndef([AC_CONFIG_MACRO_DIRS], [m4_defun([_AM_CONFIG_MACRO_DIRS], [])m4_defun([AC_CONFIG_MACRO_DIRS], [_AM_CONFIG_MACRO_DIRS($@)])])
+ m4_include([acinclude.m4])
++m4_include([tool/m4/ruby_replace_funcs.m4])
+diff --git a/configure.ac b/configure.ac
+index 8a7cee55b8..b97c5b3cc9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1189,9 +1189,6 @@ main()
+ 		ac_cv_func_fsync=yes
+ 		ac_cv_func_seekdir=yes
+ 		ac_cv_func_telldir=yes
+-		ac_cv_func_isinf=yes
+-		ac_cv_func_isnan=yes
+-		ac_cv_func_finite=yes
+ 		ac_cv_func_lchown=yes
+ 		ac_cv_func_link=yes
+ 		ac_cv_func_readlink=yes
+@@ -1239,9 +1236,6 @@ main()
+ [netbsd*], [	LIBS="-lm $LIBS"
+ 		],
+ [dragonfly*], [	LIBS="-lm $LIBS"
+-		# isinf() and isnan() are macros on DragonFly.
+-		ac_cv_func_isinf=yes
+-		ac_cv_func_isnan=yes
+ 		],
+ [aix*],[	LIBS="-lm $LIBS"
+ 		ac_cv_func_round=no
+@@ -2213,11 +2207,8 @@ AC_REPLACE_FUNCS(dup2)
+ AC_REPLACE_FUNCS(erf)
+ AC_REPLACE_FUNCS(explicit_bzero)
+ AC_REPLACE_FUNCS(ffs)
+-AC_REPLACE_FUNCS(finite)
+ AC_REPLACE_FUNCS(flock)
+ AC_REPLACE_FUNCS(hypot)
+-AC_REPLACE_FUNCS(isinf)
+-AC_REPLACE_FUNCS(isnan)
+ AC_REPLACE_FUNCS(lgamma_r)
+ AC_REPLACE_FUNCS(memmove)
+ AC_REPLACE_FUNCS(nextafter)
+@@ -2229,6 +2220,10 @@ AC_REPLACE_FUNCS(strlcpy)
+ AC_REPLACE_FUNCS(strstr)
+ AC_REPLACE_FUNCS(tgamma)
+ 
++RUBY_REPLACE_FUNC([finite], [@%:@include <math.h>])
++RUBY_REPLACE_FUNC([isinf], [@%:@include <math.h>])
++RUBY_REPLACE_FUNC([isnan], [@%:@include <math.h>])
++
+ # for missing/setproctitle.c
+ AS_CASE(["$target_os"],
+ [aix* | k*bsd*-gnu | kopensolaris*-gnu | linux* | darwin*], [AC_DEFINE(SPT_TYPE,SPT_REUSEARGV)],
+diff --git a/tool/m4/ruby_replace_funcs.m4 b/tool/m4/ruby_replace_funcs.m4
+new file mode 100644
+index 0000000000..d0612e29a0
+--- /dev/null
++++ b/tool/m4/ruby_replace_funcs.m4
+@@ -0,0 +1,13 @@
++# -*- Autoconf -*-
++dnl RUBY_REPLACE_FUNC [func] [included]
++AC_DEFUN([RUBY_REPLACE_FUNC], [dnl
++    AC_CHECK_DECL([$1],dnl
++        [AC_DEFINE(AS_TR_CPP(HAVE_[$1]))],dnl
++        [AC_REPLACE_FUNCS($1)],dnl
++        [$2])dnl
++])
++
++dnl RUBY_REPLACE_FUNCS [funcs] [included]
++AC_DEFUN([RUBY_REPLACE_FUNCS] [dnl
++    m4_map_args_w([$1], [RUBY_REPLACE_FUNC(], [), [$2]])dnl
++])
+-- 
+2.23.0.rc1
+
diff --git a/meta/recipes-devtools/ruby/ruby_2.5.5.bb b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
index 4082b02f14..341329a6a1 100644
--- a/meta/recipes-devtools/ruby/ruby_2.5.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
@@ -1,6 +1,7 @@
 require ruby.inc
 
 SRC_URI += " \
+           file://0001-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch \
            file://run-ptest \
            "
 
-- 
2.23.0.rc1


