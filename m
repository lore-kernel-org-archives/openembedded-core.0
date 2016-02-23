Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7C7D6772C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 02:50:04 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id s68so63399714qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 18:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hSoxQFFUpBCrcNZzHI1LL5PlVyz4V+3XIqkYPqIs+oc=;
	b=vBVlh067jqBioRxtRDBfTaCsMSv0JAE/u5+Qv0lwOyohIBrVp/gnJ1m0WLEa3e42sA
	Q6l5d3Goo6Wxlr0+yhtnugf4N7HyLlTFu6JoUjmha8vQlOzsYuWTzccvZqfL2Je++TZh
	z3se6FlktVJbOqootCwnU5FGDcvJ75mG4a054Jv057D6+HzzPEJX/kFmN9p690ZzPY5h
	0qAyTJqXkirp8y9cZGOgj6W2OAyhAhR9d7QoKrmfWsgblWqOvf3cwOW4CbCeRuu5ZF7L
	bp/pP0kiCQYE+8eYElY1LvwqUgaD5TRhRnrqBr8Dd36yNmvwp0E2LK4kaPuASV9Rw6l9
	RWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hSoxQFFUpBCrcNZzHI1LL5PlVyz4V+3XIqkYPqIs+oc=;
	b=A3R5s+P4E7cys8X9diZlqIY5SlnhdHSoCawZCWyRkvbwBwXr/xO2FPXrMcqVxFqdmi
	2ORfMOhz+KBqyjXEgwubaH8EaRvRccI7j7SoK3wiqHftGoJcnqm4+StLr7I3nanNRrbQ
	x/z98DsfoNnXOd45nl2Rc1oeP/ZV04AX2d7+HMKSACoTQB/pYMINvzLuZ8FagHyNnFhG
	FuDAUI/0MWIuxLgf4+uobwJ8IKuAqAwGr+y2biWBN8Bs7bbaR0MwYHZMTssyNVJNYu8B
	VEUw3v5DdBzdBWwED4stol6EboRFU4FkWJIsWZyFnhPODiXZtL8IB/qP0ModemDHLbsQ
	kqcg==
X-Gm-Message-State: AG10YOQ3IRJJTL5OmGcgO9AnI1U29jk+ZNh/pURsD1SVFxVHYZvZiRl3gbvAPLlNvJuDeg==
X-Received: by 10.55.75.131 with SMTP id y125mr38295489qka.61.1456195804476;
	Mon, 22 Feb 2016 18:50:04 -0800 (PST)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	b34sm7733410qgb.31.2016.02.22.18.50.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 18:50:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Feb 2016 02:49:57 +0000
Message-Id: <1456195797-14982-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH V2] clutter-1.0: Fix confgure test errors found by clang
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
X-List-Received-Date: Tue, 23 Feb 2016 02:50:04 -0000

We were using nested functions inadvertantly and they were compiling fine
with gcc but clang doesnt support nested functions hence configure tests for
cogl started to fail, but it was a test error not compiler error
which was undetected thus far

Backport a fix from upstream to help clang compile clutter

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changed-since-v1:

- Selectively backport needed patch instead of package upgrade

 .../0001-build-Use-AC_COMPILE_IFELSE.patch         | 105 +++++++++++++++++++++
 .../recipes-graphics/clutter/clutter-1.0_1.24.2.bb |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.0/0001-build-Use-AC_COMPILE_IFELSE.patch

