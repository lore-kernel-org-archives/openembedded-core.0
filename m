Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84FAC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 15:28:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.46318.1737559702580706150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 07:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D01A1007
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 07:28:50 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AE5443F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 07:28:21 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] man-db: fix broken requirement for flex
Date: Wed, 22 Jan 2025 15:28:17 +0000
Message-ID: <20250122152817.736263-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 15:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210157

Normally flex-native in the sysroot via the toolchain, but different
toolchains may not depend on flex-native (eg, external-arm-toolchain).

This results in a configure error:

  checking for flex... no
  configure: error: flex is required when building from revision control

Now we're not building from revision control, but the configure script
is broken with out-of-tree builds and checks the (empty) build tree for
pre-generated sources.  Apply a fix to look in the source tree instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/man-db/files/flex.patch | 36 +++++++++++++++++++
 meta/recipes-extended/man-db/man-db_2.13.0.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/man-db/files/flex.patch

diff --git a/meta/recipes-extended/man-db/files/flex.patch b/meta/recipes=
-extended/man-db/files/flex.patch
new file mode 100644
index 00000000000..c18be7e36ae
--- /dev/null
+++ b/meta/recipes-extended/man-db/files/flex.patch
@@ -0,0 +1,36 @@
+From d3f7c160bddf5d879c74e19e4f577882e8b22559 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 22 Jan 2025 14:16:48 +0000
+Subject: [PATCH] configure: check for shipped generated sources in sourc=
e
+ directory
+
+The configure script fails if it can't find flex and the pregenerated
+source code isn't available, as is the case in builds from git whereas
+tarballs include the code.
+
+However this breaks with out-of-tree builds, where cwd during configure
+is the build directory not the source directory, and the pregenerated
+sources will always be inside the source directory.
+
+Upstream-Status: Submitted [https://gitlab.com/man-db/man-db/-/merge_req=
uests/12]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7e9148fb..49a213fd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -380,7 +380,7 @@ dnl To add more decompressors just follow the scheme=
 above.
+ dnl The "noyywrap" argument is new in Autoconf 2.70, but this also work=
s
+ dnl fine with older versions that ignore the argument.
+ AC_PROG_LEX([noyywrap])
+-if test "$LEX" =3D ":" && (test ! -e src/lexgrog.c || test ! -e src/zso=
elim.c)
++if test "$LEX" =3D ":" && (test ! -e $srcdir/src/lexgrog.c || test ! -e=
 $srcdir/src/zsoelim.c)
+ then
+ 	AC_MSG_ERROR([flex is required when building from revision control])
+ fi
+--=20
+2.43.0
+
diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipes=
-extended/man-db/man-db_2.13.0.bb
index 2fa18a8f24f..2178239bb60 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af=
26da5dc08a4e440464 \
                    "
=20
 SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
+           file://flex.patch \
            file://99_mandb \
           "
 SRC_URI[sha256sum] =3D "82f0739f4f61aab5eb937d234de3b014e777b5538a28cbd3=
1433c45ae09aefb9"
--=20
2.43.0


