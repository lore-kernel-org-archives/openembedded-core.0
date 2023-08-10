Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512F4C04FE0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:25:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21892.1691684698542267715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD5B0113E;
	Thu, 10 Aug 2023 09:25:40 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BDA643F6C4;
	Thu, 10 Aug 2023 09:24:57 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 6/9] p11-kit: fix build without qemu-usermode
Date: Thu, 10 Aug 2023 17:24:48 +0100
Message-Id: <20230810162451.1766532-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810162451.1766532-1-ross.burton@arm.com>
References: <20230810162451.1766532-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185807

From: Ross Burton <ross.burton@arm.com>

If qemu-usermode is not available then p11-kit fails to configure:

  meson.build:313:24: ERROR: Can not run test applications in this cross =
environment.

This has already been fixed upstream, so backport the patches.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../p11-kit/files/strerror-1.patch            | 76 +++++++++++++++++++
 .../p11-kit/files/strerror-2.patch            | 30 ++++++++
 .../recipes-support/p11-kit/p11-kit_0.25.0.bb |  4 +-
 3 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/p11-kit/files/strerror-1.patch
 create mode 100644 meta/recipes-support/p11-kit/files/strerror-2.patch

diff --git a/meta/recipes-support/p11-kit/files/strerror-1.patch b/meta/r=
ecipes-support/p11-kit/files/strerror-1.patch
new file mode 100644
index 00000000000..6af4fee7249
--- /dev/null
+++ b/meta/recipes-support/p11-kit/files/strerror-1.patch
@@ -0,0 +1,76 @@
+From 3ba2c55dfdc8ff20de369f07f6c57d08718d3add Mon Sep 17 00:00:00 2001
+From: Adam Sampson <ats@offog.org>
+Date: Sun, 2 Jul 2023 15:22:49 +0100
+Subject: [PATCH] Check for GNU strerror_r using the compiler only
+
+The new test that was added to distinguish GNU/XSI strerror_r ran a
+compiled program, which doesn't work when cross-compiling. The only
+difference at compile time is that the GNU version returns char * and
+the XSI version returns int, so detect it by compiling a program that
+dereferences the return value.
+
+Signed-off-by: Adam Sampson <ats@offog.org>
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 19 +++++++------------
+ meson.build  | 10 +++++-----
+ 2 files changed, 12 insertions(+), 17 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 40f5a583..29890622 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -146,19 +146,14 @@ if test "$os_unix" =3D "yes"; then
+=20
+ 	AC_CHECK_FUNC(
+ 		[strerror_r],
+-		[AC_RUN_IFELSE(
+-			[AC_LANG_SOURCE([[
+-				#include <errno.h>
+-				#include <string.h>
+-
+-				int main (void)
+-				{
+-					char buf[32];
+-					return strerror_r (EINVAL, buf, 32);
+-				}
+-			]])],
+-                        [AC_DEFINE([HAVE_XSI_STRERROR_R], 1, [Whether X=
SI-compliant strerror_r() is available])],
++		[AC_COMPILE_IFELSE(
++			[AC_LANG_PROGRAM([[#include <errno.h>
++					   #include <string.h>]],
++					 [[/* GNU strerror_r returns char *, XSI returns int */
++					    char buf[32];
++					    return *strerror_r (EINVAL, buf, 32);]])],
+ 			[AC_DEFINE([HAVE_GNU_STRERROR_R], 1, [Whether GNU-specific strerror_=
r() is available])],
++                        [AC_DEFINE([HAVE_XSI_STRERROR_R], 1, [Whether X=
SI-compliant strerror_r() is available])],
+ 			[])],
+ 		[])
+=20
+diff --git a/meson.build b/meson.build
+index 0f8c8da0..4cc3f89a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -306,15 +306,15 @@ if cc.has_function('strerror_r', prefix: '#include=
 <string.h>')
+=20
+ int main (void)
+ {
++    /* GNU strerror_r returns char *, XSI returns int */
+     char buf[32];
+-    return strerror_r (EINVAL, buf, 32);
++    return *strerror_r (EINVAL, buf, 32);
+ }
+ '''
+-  strerror_r_check =3D cc.run(strerror_r_code, name : 'strerror_r check=
')
+-  if strerror_r_check.returncode() =3D=3D 0
+-    conf.set('HAVE_XSI_STRERROR_R', 1)
+-  else
++  if cc.compiles(strerror_r_code, name : 'GNU strerror_r check')
+     conf.set('HAVE_GNU_STRERROR_R', 1)
++  else
++    conf.set('HAVE_XSI_STRERROR_R', 1)
+   endif
+ endif
+=20
diff --git a/meta/recipes-support/p11-kit/files/strerror-2.patch b/meta/r=
ecipes-support/p11-kit/files/strerror-2.patch
new file mode 100644
index 00000000000..1a9180b508c
--- /dev/null
+++ b/meta/recipes-support/p11-kit/files/strerror-2.patch
@@ -0,0 +1,30 @@
+From 7aa6251bf4ce36d027d53c9c96bb05f90ef7eb5b Mon Sep 17 00:00:00 2001
+From: Adam Sampson <ats@offog.org>
+Date: Sun, 2 Jul 2023 15:44:06 +0100
+Subject: [PATCH] Define _GNU_SOURCE when testing for strerror_r
+
+The Meson check for GNU/XSI strerror_r didn't inherit the project
+options that include _GNU_SOURCE (unlike the autoconf version), so the
+result didn't match how the code that uses it will be compiled. Add
+_GNU_SOURCE explicitly as with the following checks.
+
+Signed-off-by: Adam Sampson <ats@offog.org>
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index 4cc3f89a..9a72e148 100644
+--- a/meson.build
++++ b/meson.build
+@@ -301,6 +301,7 @@ endforeach
+=20
+ if cc.has_function('strerror_r', prefix: '#include <string.h>')
+   strerror_r_code =3D '''
++#define _GNU_SOURCE
+ #include <errno.h>
+ #include <string.h>
+=20
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb b/meta/recipe=
s-support/p11-kit/p11-kit_0.25.0.bb
index ad207d0c9fd..ad1fda3f3b7 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb
@@ -10,7 +10,9 @@ DEPENDS =3D "libtasn1 libtasn1-native libffi"
=20
 DEPENDS:append =3D "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') =3D=3D =
'True' else ''}"
=20
-SRC_URI =3D "git://github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3D=
https"
+SRC_URI =3D "git://github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3D=
https \
+           file://strerror-1.patch \
+           file://strerror-2.patch"
 SRCREV =3D "a8cce8bd8065bbf80bd47219f85f0cd9cf27dd0c"
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