diff --git a/meta/recipes-graphics/clutter/clutter-1.0/0001-build-Use-AC_COMPILE_IFELSE.patch b/meta/recipes-graphics/clutter/clutter-1.0/0001-build-Use-AC_COMPILE_IFELSE.patch
new file mode 100644
index 0000000..c4edff3
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-1.0/0001-build-Use-AC_COMPILE_IFELSE.patch
@@ -0,0 +1,105 @@
+From 483a4bb00e7dd2f14d86e167c8013c8638723c33 Mon Sep 17 00:00:00 2001
+From: Emmanuele Bassi <ebassi@gnome.org>
+Date: Thu, 18 Feb 2016 17:19:09 +0000
+Subject: [PATCH] build: Use AC_COMPILE_IFELSE
+
+Instead of AC_TRY_COMPILE, which has been deprecated by newer autoconf.
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ configure.ac | 66 ++++++++++++++++++++++++++++++------------------------------
+ 1 file changed, 33 insertions(+), 33 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4d72e0c..8ca3f94 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -348,24 +348,25 @@ AS_IF([test "x$enable_wayland" != xno],
+         # We need to manually check for Wayland support in Cogl because
+         # the windowing systems are not exposed in the pkg-config file
+         saved_CFLAGS="${CFLAGS}"
+-        CFLAGS="`$PKG_CONFIG --cflags $CLUTTER_BASE_PC_FILES`"
++        CFLAGS="`$PKG_CONFIG --cflags cogl-1.0`"
+ 
+         AC_MSG_CHECKING([for Wayland Cogl backend])
+-        AC_TRY_COMPILE([#include <cogl/cogl.h>],
+-                       [
+-                         #ifndef COGL_HAS_EGL_PLATFORM_WAYLAND_SUPPORT
+-                         #error "No Wayland support in Cogl"
+-                         #endif
+-                         int main (void) { return 0; }
+-                       ],
+-                       [
+-                         AC_MSG_RESULT(yes)
+-                         have_cogl_wayland=yes
+-                       ],
+-                       [
+-                         AC_MSG_RESULT(no)
+-                         have_cogl_wayland=no
+-                       ])
++
++        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
++#include <cogl/cogl.h>
++]],
++[[
++#ifndef COGL_HAS_EGL_PLATFORM_WAYLAND_SUPPORT
++#error Cogl compiled without Wayland support
++#endif
++]])], [
++          AC_MSG_RESULT(yes)
++          have_cogl_wayland=yes
++        ], [
++          AC_MSG_RESULT(no)
++          have_cogl_wayland=no
++        ])
++
+         CFLAGS="${saved_CFLAGS}"
+         AS_IF([test "x$have_cogl_wayland" = xyes],
+               [
+@@ -499,26 +500,25 @@ AS_IF([test "x$enable_mir" = "xyes"],
+         # We need to manually check for Mir support in Cogl because
+         # the windowing systems are not exposed in the pkg-config file
+         saved_CFLAGS="${CFLAGS}"
+-        CFLAGS="`$PKG_CONFIG --cflags $CLUTTER_BASE_PC_FILES`"
++        CFLAGS="`$PKG_CONFIG --cflags cogl-1.0`"
+ 
+         AC_MSG_CHECKING([for Mir Cogl backend])
+-        AC_TRY_COMPILE([#include <cogl/cogl.h>],
+-                       [
+-                        #ifndef COGL_HAS_EGL_PLATFORM_MIR_SUPPORT
+-                        #error "No Mir support in Cogl"
+-                        #endif
+-                        int main (void) { return 0; }
+-                       ],
+-                       [
+-                         AC_MSG_RESULT(yes)
+-                         have_cogl_mir=yes
+-                       ],
+-                       [
+-                         AC_MSG_RESULT(no)
+-                         have_cogl_mir=no
+-                       ])
+ 
+-        CFLAGS="${saved_CFLAGS}"
++        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
++#include <cogl/cogl.h>
++]],
++[[
++#ifndef COGL_HAS_EGL_PLATFORM_MIR_SUPPORT
++#error Cogl compiled without Mir support
++#endif
++]])], [
++          AC_MSG_RESULT(yes)
++          have_cogl_mir=yes
++        ], [
++          AC_MSG_RESULT(no)
++          have_cogl_mir=no
++        ])
++
+         AS_IF([test "x$have_cogl_mir" = xno], [AC_MSG_ERROR("*** Cogl is missing Mir support.")])
+ 
+         PKG_CHECK_EXISTS([mirclient],
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.24.2.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.24.2.bb
index 093bf6e..c53b3e7 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0_1.24.2.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.0_1.24.2.bb
@@ -6,4 +6,5 @@ SRC_URI[archive.md5sum] = "3b98e1b33719982a5736ae42cbf7183e"
 SRC_URI[archive.sha256sum] = "9631c98cb4bcbfec15e1bbe9eaa6eef0f127201552fce40d7d28f2133803cd63"
 SRC_URI += "file://install-examples.patch \
             file://run-installed-tests-with-tap-output.patch \
+            file://0001-build-Use-AC_COMPILE_IFELSE.patch \
             file://run-ptest"
-- 
1.9.1


