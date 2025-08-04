Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A71CA0EC2
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 19:52:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5175.1754337163136156812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 12:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8603F1E5E
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 12:52:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 384533F5A1
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 12:52:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] dbus-glib: remove unused packaging of tests
Date: Mon,  4 Aug 2025 20:52:32 +0100
Message-ID: <20250804195237.149379-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804195237.149379-1-ross.burton@arm.com>
References: <20250804195237.149379-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 19:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221438

We're carrying a patch to install the tests, but we don't actually
install them by default or have any ptest infrastructure to run them.

As this is complicating the recipe for no reason, remove it all. If
someone in the future wants to run the tests they can do it with ptest
so they're exercised correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../dbus-glib/test-install-makefile.patch     | 58 -------------------
 meta/recipes-core/dbus/dbus-glib_0.114.bb     | 11 +---
 2 files changed, 1 insertion(+), 68 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib/test-install-makefil=
e.patch

diff --git a/meta/recipes-core/dbus/dbus-glib/test-install-makefile.patch=
 b/meta/recipes-core/dbus/dbus-glib/test-install-makefile.patch
deleted file mode 100644
index 0b1b712dd9d..00000000000
--- a/meta/recipes-core/dbus/dbus-glib/test-install-makefile.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4dbb1a459c281eeb716b4f0ce2fc01e8034c3e20 Mon Sep 17 00:00:00 2001
-From: Yao Zhao <yao.zhao@windriver.com>
-Date: Tue, 17 Jul 2012 16:46:30 -0400
-Subject: [PATCH] Change Makefile.am to install regression tests for test
- package purpose.
-
-Upstream-Status: Inappropriate [test not install is for purpose from ups=
tream]
-
-Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- test/Makefile.am            | 3 ++-
- test/core/Makefile.am       | 3 ++-
- test/interfaces/Makefile.am | 3 ++-
- 3 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/test/Makefile.am b/test/Makefile.am
-index 7393bed..1c25d5d 100644
---- a/test/Makefile.am
-+++ b/test/Makefile.am
-@@ -48,7 +48,8 @@ TESTS =3D \
- 	$(test_scripts) \
- 	$(NULL)
-=20
--noinst_PROGRAMS =3D \
-+testdir =3D $(datadir)/@PACKAGE@/tests
-+test_PROGRAMS =3D \
- 	$(test_programs) \
- 	$(test_related_programs) \
- 	$(NULL)
-diff --git a/test/core/Makefile.am b/test/core/Makefile.am
-index 35defa9..295202f 100644
---- a/test/core/Makefile.am
-+++ b/test/core/Makefile.am
-@@ -57,7 +57,8 @@ if DBUS_BUILD_TESTS
-=20
- ## we use noinst_PROGRAMS not check_PROGRAMS for TESTS so that we
- ## build even when not doing "make check"
--noinst_PROGRAMS =3D \
-+testdir =3D $(datadir)/@PACKAGE@/tests/core
-+test_PROGRAMS =3D \
- 	test-dbus-glib \
- 	test-error-mapping \
- 	test-service-glib \
-diff --git a/test/interfaces/Makefile.am b/test/interfaces/Makefile.am
-index f3f62e4..f034b95 100644
---- a/test/interfaces/Makefile.am
-+++ b/test/interfaces/Makefile.am
-@@ -57,7 +57,8 @@ if DBUS_BUILD_TESTS
-=20
- ## we use noinst_PROGRAMS not check_PROGRAMS for TESTS so that we
- ## build even when not doing "make check"
--noinst_PROGRAMS =3D test-service test-client
-+testdir =3D $(datadir)/@PACKAGE@/tests/interfaces
-+test_PROGRAMS =3D test-service test-client
-=20
- test_service_SOURCES =3D \
- 	test-interfaces.c \
diff --git a/meta/recipes-core/dbus/dbus-glib_0.114.bb b/meta/recipes-cor=
e/dbus/dbus-glib_0.114.bb
index ff3d282ac6f..4a827b1cbf8 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.114.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.114.bb
@@ -17,21 +17,15 @@ DEPENDS:class-native =3D "glib-2.0-native dbus-native=
"
=20
 SRC_URI =3D "https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-$=
{PV}.tar.gz \
            file://no-examples.patch \
-           file://test-install-makefile.patch \
 "
 SRC_URI[sha256sum] =3D "c09c5c085b2a0e391b8ee7d783a1d63fe444e96717cc1814=
d61b5e8fc2827a7c"
=20
 inherit autotools pkgconfig gettext bash-completion gtk-doc
=20
-#default disable regression tests, some unit test code in non testing co=
de
-#PACKAGECONFIG:pn-${PN} =3D "tests" enable regression tests local.conf
-PACKAGECONFIG ??=3D ""
-PACKAGECONFIG[tests] =3D "--enable-tests,,,"
-
 EXTRA_OECONF:class-target =3D "--with-dbus-binding-tool=3D${STAGING_BIND=
IR_NATIVE}/dbus-binding-tool"
 EXTRA_OECONF:class-nativesdk =3D "--with-dbus-binding-tool=3D${STAGING_B=
INDIR_NATIVE}/dbus-binding-tool"
=20
-PACKAGES +=3D "${PN}-tests ${PN}-tools"
+PACKAGES +=3D "${PN}-tools"
=20
 FILES:${PN} =3D "${libdir}/lib*${SOLIBS}"
 FILES:${PN}-bash-completion +=3D "${libexecdir}/dbus-bash-completion-hel=
per"
@@ -39,9 +33,6 @@ LICENSE:${PN}-bash-completion =3D "GPL-2.0-or-later"
=20
 RDEPENDS:${PN}-dev +=3D "${PN}-tools"
=20
-RDEPENDS:${PN}-tests =3D "${PN}"
-FILES:${PN}-tests =3D "${datadir}/${BPN}/tests"
-
 FILES:${PN}-tools =3D "${bindir}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


