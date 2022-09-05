Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836F7ECAAD3
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 10:20:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.23330.1662373198126578160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 03:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42CC0D6E;
	Mon,  5 Sep 2022 03:20:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DF283F7B4;
	Mon,  5 Sep 2022 03:19:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] xmlto: remove redundant patches
Date: Mon,  5 Sep 2022 11:19:53 +0100
Message-Id: <20220905101953.2513727-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 10:20:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170310

0001-Skip-validating-xmlto-output isn't needed as xmllint will use the
local catalogues correctly now[1].

configure.in-drop-the-test-of-xmllint-and-xsltproc can be dropped if we
pre-load the result of AC_PATH_PROG with ac_cv_path_XMLLINT.

[1] oe-core 8159b47e7ddddaca57ade2ecf24d8ff9a0abf26a

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-Skip-validating-xmlto-output.patch   | 29 ------------------
 ...rop-the-test-of-xmllint-and-xsltproc.patch | 30 -------------------
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |  9 ++----
 3 files changed, 3 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-devtools/xmlto/xmlto/0001-Skip-validatin=
g-xmlto-output.patch
 delete mode 100644 meta/recipes-devtools/xmlto/xmlto/configure.in-drop-t=
he-test-of-xmllint-and-xsltproc.patch

diff --git a/meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xmlto=
-output.patch b/meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xm=
lto-output.patch
deleted file mode 100644
index c6857a9da51..00000000000
--- a/meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xmlto-output=
.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3deb7a0eded04ab08a9cb2d88526cb1c7b440061 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 14 Aug 2022 00:23:29 -0700
-Subject: [PATCH] Skip validating xmlto output
-
-Avoids network access
-
-Upstream-Status: Submitted [https://pagure.io/xmlto/pull-request/11]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 50fa279..6a2da62 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -68,7 +68,7 @@ EXTRA_DIST =3D xmlto.spec \
- 	doc/xmlif.xml \
- 	xmlto.mak
-=20
--GEN_MANPAGE =3D FORMAT_DIR=3D$(top_srcdir)/format $(BASH) ./xmlto -o $(=
@D) man $<
-+GEN_MANPAGE =3D FORMAT_DIR=3D$(top_srcdir)/format $(BASH) ./xmlto --ski=
p-validation -o $(@D) man $<
- man/man1/xmlto.1: doc/xmlto.xml ; $(GEN_MANPAGE)
- man/man1/xmlif.1: doc/xmlif.xml ; $(GEN_MANPAGE)
-=20
---=20
-2.37.2
-
diff --git a/meta/recipes-devtools/xmlto/xmlto/configure.in-drop-the-test=
-of-xmllint-and-xsltproc.patch b/meta/recipes-devtools/xmlto/xmlto/config=
ure.in-drop-the-test-of-xmllint-and-xsltproc.patch
deleted file mode 100644
index 7cc3cbe0fb2..00000000000
--- a/meta/recipes-devtools/xmlto/xmlto/configure.in-drop-the-test-of-xml=
lint-and-xsltproc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-configure.in: drop the test of xmllint and xsltproc
-
-The test is unnecessary, the xmllint and xsltproc were explicitly
-added to RDEPENDS.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
---- a/configure.ac
-+++ b/configure.ac
-@@ -42,10 +42,10 @@ AC_ARG_VAR([LOCALE], [Name and path of the `locale' =
program.])
- AC_PATH_PROG([LOCALE], [locale], [locale])
-=20
- AC_ARG_VAR([XMLLINT], [Name and path of the `xmllint' program.])
--AC_PATH_PROG([XMLLINT], [xmllint], [xmllint])
-+dnl AC_PATH_PROG([XMLLINT], [xmllint], [xmllint])
-=20
- AC_ARG_VAR([XSLTPROC], [Name and path of the `xsltproc' program.])
--AC_PATH_PROG([XSLTPROC], [xsltproc], [xsltproc])
-+dnl AC_PATH_PROG([XSLTPROC], [xsltproc], [xsltproc])
-=20
- dnl
- dnl toolchains
---=20
-1.8.1.2
-
diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-d=
evtools/xmlto/xmlto_0.0.28.bb
index 373eca2454b..5e3fac7a60c 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -8,10 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659=
b29e73d4adb9f9f6552"
=20
 SRCREV =3D "6fa6a0e07644f20abf2596f78a60112713e11cbe"
 UPSTREAM_CHECK_COMMITS =3D "1"
-SRC_URI =3D "git://pagure.io/xmlto.git;protocol=3Dhttps;branch=3Dmaster =
\
-           file://configure.in-drop-the-test-of-xmllint-and-xsltproc.pat=
ch \
-           file://0001-Skip-validating-xmlto-output.patch \
-"
+SRC_URI =3D "git://pagure.io/xmlto.git;protocol=3Dhttps;branch=3Dmaster"
 S =3D "${WORKDIR}/git"
=20
 PV .=3D "+0.0.29+git${SRCPV}"
@@ -34,11 +31,11 @@ RDEPENDS:${PN}:append:class-target =3D " \
                   libxslt-bin \
                   coreutils \
 "
-CACHED_CONFIGUREVARS +=3D "ac_cv_path_TAIL=3Dtail ac_cv_path_GREP=3Dgrep=
"
+CACHED_CONFIGUREVARS +=3D "ac_cv_path_TAIL=3Dtail ac_cv_path_GREP=3Dgrep=
 ac_cv_path_XMLLINT=3Dxmllint ac_cv_path_XSLTPROC=3Dxsltproc"
=20
 BBCLASSEXTEND =3D "native"
=20
-EXTRA_OECONF:append =3D " BASH=3D/bin/bash GCP=3D/bin/cp XMLLINT=3Dxmlli=
nt XSLTPROC=3Dxsltproc"
+EXTRA_OECONF:append =3D " BASH=3D/bin/bash GCP=3D/bin/cp"
=20
 do_configure:prepend() {
     (cd ${S} && flex -o xmlif/xmlif.c xmlif/xmlif.l)
--=20
2.34.1


