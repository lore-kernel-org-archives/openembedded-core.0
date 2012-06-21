Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wade_farnsworth@mentor.com>) id 1Sho09-0002yH-OJ
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 22:29:14 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1ShnTX-0006SG-V9 from wade_farnsworth@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 12:55:31 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 21 Jun 2012 12:54:50 -0700
Received: from [172.30.1.252] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 21 Jun 2012 12:55:31 -0700
Message-ID: <4FE37C14.6060301@mentor.com>
Date: Thu, 21 Jun 2012 12:55:00 -0700
From: Wade Farnsworth <wade_farnsworth@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-OriginalArrivalTime: 21 Jun 2012 19:54:50.0869 (UTC)
	FILETIME=[B81EFA50:01CD4FE7]
Subject: [PATCH 1/1] systemtap: update to version 1.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2012 20:29:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Update the systemtap recipes to the recently released version 1.8.  Remov=
e a
couple of patches whose changes are already present in the new version.

Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
---
 ...prun-configure.ac-support-without-nss-for.patch |   50 --------------=
------
 .../systemtap_fix_for_automake_1.12.patch          |   23 ---------
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    6 +--
 4 files changed, 3 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/runtime-stapr=
un-configure.ac-support-without-nss-for.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/systemtap_fix=
_for_automake_1.12.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-conf=
igure.ac-support-without-nss-for.patch b/meta/recipes-kernel/systemtap/sy=
stemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
deleted file mode 100644
index eef414a..0000000
--- a/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.a=
c-support-without-nss-for.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From fa81ccd4f92e5cb15a11a81a7e656bfe01745afb Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
-Date: Tue, 5 Jun 2012 10:22:23 +0200
-Subject: [PATCH] runtime/staprun/configure.ac: support --without-nss for=

- staprun
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Submitted
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
----
- runtime/staprun/configure.ac |   20 +++++++++++++++-----
- 1 files changed, 15 insertions(+), 5 deletions(-)
-
-diff --git a/runtime/staprun/configure.ac b/runtime/staprun/configure.ac=

-index 8fd1b42..7b05f73 100644
---- a/runtime/staprun/configure.ac
-+++ b/runtime/staprun/configure.ac
-@@ -67,11 +67,21 @@ AS_IF([test "x$enable_sdt_probes" !=3D xno], [
-             [Define to 1 to enable process.mark probes in staprun, stap=
io.])
- ])
-=20
--PKG_CHECK_MODULES([nss], [nss >=3D 3], [have_nss=3Dyes], [have_nss=3Dno=
])
--AM_CONDITIONAL([HAVE_NSS], [test $have_nss =3D yes])
--AS_IF([test $have_nss =3D yes], [
--  AC_DEFINE([HAVE_NSS], [1], [Define to 1 if you have the nss libraries=
=2E])
--])
-+dnl See if we have the nss/nspr headers and libraries
-+AC_ARG_WITH([nss],
-+  AS_HELP_STRING([--without-nss],
-+    [Do not use NSS even if present]))
-+
-+AS_IF([test "x$with_nss" !=3D "xno"], [
-+  PKG_CHECK_MODULES([nss], [nss >=3D 3],
-+    [have_nss=3Dyes
-+     AC_DEFINE([HAVE_NSS], [1], [Define to 1 if you have the nss librar=
ies.])
-+    ], [have_nss=3Dno])
-+], [have_nss=3Dno])
-+
-+AM_CONDITIONAL([HAVE_NSS], [test "${have_nss}" =3D "yes"])
-+
-+
- AC_ARG_ENABLE([nls], [AS_HELP_STRING([--enable-nls], [enable translatin=
g program messages])])
- AS_IF([test "x$enable_nls" !=3D xno], [
- AC_DEFINE([ENABLE_NLS], [1], [Define to 1 if program messages should be=
 translated.])
---=20
-1.7.6.5
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_au=
tomake_1.12.patch b/meta/recipes-kernel/systemtap/systemtap/systemtap_fix=
_for_automake_1.12.patch
deleted file mode 100644
index ef74a09..0000000
--- a/meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_=
1.12.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Pending=20
-
-Automake 1.12 has deprecated automatic de-ANSI-fication support
-
-Fix this issue with automake 1.12:
-
-| configure.ac:23: error: automatic de-ANSI-fication support has been re=
moved
-
-Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/02
-
-Index: git/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -20,7 +20,6 @@ AC_PROG_CXX
- AC_PROG_CPP
- AM_PROG_CC_STDC
- AM_PROG_CC_C_O
--AM_C_PROTOTYPES
- AC_PROG_RANLIB
- AC_OBJEXT
- AC_EXEEXT
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipe=
s-kernel/systemtap/systemtap_git.bb
index 7ed5fcd..059aca7 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -6,7 +6,7 @@ DEPENDS =3D "elfutils sqlite3 systemtap-native"
 DEPENDS_virtclass-native =3D "elfutils-native sqlite3-native gettext-nat=
ive"
 DEPENDS_virtclass-nativesdk =3D "elfutils-nativesdk sqlite3-nativesdk ge=
ttext-nativesdk"
=20
-PR =3D "r5"
+PR =3D "r0"
=20
 export CC_FOR_BUILD =3D "${BUILD_CC}"
 export CFLAGS_FOR_BUILD =3D "${BUILD_CFLAGS}"
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recip=
es-kernel/systemtap/systemtap_git.inc
index 5f2987b..093e62d 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,13 +1,11 @@
 LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-SRCREV =3D "83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81"
-PV =3D "1.7+git${SRCPV}"
+SRCREV =3D "48fa6b5e1d3e636c34cbd5650370e6f634efc294"
+PV =3D "1.8+git${SRCPV}"
=20
 SRC_URI =3D "git://sources.redhat.com/git/systemtap.git;protocol=3Dgit \=

            file://docproc-build-fix.patch \
-           file://systemtap_fix_for_automake_1.12.patch \
-           file://runtime-staprun-configure.ac-support-without-nss-for.p=
atch \
           "
=20
 FILESPATH =3D "${FILE_DIRNAME}/systemtap"
--=20
1.7.0.4




