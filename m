Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D03AC369D9
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 12:16:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14487.1727266611048665524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 05:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B22D212FC
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 05:17:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E72243F6A8
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 05:16:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gnutls: upgrade to 3.8.7.1
Date: Wed, 25 Sep 2024 13:16:45 +0100
Message-Id: <20240925121645.2365090-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 12:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204951

A notable change in 3.8.7 is that the linkage to compression libraries
was changed to use a new tool called dlwrap, so these libraries should
be loaded at runtime with dlopen() instead of dynamically linked at
build time.  However, the dlopen() detection fails in cross builds[1] and
it falls back to dynamic linking so this isn't an issue we need to deal
with at present.

Also note that whilst dlwrap is a tool written in rust that needs the
clang includes, it's a maintainer tool and the generated files are in
git, so we should never need to rerun it.

Backport a patch to fix AM_CONDITIONAL to resolve linkage problems.

The 3.8.7.1 tarball is actually just a rebuild of 3.8.7 with the
translations included (which were missing in 3.8.7), so set S explicitly
for this release.

[1] https://gitlab.com/gnutls/gnutls/-/issues/1583

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gnutls/gnutls/conditional.patch           | 42 +++++++++++++++++++
 .../{gnutls_3.8.6.bb =3D> gnutls_3.8.7.1.bb}    |  6 ++-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/conditional.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.6.bb =3D> gnutls_3.8.7.1.=
bb} (94%)

diff --git a/meta/recipes-support/gnutls/gnutls/conditional.patch b/meta/=
recipes-support/gnutls/gnutls/conditional.patch
new file mode 100644
index 00000000000..2ff532fb53f
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/conditional.patch
@@ -0,0 +1,42 @@
+From 292f96f26d7ce80e4a165c903c4fd569b85c1c1f Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Fri, 16 Aug 2024 09:42:15 +0900
+Subject: [PATCH] build: fix setting AM_CONDITIONAL for brotli and zstd
+
+As the with_{libbrotli,libzsttd} variables are unset if configured
+with --without-{brotli,zstd}, check the unequality to "no" doesn't
+work; use explicit matching with "yes" instead.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 95ec4c1515..a476176800 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1158,7 +1158,7 @@ if test x$ac_brotli !=3D xno; then
+ else
+     AC_MSG_RESULT(no)
+ fi
+-AM_CONDITIONAL(HAVE_LIBBROTLI, test "$with_libbrotlienc" !=3D "no" && t=
est "$with_libbrotlidec" !=3D "no")
++AM_CONDITIONAL(HAVE_LIBBROTLI, test "$with_libbrotlienc" =3D yes && tes=
t "$with_libbrotlidec" =3D yes)
+=20
+ AS_IF([test "$ac_cv_dlopen_soname_works" =3D yes], [
+     save_CFLAGS=3D$CFLAGS
+@@ -1203,7 +1203,7 @@ if test x$ac_zstd !=3D xno; then
+ else
+     AC_MSG_RESULT(no)
+ fi
+-AM_CONDITIONAL(HAVE_LIBZSTD, test "$with_libzstd" !=3D "no")
++AM_CONDITIONAL(HAVE_LIBZSTD, test "$with_libzstd" =3D yes)
+=20
+ AS_IF([test "$ac_cv_dlopen_soname_works" =3D yes], [
+     save_CFLAGS=3D$CFLAGS
+--=20
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.6.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.8.7.1.bb
similarity index 94%
rename from meta/recipes-support/gnutls/gnutls_3.8.6.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.7.1.bb
index 37d12fb5ea3..b381520e2e8 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.6.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb
@@ -21,11 +21,15 @@ SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.g=
etVar('PV').split('.')[1]}"
 SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls=
-${PV}.tar.xz \
            file://arm_eabi.patch \
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-e=
nvi.patch \
+           file://conditional.patch \
            file://run-ptest \
            file://Add-ptest-support.patch \
            "
=20
-SRC_URI[sha256sum] =3D "2e1588aae53cb32d43937f1f4eca28febd9c0c7aa1734fc5=
dd61a7e81e0ebcdd"
+SRC_URI[sha256sum] =3D "9ca0ddaccce28a74fa18d738744190afb3b0daebef74e6ad=
686bf7bef99abd60"
+
+# This is only needed for 3.8.7.1, remove when upgrading to 3.8.8 onward=
s
+S =3D "${WORKDIR}/gnutls-3.8.7"
=20
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
=20
--=20
2.34.1


