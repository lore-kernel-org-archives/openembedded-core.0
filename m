Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C535C3600B
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 12:11:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20798.1742991116605340761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 05:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6E311692
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 05:12:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E20DE3F63F
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 05:11:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] flex: build occasional build failures in test suite compile
Date: Wed, 26 Mar 2025 12:11:50 +0000
Message-ID: <20250326121151.260340-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326121151.260340-1-ross.burton@arm.com>
References: <20250326121151.260340-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 12:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213648

GNU Make 4.4 has added --shuffle, which randomly orders build jobs and
is great at exposing missing dependencies. Using this the known problem
with the flex test suite build was found and resolved, so remove the
workaround of doing a non-parallel build and apply a patch.

Also remove redundant Make variables that shouldn't be needed to build
the test suite.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-missing-parser-scanner-dependencies.patch | 51 +++++++++++++++++++
 meta/recipes-devtools/flex/flex_2.6.4.bb      |  4 +-
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/flex/flex/0001-build-tests-add-=
missing-parser-scanner-dependencies.patch

diff --git a/meta/recipes-devtools/flex/flex/0001-build-tests-add-missing=
-parser-scanner-dependencies.patch b/meta/recipes-devtools/flex/flex/0001=
-build-tests-add-missing-parser-scanner-dependencies.patch
new file mode 100644
index 00000000000..130eccc9b4b
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/0001-build-tests-add-missing-parser=
-scanner-dependencies.patch
@@ -0,0 +1,51 @@
+From 47e3916842ffefd7def84ae85758fdcceeb77839 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 20 Mar 2025 12:16:50 +0000
+Subject: [PATCH] build(tests): add missing parser->scanner dependencies
+
+With sufficient parallelism and `make --shuffle` to reorder builds the
+test suite occasionally fails to build with errors like this:
+
+ tests/bison_yylval_parser.y:36:10: fatal error: bison_yylval_scanner.h:=
 No such file or directory
+    36 | #include "bison_yylval_scanner.h"
+
+Solve this by adding the missing dependencies to the *_parser.o targets
+on the _scanner.h files.
+
+Upstream-Status: Submitted [https://github.com/westes/flex/pull/702]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/Makefile.am | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 2cb51df..d0c199d 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -343,6 +343,7 @@ FLEX =3D $(top_builddir)/src/flex
+=20
+ bison_nr_main.$(OBJEXT): bison_nr_parser.h bison_nr_scanner.h
+ bison_nr_scanner.$(OBJEXT): bison_nr_parser.h
++bison_nr_parser.$(OBJEXT): bison_nr_scanner.h
+=20
+ bison_nr_scanner.h: bison_nr_scanner.c
+ 	@if test ! -f $@; then rm -f $<; else :; fi
+@@ -350,6 +351,7 @@ bison_nr_scanner.h: bison_nr_scanner.c
+=20
+ bison_yylloc_main.$(OBJEXT): bison_yylloc_parser.h bison_yylloc_scanner=
.h
+ bison_yylloc_scanner.$(OBJEXT): bison_yylloc_parser.h
++bison_yylloc_parser.$(OBJEXT): bison_yylloc_scanner.h
+=20
+ bison_yylloc_scanner.h: bison_yylloc_scanner.c
+ 	@if test ! -f $@; then rm -f $<; else :; fi
+@@ -357,6 +359,7 @@ bison_yylloc_scanner.h: bison_yylloc_scanner.c
+=20
+ bison_yylval_main.$(OBJEXT): bison_yylval_parser.h bison_yylval_scanner=
.h
+ bison_yylval_scanner.$(OBJEXT): bison_yylval_parser.h
++bison_yylval_parser.$(OBJEXT): bison_yylval_scanner.h
+=20
+ bison_yylval_scanner.h: bison_yylval_scanner.c
+ 	@if test ! -f $@; then rm -f $<; else :; fi
+--=20
+2.43.0
+
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devt=
ools/flex/flex_2.6.4.bb
index 434ce47c03a..793a935962e 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/flex-${=
PV}.tar.gz \
            file://0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.pa=
tch \
            file://check-funcs.patch \
            file://0001-Emit-no-line-directives-if-gen_line_dirs-is-false=
.patch \
+           file://0001-build-tests-add-missing-parser-scanner-dependenci=
es.patch \
            "
=20
 SRC_URI[md5sum] =3D "2882e3179748cc9f9c23ec593d6adc8d"
@@ -55,9 +56,8 @@ RDEPENDS:${PN} +=3D "m4"
 RDEPENDS:${PN}-ptest +=3D "bash gawk make"
=20
 do_compile_ptest() {
-	oe_runmake -C ${B}/tests -f ${B}/tests/Makefile top_builddir=3D${B} INC=
LUDES=3D-I${S}/src buildtests
+	oe_runmake -C ${B}/tests buildtests
 }
-PTEST_PARALLEL_MAKE =3D ""
=20
 do_install_ptest() {
 	mkdir -p ${D}${PTEST_PATH}/build-aux/
--=20
2.43.0


