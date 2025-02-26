Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FDAC021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 20:22:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15662.1740601335420188099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 12:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 729711515
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 12:22:30 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 40C263F673
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 12:22:14 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] automake: remove upstreamed patches
Date: Wed, 26 Feb 2025 20:22:10 +0000
Message-ID: <20250226202210.2006153-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 20:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211972

0001-automake-Add-default-libtool_tag-to-cppasm.patch was upstreamed in
1.16[1].

0003-build-fix-race-in-parallel-builds.patch wasn't directly applied,
but a fix for the same problem was merged in 1.17[2].

[1] automake dc67b18d "automake: Add default libtool_tag to cppasm"
[2] automake 5d022858 "build: fix race in parallel builds"

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ke-Add-default-libtool_tag-to-cppasm.patch | 29 ---------
 ...03-build-fix-race-in-parallel-builds.patch | 65 -------------------
 .../automake/automake_1.17.bb                 |  2 -
 3 files changed, 96 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/0001-automake=
-Add-default-libtool_tag-to-cppasm.patch
 delete mode 100644 meta/recipes-devtools/automake/automake/0003-build-fi=
x-race-in-parallel-builds.patch

diff --git a/meta/recipes-devtools/automake/automake/0001-automake-Add-de=
fault-libtool_tag-to-cppasm.patch b/meta/recipes-devtools/automake/automa=
ke/0001-automake-Add-default-libtool_tag-to-cppasm.patch
deleted file mode 100644
index 9608b5db444..00000000000
--- a/meta/recipes-devtools/automake/automake/0001-automake-Add-default-l=
ibtool_tag-to-cppasm.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 2884ad2aa8b51cbba25a376935151a242f488e30 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 26 Jul 2017 11:19:56 -0700
-Subject: [PATCH 1/6] automake: Add default libtool_tag to cppasm.
-
-    * bin/automake.in (register_language): Define default libtool tag to=
 be CC
-    since CPPASCOMPILE is using CC to call assembler
-
-Upstream-Status: Submitted
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- bin/automake.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/bin/automake.in b/bin/automake.in
-index a17f452..18626de 100644
---- a/bin/automake.in
-+++ b/bin/automake.in
-@@ -897,6 +897,7 @@ register_language ('name' =3D> 'cppasm',
-                    'libtool_tag' =3D> 'CC',
- 		   'compile_flag' =3D> '-c',
- 		   'output_flag' =3D> '-o',
-+		   'libtool_tag' =3D> 'CC',
- 		   'extensions' =3D> ['.S', '.sx']);
-=20
- # Fortran 77
---=20
-2.39.2
-
diff --git a/meta/recipes-devtools/automake/automake/0003-build-fix-race-=
in-parallel-builds.patch b/meta/recipes-devtools/automake/automake/0003-b=
uild-fix-race-in-parallel-builds.patch
deleted file mode 100644
index a4039c3bbab..00000000000
--- a/meta/recipes-devtools/automake/automake/0003-build-fix-race-in-para=
llel-builds.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From b952d7064c9cee23857fbc7cb9d761542b98d59a Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 26 Jul 2018 00:58:12 -0700
-Subject: [PATCH 3/6] build: fix race in parallel builds
-
-The automake-$(APIVERSION) is a hardlink of automake, if it is
-created later than update_mans executing, there is a failure
-[snip]
-|: && mkdir -p doc && ./pre-inst-env /usr/bin/env perl
-../automake-1.16.1/doc/help2man --output=3Ddoc/aclocal-1.16.1
-aclocal-1.16
-|help2man: can't get `--help' info from aclocal-1.16
-|Try `--no-discard-stderr' if option outputs to stderr
-Makefile:3693: recipe for target 'doc/aclocal-1.16.1' failed
-[snip]
-
-The automake_script is required by update_mans and update_mans
-invokes automake-$(APIVERSION) rather than automake to generate
-doc, so we should assign `automake-$(APIVERSION)' to automake_script.
-
-The same reason to tweak aclocal_script.
-
-* bin/local.mk: correct automake_script/aclocal_script
-
-Upstream-Status: Submitted [automake-patches@gnu.org]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Makefile.in  | 4 ++--
- bin/local.mk | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index a919544..c0f8c0d 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -723,8 +723,8 @@ bin_SCRIPTS =3D bin/automake bin/aclocal
- # Used by maintainer checks and such.
- automake_in =3D $(srcdir)/bin/automake.in
- aclocal_in =3D $(srcdir)/bin/aclocal.in
--automake_script =3D bin/automake
--aclocal_script =3D bin/aclocal
-+automake_script =3D bin/automake-$(APIVERSION)
-+aclocal_script  =3D bin/aclocal-$(APIVERSION)
- AUTOMAKESOURCES =3D $(automake_in) $(aclocal_in)
- info_TEXINFOS =3D doc/automake.texi doc/automake-history.texi
- doc_automake_TEXINFOS =3D doc/fdl.texi
-diff --git a/bin/local.mk b/bin/local.mk
-index 4232448..8f043b0 100644
---- a/bin/local.mk
-+++ b/bin/local.mk
-@@ -31,8 +31,8 @@ CLEANFILES +=3D \
- # Used by maintainer checks and such.
- automake_in =3D $(srcdir)/%D%/automake.in
- aclocal_in  =3D $(srcdir)/%D%/aclocal.in
--automake_script =3D %D%/automake
--aclocal_script  =3D %D%/aclocal
-+automake_script =3D %D%/automake-$(APIVERSION)
-+aclocal_script  =3D %D%/aclocal-$(APIVERSION)
-=20
- AUTOMAKESOURCES =3D $(automake_in) $(aclocal_in)
- TAGS_FILES +=3D $(AUTOMAKESOURCES)
---=20
-2.39.2
-
diff --git a/meta/recipes-devtools/automake/automake_1.17.bb b/meta/recip=
es-devtools/automake/automake_1.17.bb
index 1118aa46686..4cda04e47b2 100644
--- a/meta/recipes-devtools/automake/automake_1.17.bb
+++ b/meta/recipes-devtools/automake/automake_1.17.bb
@@ -19,9 +19,7 @@ RDEPENDS:${PN} +=3D "\
 RDEPENDS:${PN}:class-native =3D "autoconf-native hostperl-runtime-native=
"
=20
 SRC_URI +=3D "\
-           file://0001-automake-Add-default-libtool_tag-to-cppasm.patch =
\
            file://0002-automake-Update-for-python.m4-to-respect-libdir.p=
atch \
-           file://0003-build-fix-race-in-parallel-builds.patch \
            file://0004-Add-a-new-distro-feature-ptest.patch \
            file://0006-automake-Remove-delays-in-configure-scripts-using=
-au.patch \
            file://0001-configure-don-t-report-error-when-the-path-of-Per=
l-c.patch \
--=20
2.43.0


