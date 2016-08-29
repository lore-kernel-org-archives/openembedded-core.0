Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 484486FEFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 11:03:55 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i5so8997145wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 04:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NDt9s0oYe1qm/c9IC7eIJs7h2tIxGaAykOUnewGcdts=;
	b=ToMa8dNI/b2Hk85m5hw5ewygE+q7xNQvgrxiL3vQTe2TldAQPCxcY6jO92IrpxiU6/
	OUWXcNOI3fp+B6N0HQ6EQy2jCX2y98KkSPh72J358dMBzn2dmON4UUdqjUqJ0b0+/nGx
	QQZHlkSQhFScLRtIGv7xgVOQi3q9JwT2RrmS17rkUZOaC8004LiY8qEhsVapaSTit8eJ
	qv+5JHRhgbOlGJ9Gp/Me1LS4DKP6ue+tjzmZgw8BJxDlSlxOpcg/lnDM4x2u8ifuWoRJ
	4ToeFj9bIliKj046ulssRsiN32yvubtTkFYhTEr+zMdN50dJ1i/HhUw/f6fPjEdVm+V/
	GZJA==
X-Gm-Message-State: AE9vXwO5UOURChZoflEQCFPmvwjPTFDmh4yzhHEwL1rDFpN7K8QQ3RqacK+qZ3oywPwhBQ==
X-Received: by 10.28.69.203 with SMTP id l72mr10245145wmi.51.1472468635478;
	Mon, 29 Aug 2016 04:03:55 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id m5sm13944169wmd.1.2016.08.29.04.03.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Aug 2016 04:03:53 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 12:03:40 +0100
Message-Id: <20160829110341.13100-3-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160829110341.13100-1-git@andred.net>
References: <20160829110341.13100-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/3] boost: fix compilation using soft float toolchains
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
X-List-Received-Date: Mon, 29 Aug 2016 11:03:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In particular mips*-nf

Signed-off-by: André Draszik <git@andred.net>
---
 .../boost/0002-config-gcc-BOOST_NO_FENV_H.patch    | 75 ++++++++++++++++++++++
 meta/recipes-support/boost/boost_1.61.0.bb         |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0002-config-gcc-BOOST_NO_FENV_H.patch

diff --git a/meta/recipes-support/boost/boost/0002-config-gcc-BOOST_NO_FENV_H.patch b/meta/recipes-support/boost/boost/0002-config-gcc-BOOST_NO_FENV_H.patch
new file mode 100644
index 0000000..55a0c07
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0002-config-gcc-BOOST_NO_FENV_H.patch
@@ -0,0 +1,75 @@
+From c97b70d96b63ec116a486e3b599dd505d13f5478 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
+Date: Wed, 24 Aug 2016 20:58:59 +0100
+Subject: [PATCH 2/3] config: gcc: #define BOOST_NO_FENV_H on FPU-less arches
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
+At least on MIPS, while FE_ALL_EXCEPT is #define'd, its
+value is 0.
+
+A similar problem exists on FPU-less ARM machines.
+
+  https://svn.boost.org/trac/boost/ticket/11756
+
+Other projects have similar issues, e.g. pixman, and
+apply similar work-arounds:
+  https://lists.freedesktop.org/archives/pixman/2014-February/003172.html
+
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+---
+Upstream-Status: Submitted https://svn.boost.org/trac/boost/ticket/11756
+ boost/config/compiler/gcc.hpp | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/boost/config/compiler/gcc.hpp b/boost/config/compiler/gcc.hpp
+index fbd3dd9..7c4fd06 100644
+--- a/boost/config/compiler/gcc.hpp
++++ b/boost/config/compiler/gcc.hpp
+@@ -262,6 +262,18 @@
+ #  define BOOST_NO_CXX14_BINARY_LITERALS
+ #endif
+ 
++// C++11 floating-point environment
++#if !defined(BOOST_NO_FENV_H)
++   // Some (notably FPU-less) architectures,
++   // including mips*-nf, don't define/implement some of
++   // the floating point constants, even though fenv.h
++   // is available.
++#  include <bits/fenv.h>
++#  if !defined(FE_ALL_EXCEPT) || (FE_ALL_EXCEPT == 0)
++#    define BOOST_NO_FENV_H
++#  endif
++#endif
++
+ // C++14 features in 4.9.0 and later
+ //
+ #if (BOOST_GCC_VERSION < 40900) || (__cplusplus < 201300)
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/boost/boost_1.61.0.bb b/meta/recipes-support/boost/boost_1.61.0.bb
index 41ff203..09137db 100644
--- a/meta/recipes-support/boost/boost_1.61.0.bb
+++ b/meta/recipes-support/boost/boost_1.61.0.bb
@@ -6,4 +6,5 @@ SRC_URI += "\
     file://consider-hardfp.patch \
     file://boost-CVE-2012-2677.patch \
     file://0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch \
+    file://0002-gcc-config-BOOST_NO_FENV_H.patch \
 "
-- 
2.9.3


