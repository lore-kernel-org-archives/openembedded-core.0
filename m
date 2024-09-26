Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0149CCDE00A
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 14:05:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.44025.1727359544989958152
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 07:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D3A714BF
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 07:06:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 52F053F6A8
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 07:05:43 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] libarchive: upgrade 3.7.4 -> 3.7.6
Date: Thu, 26 Sep 2024 15:05:36 +0100
Message-Id: <20240926140536.1473507-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 14:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204986

Drop configurehack.patch, no longer needed.

Do not apply, currently breaks python3-libarchive-3's test suite.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libarchive/libarchive/configurehack.patch | 55 -------------------
 ...ibarchive_3.7.4.bb =3D> libarchive_3.7.6.bb} |  4 +-
 2 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/configure=
hack.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.7.4.bb =3D> libarc=
hive_3.7.6.bb} (95%)

diff --git a/meta/recipes-extended/libarchive/libarchive/configurehack.pa=
tch b/meta/recipes-extended/libarchive/libarchive/configurehack.patch
deleted file mode 100644
index 45fddd91475..00000000000
--- a/meta/recipes-extended/libarchive/libarchive/configurehack.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-To work with autoconf 2.73, tweak the macro ordering in configure.in.
-
-Upstream-Status: Pending
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- configure.ac | 26 +++++++++++++-------------
- 1 file changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 503bb75..e3101da 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -414,6 +414,19 @@ if test "x$with_bz2lib" !=3D "xno"; then
-   esac
- fi
-=20
-+# Checks for typedefs, structures, and compiler characteristics.
-+AC_C_CONST
-+# la_TYPE_UID_T defaults to "int", which is incorrect for MinGW
-+# and MSVC. Use a customized version.
-+la_TYPE_UID_T
-+AC_TYPE_MODE_T
-+# AC_TYPE_OFF_T defaults to "long", which limits us to 4GB files on
-+# most systems... default to "long long" instead.
-+AC_CHECK_TYPE(off_t, [long long])
-+AC_TYPE_SIZE_T
-+AC_CHECK_TYPE(id_t, [unsigned long])
-+AC_CHECK_TYPE(uintptr_t, [unsigned int])
-+
- AC_ARG_WITH([libb2],
-   AS_HELP_STRING([--without-libb2], [Don't build support for BLAKE2 thr=
ough libb2]))
-=20
-@@ -678,19 +691,6 @@ fi
-=20
- AC_SUBST(DEAD_CODE_REMOVAL)
-=20
--# Checks for typedefs, structures, and compiler characteristics.
--AC_C_CONST
--# la_TYPE_UID_T defaults to "int", which is incorrect for MinGW
--# and MSVC. Use a customized version.
--la_TYPE_UID_T
--AC_TYPE_MODE_T
--# AC_TYPE_OFF_T defaults to "long", which limits us to 4GB files on
--# most systems... default to "long long" instead.
--AC_CHECK_TYPE(off_t, [long long])
--AC_TYPE_SIZE_T
--AC_CHECK_TYPE(id_t, [unsigned long])
--AC_CHECK_TYPE(uintptr_t, [unsigned int])
--
- # Check for tm_gmtoff in struct tm
- AC_CHECK_MEMBERS([struct tm.tm_gmtoff, struct tm.__tm_gmtoff],,,
- [
---=20
-2.34.1
-
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb b/meta/=
recipes-extended/libarchive/libarchive_3.7.6.bb
similarity index 95%
rename from meta/recipes-extended/libarchive/libarchive_3.7.4.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.6.bb
index da857641168..de4d1ef7643 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.6.bb
@@ -30,10 +30,10 @@ PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,z=
std,"
 EXTRA_OECONF +=3D "--enable-largefile --without-iconv"
=20
 SRC_URI =3D "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
-SRC_URI +=3D "file://configurehack.patch"
+
 UPSTREAM_CHECK_URI =3D "http://libarchive.org/"
=20
-SRC_URI[sha256sum] =3D "7875d49596286055b52439ed42f044bd8ad426aa4cc5aabd=
96bfe7abb971d5e8"
+SRC_URI[sha256sum] =3D "b4071807367b15b72777c2eaac80f42c8ea2d20212ab2795=
14a19fe1f6f96ef4"
=20
 CVE_STATUS[CVE-2023-30571] =3D "upstream-wontfix: upstream has documente=
d that reported function is not thread-safe"
=20
--=20
2.34.1


