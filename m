Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C239AC0218B
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 18:23:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22841.1737483795959282841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 10:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBE0812FC
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 10:23:43 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E73C3F5A1
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 10:23:14 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] gcc: make include poisoning fatal again in gcc/g++
Date: Tue, 21 Jan 2025 18:23:09 +0000
Message-ID: <20250121182309.904188-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121182309.904188-1-ross.burton@arm.com>
References: <20250121182309.904188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 18:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210107

We have a patch to allow us to 'poison' system include directories,
which are warnings by default but we make them fatal in cross builds.

However, in the 13.1 upgrade[1] the patch to make the warnings fatal was
dropped in the compiler invocation, so it only took effect for pure
preprocessor calls. This was not noticed at the time as the test case
was flawed, but this has now been fixed.

Add back the fatal poisoning, and restructure the patch slightly so it
is less invasive.

[1] oe-core bea46612fd9106cc5b46eb1d81623b6492563c13

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0002-gcc-poison-system-directories.patch  | 35 +++++++++++++------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directo=
ries.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directo=
ries.patch
index 367c9e3821b..d8b3d4a9984 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.pa=
tch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.pa=
tch
@@ -160,10 +160,21 @@ index f82f7d2817b..1da91813b0e 100644
  @opindex Wno-float-equal
  @item -Wfloat-equal
 diff --git a/gcc/gcc.cc b/gcc/gcc.cc
-index 728332b8153..343e4915097 100644
+index 728332b8153..a63f128cb95 100644
 --- a/gcc/gcc.cc
 +++ b/gcc/gcc.cc
-@@ -1159,6 +1159,8 @@ proper position among the other output files.  */
+@@ -902,6 +902,10 @@ proper position among the other output files.  */
+ #define ASM_MAP ""
+ #endif
+=20
++#ifdef POISON_BY_DEFAULT
++#define POISON_IS_ERROR " -Werror=3Dpoison-system-directories"
++#endif
++
+ /* Assembler options for compressed debug sections.  */
+ #if HAVE_LD_COMPRESS_DEBUG =3D=3D 0
+ /* Reject if the linker cannot write compressed debug sections.  */
+@@ -1159,6 +1163,8 @@ proper position among the other output files.  */
     "%{fuse-ld=3D*:-fuse-ld=3D%*} " LINK_COMPRESS_DEBUG_SPEC \
     "%X %{o*} %{e*} %{N} %{n} %{r}\
      %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}} \
@@ -172,20 +183,24 @@ index 728332b8153..343e4915097 100644
      %{static|no-pie|static-pie:} %@{L*} %(link_libgcc) " \
      VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
      %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=3D*:%*} 1):\
-@@ -1260,8 +1262,11 @@ static const char *cpp_unique_options =3D
- static const char *cpp_options =3D
+@@ -1261,7 +1267,7 @@ static const char *cpp_options =3D
  "%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic*} =
%{w}\
   %{f*} %{g*:%{%:debug-level-gt(0):%{g*}\
-- %{!fno-working-directory:-fworking-directory}}} %{O*}\
+  %{!fno-working-directory:-fworking-directory}}} %{O*}\
 - %{undef} %{save-temps*:-fpch-preprocess}";
-+ %{!fno-working-directory:-fworking-directory}}} %{O*}"
-+#ifdef POISON_BY_DEFAULT
-+ " -Werror=3Dpoison-system-directories"
-+#endif
-+ " %{undef} %{save-temps*:-fpch-preprocess}";
++ %{undef} %{save-temps*:-fpch-preprocess}" POISON_IS_ERROR;
 =20
  /* Pass -d* flags, possibly modifying -dumpdir, -dumpbase et al.
 =20
+@@ -1290,7 +1296,7 @@ static const char *cc1_options =3D
+  %{coverage:-fprofile-arcs -ftest-coverage}\
+  %{fprofile-arcs|fcondition-coverage|fprofile-generate*|coverage:\
+    %{!fprofile-update=3Dsingle:\
+-     %{pthread:-fprofile-update=3Dprefer-atomic}}}";
++     %{pthread:-fprofile-update=3Dprefer-atomic}}}" POISON_IS_ERROR;
+=20
+ static const char *asm_options =3D
+ "%{-target-help:%:print-asm-header()} "
 diff --git a/gcc/incpath.cc b/gcc/incpath.cc
 index 64cdd2f4a..89f42900d 100644
 --- a/gcc/incpath.cc
--=20
2.43.0


