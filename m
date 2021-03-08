Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.293.1615226527002396808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 10:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 895611042
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Mar 2021 10:01:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 345CE3F71B
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Mar 2021 10:01:56 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] gcc: add an option for --enable-poison-system-directories to be fatal
Date: Mon,  8 Mar 2021 18:01:50 +0000
Message-Id: <20210308180152.3515502-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308180152.3515502-1-ross.burton@arm.com>
References: <20210308180152.3515502-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Extend --enable-poison-system-directories so that it can be an error
instead of a warning by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0002-gcc-poison-system-directories.patch  | 56 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directo=
ries.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directo=
ries.patch
index 30a8486016..333d543dd9 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.pa=
tch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.pa=
tch
@@ -44,7 +44,7 @@ diff --git a/gcc/config.in b/gcc/config.in
 index 809e7b26823..5adeaeed36b 100644
 --- a/gcc/config.in
 +++ b/gcc/config.in
-@@ -224,6 +224,12 @@
+@@ -224,6 +224,16 @@
  #endif
 =20
 =20
@@ -52,6 +52,10 @@ index 809e7b26823..5adeaeed36b 100644
 +#ifndef USED_FOR_TARGET
 +#undef ENABLE_POISON_SYSTEM_DIRECTORIES
 +#endif
++/* Define to warn for use of native system header directories */
++#ifndef USED_FOR_TARGET
++#undef POISON_BY_DEFAULT
++#endif
 +
 +
  /* Define if you want all operations on RTL (the basic data structure o=
f the
@@ -78,7 +82,7 @@ index cd3d9516fce..8de766a942c 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -30235,6 +30238,19 @@ if test "${enable_version_specific_runtime_libs=
+set}" =3D set; then :
+@@ -30235,6 +30238,22 @@ if test "${enable_version_specific_runtime_libs=
+set}" =3D set; then :
  fi
 =20
 =20
@@ -89,9 +93,12 @@ index cd3d9516fce..8de766a942c 100755
 +  enable_poison_system_directories=3Dno
 +fi
 +
-+if test "x${enable_poison_system_directories}" =3D "xyes"; then
++if test "x${enable_poison_system_directories}" !=3D "xno"; then
 +
 +$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
++if test "$enable_poison_system_directories" =3D "error"; then
++$as_echo "#define POISON_BY_DEFAULT 1" >>confdefs.h
++fi
 +
 +fi
 +
@@ -198,3 +205,46 @@ index 8a2bda00f80..9098ab044ab 100644
  }
 =20
  /* Use given -I paths for #include "..." but not #include <...>, and
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index f42006e5476..de7e176ea53 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -6602,12 +6602,18 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+=20
+ AC_ARG_ENABLE([poison-system-directories],
+              AS_HELP_STRING([--enable-poison-system-directories],
+-                            [warn for use of native system header direc=
tories]),,
++                            [warn for use of native system header direc=
tories (no/yes/error)]),,
+              [enable_poison_system_directories=3Dno])
++AC_MSG_NOTICE([poisoned directories $enable_poison_system_directories])
+-if test "x${enable_poison_system_directories}" =3D "xyes"; then
++if test "x${enable_poison_system_directories}" !=3D "xno"; then
++  AC_MSG_NOTICE([poisoned directories enabled])
+   AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
+            [1],
+            [Define to warn for use of native system header directories]=
)
++  if test $enable_poison_system_directories =3D "error"; then
++   AC_MSG_NOTICE([poisoned directories are fatal])
++   AC_DEFINE([POISON_BY_DEFAULT], [1], [Define to make poison warnings =
errors])
++  fi
+ fi
+=20
+ # Substitute configuration variables
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index b2200c5185a..fa7b6fc8ddb 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1136,8 +1136,11 @@ static const char *cpp_unique_options =3D
+ static const char *cpp_options =3D
+ "%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic*} =
%{w}\
+  %{f*} %{g*:%{%:debug-level-gt(0):%{g*}\
+- %{!fno-working-directory:-fworking-directory}}} %{O*}\
+- %{undef} %{save-temps*:-fpch-preprocess}";
++ %{!fno-working-directory:-fworking-directory}}} %{O*}"
++#ifdef POISON_BY_DEFAULT
++ " -Werror=3Dpoison-system-directories"
++#endif
++ " %{undef} %{save-temps*:-fpch-preprocess}";
+=20
+ /* This contains cpp options which are not passed when the preprocessor
+    output will be used by another program.  */
--=20
2.25.1

