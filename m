Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4920.1626435149611988494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 04:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4114DD6E
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 04:32:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEA963F774
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 04:32:27 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] parted: remove obsolete patch
Date: Fri, 16 Jul 2021 12:32:23 +0100
Message-Id: <20210716113225.4138702-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We've had recipe-specific sysroots for a long time now, so there's no
need to forcible disable floating checks.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../parted/files/no_check.patch               | 20 -------------------
 meta/recipes-extended/parted/parted_3.4.bb    |  1 -
 2 files changed, 21 deletions(-)
 delete mode 100644 meta/recipes-extended/parted/files/no_check.patch

diff --git a/meta/recipes-extended/parted/files/no_check.patch b/meta/rec=
ipes-extended/parted/files/no_check.patch
deleted file mode 100644
index e6a26d11a5..0000000000
--- a/meta/recipes-extended/parted/files/no_check.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-If check is detected, it makes the builds non-determinstic so just force
-it to be disabled.
-
-RP - 4/11/08
-
-Index: parted-3.2/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- parted-3.2.orig/configure.ac
-+++ parted-3.2/configure.ac
-@@ -555,7 +555,7 @@ AC_CHECK_HEADER([execinfo.h], [
- AM_CONDITIONAL([COMPILE_FOR_S390], [test "$host_cpu" =3D s390 || test "=
$host_cpu" =3D s390x])
-=20
- dnl check for "check", unit testing library/header
--PKG_CHECK_MODULES([CHECK], [check >=3D 0.9.3], have_check=3Dyes, have_c=
heck=3Dno)
-+have_check=3Dno
- if test "$have_check" !=3D "yes"; then
-     AC_MSG_RESULT([Unable to locate check version 0.9.3 or higher: not =
building])
- fi
diff --git a/meta/recipes-extended/parted/parted_3.4.bb b/meta/recipes-ex=
tended/parted/parted_3.4.bb
index 4b76ca4861..96d30372c3 100644
--- a/meta/recipes-extended/parted/parted_3.4.bb
+++ b/meta/recipes-extended/parted/parted_3.4.bb
@@ -7,7 +7,6 @@ SECTION =3D "console/tools"
 DEPENDS =3D "ncurses util-linux virtual/libiconv"
=20
 SRC_URI =3D "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
-           file://no_check.patch \
            file://fix-doc-mandir.patch \
            file://0002-libparted_fs_resize-link-against-libuuid-explicit=
ly-.patch \
            file://run-ptest \
--=20
2.25.1

