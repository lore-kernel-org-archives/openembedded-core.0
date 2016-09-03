Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3E9EA76651
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Sep 2016 00:12:36 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id w207so4771671wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Sep 2016 17:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jGFe0OW0PGn1djE1e1hupSEIGXFmz99k5PPBX4PZBH4=;
	b=aAhToj3yK2UbtLsiWswil1T49+EQEivHw3lcwR3F515SODy2k77JSV4MsV7upBzNoo
	PHY6YlCJs2lsGODWJihGE7qgGr/PsWVkuNSmQlDJLCX6Rov2KZA+pXwBE4WGcKSg+Sqe
	cyfo8cH7gaZyZOky+xHSZ28+E9GBkWZbSRbnk1QIs94NOy7OOP2Zvnkh9hz7CEuqJzjQ
	gRBfuPwivm1CvgNT480b4DG1jYMYDvApiJ6hm7/LMMHp0UmYrgiYR2PoQ8EnBjv/eY0p
	F1RIHEZp35zE5Ueu9N9n8CIpEKsiHpccTqCMtcNeOtmvXYzkqjpeAC/7mxR0BigfKT1X
	iHQA==
X-Gm-Message-State: AE9vXwO1JP+XibTx5I91AYUSvve/c55V/TwjJOQ5k0ZuuRSKWd+lp/C29LTifF6OvK9kww==
X-Received: by 10.194.77.97 with SMTP id r1mr21576542wjw.83.1472861556121;
	Fri, 02 Sep 2016 17:12:36 -0700 (PDT)
Received: from tfsielt31850.tycofs.com (31-187-15-27.dynamic.upc.ie.
	[31.187.15.27]) by smtp.gmail.com with ESMTPSA id
	a3sm12765902wjw.15.2016.09.02.17.12.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Sep 2016 17:12:35 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Sep 2016 01:12:21 +0100
Message-Id: <20160903001222.2864-3-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160903001222.2864-1-git@andred.net>
References: <20160829110341.13100-1-git@andred.net>
	<20160903001222.2864-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 2/3] boost: fix mips soft float compilation
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
X-List-Received-Date: Sat, 03 Sep 2016 00:12:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upstream-Status: Submitted https://svn.boost.org/trac/boost/ticket/11756

Signed-off-by: André Draszik <git@andred.net>
---
 ...execution_monitor.hpp-fix-mips-soft-float.patch | 145 +++++++++++++++++++++
 meta/recipes-support/boost/boost_1.61.0.bb         |   1 +
 2 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch

