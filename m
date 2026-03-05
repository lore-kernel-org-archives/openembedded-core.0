Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D59BF3094E
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:51:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42401.1772711497864510715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B072339
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Mar 2026 03:51:31 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 15AD73F836
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Mar 2026 03:51:36 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] gnutls: make C99 detection more resiliant
Date: Thu,  5 Mar 2026 11:51:29 +0000
Message-ID: <20260305115130.914001-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 11:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232484

gnutls checks that the compiler supports C99 code by checking that the
standard being used is C99 or C11. This will fail with autoconf 2.73,
which will tell the compiler to use C23 by default.

Change the logic so that the build works with C23 by flipping the logic:
we know that C89 is less than C99, but we don't know the names of future
standards.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/gnutls/gnutls/c99.patch | 41 ++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/c99.patch

diff --git a/meta/recipes-support/gnutls/gnutls/c99.patch b/meta/recipes-=
support/gnutls/gnutls/c99.patch
new file mode 100644
index 0000000000..f176c0c339
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/c99.patch
@@ -0,0 +1,41 @@
+From 203d8f2187bb7f483290e0f8b7b48b152b1d027f Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 5 Mar 2026 11:33:57 +0000
+Subject: [PATCH] configure: make the C99 detection more resiliant
+
+autoconf 2.73 will default to C23 by default, which means that the >C99
+detection logic in configure.ac will fail because it only handles c11
+and c99.
+
+Instead of adding c23 to the list and then breaking again in the future,
+flip the logic around (as suggested by Zack Weinberg) and check
+explicitly for just c89.
+
+Closes #1806.
+
+Upstream-Status: Submitted [https://gitlab.com/gnutls/gnutls/-/merge_req=
uests/2081]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 740fb6339..c708d8f5e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -54,9 +54,9 @@ AC_USE_SYSTEM_EXTENSIONS
+ # Require C99 support
+ #
+ AS_CASE([$ac_prog_cc_stdc],
+-  [c11 | c99], [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])]=
,
+-  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to c=
ompile the project.]])]
+-)
++  [c89],
++  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to c=
ompile the project.]])],
++  [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])])
+=20
+ AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" =3D yes)
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-=
support/gnutls/gnutls_3.8.12.bb
index d13a1365dc..c601d34069 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -23,6 +23,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v$=
{SHRT_VER}/gnutls-${PV}.tar
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-e=
nvi.patch \
            file://run-ptest \
            file://Add-ptest-support.patch \
+           file://c99.patch \
            "
=20
 SRC_URI[sha256sum] =3D "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2=
bf470bea012b8e51"
--=20
2.43.0