diff --git a/meta/recipes-support/boost/boost/0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch b/meta/recipes-support/boost/boost/0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch
new file mode 100644
index 0000000..569c987
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch
@@ -0,0 +1,145 @@
+From 5c349a1c391c9ce171a1c80f5164fae764f27dba Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
+Date: Wed, 24 Aug 2016 20:58:59 +0100
+Subject: [PATCH 2/4] boost/test/execution_monitor.hpp: fix mips soft float
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+gcc.compile.c++ <builddir>/boost/bin.v2/libs/test/build/gcc-4.3.1/release/threading-multi/execution_monitor.o
+
+    "mipsel-poky-linux-musl-g++" "-mel" "-mabi=32" "-msoft-float" "-march=mips32r2" "-mips16" "-minterlink-compressed" "-mtune=24kec" "-mdsp" "-Wl,-O1" "-Wl,--as-needed" "-fstack-protector-strong" "-Wl,-z,relro,-z,now" "--sysroot=<sysroot>"  -ftemplate-depth-128 -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=<srcdir>=/usr/src/debug/boost/1.61.0-r0 -fdebug-prefix-map=<sysroot_host>= -fdebug-prefix-map=<sysroot>= -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -fvisibility-inlines-hidden -O3 -finline-functions -Wno-inline -Wall -pedantic -pthread -fPIC -Wno-variadic-macros -DBOOST_ALL_NO_LIB=1 -DBOOST_CHRONO_DYN_LINK=1 -DBOOST_SYSTEM_DYN_LINK=1 -DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_TEST_DYN_LINK=1 -DBOOST_TIMER_DYN_LINK=1 -DNDEBUG  -I"." -c -o "<builddir>/boost/bin.v2/libs/test/build/gcc-4.3.1/release/threading-multi/execution_monitor.o" "libs/test/src/execution_monitor.cpp"
+
+In file included from ./boost/test/impl/execution_monitor.ipp:31:0,
+                 from libs/test/src/execution_monitor.cpp:16:
+./boost/test/execution_monitor.hpp:491:27: error: 'FE_DIVBYZERO' was not declared in this scope
+     BOOST_FPE_DIVBYZERO = FE_DIVBYZERO,
+                           ^~~~~~~~~~~~
+./boost/test/execution_monitor.hpp:492:27: error: 'FE_INEXACT' was not declared in this scope
+     BOOST_FPE_INEXACT   = FE_INEXACT,
+                           ^~~~~~~~~~
+./boost/test/execution_monitor.hpp:493:27: error: 'FE_INVALID' was not declared in this scope
+     BOOST_FPE_INVALID   = FE_INVALID,
+                           ^~~~~~~~~~
+./boost/test/execution_monitor.hpp:494:27: error: 'FE_OVERFLOW' was not declared in this scope
+     BOOST_FPE_OVERFLOW  = FE_OVERFLOW,
+                           ^~~~~~~~~~~
+./boost/test/execution_monitor.hpp:495:27: error: 'FE_UNDERFLOW' was not declared in this scope
+     BOOST_FPE_UNDERFLOW = FE_UNDERFLOW,
+                           ^~~~~~~~~~~~
+
+The reason is that some (notably FPU-less) architectures,
+including mips*-nf, don't define/implement some of the
+floating point constants, even though fenv.h is
+available.
+
+The key point is:
+  A fully standards conforming fenv.h does not have to
+  define any FE_* macros, and if it does define them,
+  then it defines macros only for the FP exceptions it
+  actually supports.
+
+So correct usage requires a triple check:
+1) Check BOOST_NO_FENV_H to see if the header is supported.
+2) Include the header and then check FE_ALL_EXCEPT to see
+   if any FP exceptions are supported.
+3) Before using the individual FE_* macros, you need to
+   check for their existence too as not all may be
+   supported.
+
+https://svn.boost.org/trac/boost/ticket/11756
+
+Other projects have similar issues, e.g. pixman, and
+apply similar work-arounds:
+  https://lists.freedesktop.org/archives/pixman/2014-February/003172.html
+
+Architectures are notably also allowed to define FE_ALL_EXCEPT to 0!
+Keeping this in mind, and knowing that the compiler will eliminate
+code that can't be executed, we can change BOOST_FPE_ALL to be 0 for
+the case of compiling using Clang and/or fenv.h being unavailable
+as well, which allows simplification of the #ifdef's in
+execution_monitor.ipp a bit.
+
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+---
+Upstream-Status: Submitted https://svn.boost.org/trac/boost/ticket/11756
+ boost/test/execution_monitor.hpp      | 26 +++++++++++++++++++++++++-
+ boost/test/impl/execution_monitor.ipp | 10 ++++++++--
+ 2 files changed, 33 insertions(+), 3 deletions(-)
+
+diff --git a/boost/test/execution_monitor.hpp b/boost/test/execution_monitor.hpp
+index 0eee497..44fe59d 100644
+--- a/boost/test/execution_monitor.hpp
++++ b/boost/test/execution_monitor.hpp
+@@ -486,15 +486,39 @@ enum masks {
+     BOOST_FPE_ALL       = MCW_EM,
+ #elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG) \
+     || defined(__ARM_PCS)
+-    BOOST_FPE_ALL       = 1,
++    BOOST_FPE_ALL       = 0,
+ #else
++#if defined(FE_DIVBYZERO)
+     BOOST_FPE_DIVBYZERO = FE_DIVBYZERO,
++#else
++    BOOST_FPE_DIVBYZERO = 0,
++#endif
++#if defined(FE_INEXACT)
+     BOOST_FPE_INEXACT   = FE_INEXACT,
++#else
++    BOOST_FPE_INEXACT   = 0,
++#endif
++#if defined(FE_INVALID)
+     BOOST_FPE_INVALID   = FE_INVALID,
++#else
++    BOOST_FPE_INVALID   = 0,
++#endif
++#if defined(FE_OVERFLOW)
+     BOOST_FPE_OVERFLOW  = FE_OVERFLOW,
++#else
++    BOOST_FPE_OVERFLOW  = 0,
++#endif
++#if defined(FE_UNDERFLOW)
+     BOOST_FPE_UNDERFLOW = FE_UNDERFLOW,
++#else
++    BOOST_FPE_UNDERFLOW = 0,
++#endif
+ 
++#if defined(FE_ALL_EXCEPT)
+     BOOST_FPE_ALL       = FE_ALL_EXCEPT,
++#else
++    BOOST_FPE_ALL       = 0,
++#endif
+ #endif
+     BOOST_FPE_INV       = BOOST_FPE_ALL+1
+ };
+diff --git a/boost/test/impl/execution_monitor.ipp b/boost/test/impl/execution_monitor.ipp
+index f7fc8ea..d1088b9 100644
+--- a/boost/test/impl/execution_monitor.ipp
++++ b/boost/test/impl/execution_monitor.ipp
+@@ -1381,7 +1381,10 @@ enable( unsigned mask )
+ #endif
+ 
+     return ~old_cw & BOOST_FPE_ALL;
+-#elif defined(__GLIBC__) && defined(__USE_GNU) && !defined(BOOST_CLANG) && !defined(BOOST_NO_FENV_H)
++#elif defined(__GLIBC__) && defined(__USE_GNU)
++    if (BOOST_FPE_ALL == 0)
++        /* Not Implemented */
++        return 0;
+     feclearexcept(BOOST_FPE_ALL);
+     int res = feenableexcept( mask );
+     return res == -1 ? (unsigned)BOOST_FPE_INV : (unsigned)res;
+@@ -1418,7 +1421,10 @@ disable( unsigned mask )
+ #endif
+ 
+     return ~old_cw & BOOST_FPE_ALL;
+-#elif defined(__GLIBC__) && defined(__USE_GNU) && !defined(BOOST_CLANG) && !defined(BOOST_NO_FENV_H)
++#elif defined(__GLIBC__) && defined(__USE_GNU)
++    if (BOOST_FPE_ALL == 0)
++        /* Not Implemented */
++        return BOOST_FPE_INV;
+     feclearexcept(BOOST_FPE_ALL);
+     int res = fedisableexcept( mask );
+     return res == -1 ? (unsigned)BOOST_FPE_INV : (unsigned)res;
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/boost/boost_1.61.0.bb b/meta/recipes-support/boost/boost_1.61.0.bb
index 41ff203..de482ee 100644
--- a/meta/recipes-support/boost/boost_1.61.0.bb
+++ b/meta/recipes-support/boost/boost_1.61.0.bb
@@ -6,4 +6,5 @@ SRC_URI += "\
     file://consider-hardfp.patch \
     file://boost-CVE-2012-2677.patch \
     file://0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch \
+    file://0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch \
 "
-- 
2.9.3


