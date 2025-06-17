Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02998C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 14:17:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20198.1750169815384930561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 07:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D155F1595
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 07:16:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A85F3F58B
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 07:16:54 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libcheck: disable subunit support
Date: Tue, 17 Jun 2025 15:16:48 +0100
Message-ID: <20250617141649.378910-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617141649.378910-1-ross.burton@arm.com>
References: <20250617141649.378910-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218880

We don't have a recipe for subunit in core (or any layer in the layer
index), and unfortunately a bug in the CMakeLists means that the native
build can detect subunit on the host (so host contamination) and only
half-enable it, so the build fails.

Take a patch from upstream's github to add an option for subunit, and
explicitly disable it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libcheck/libcheck/subunit.patch           | 43 +++++++++++++++++++
 .../libcheck/libcheck_0.15.2.bb               |  5 ++-
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libcheck/libcheck/subunit.patch

diff --git a/meta/recipes-support/libcheck/libcheck/subunit.patch b/meta/=
recipes-support/libcheck/libcheck/subunit.patch
new file mode 100644
index 00000000000..29c4b156011
--- /dev/null
+++ b/meta/recipes-support/libcheck/libcheck/subunit.patch
@@ -0,0 +1,43 @@
+From a6cd376b9ebcb4afc9ab06bce23b9bd909811ece Mon Sep 17 00:00:00 2001
+From: Christopher Obbard <christopher.obbard@linaro.org>
+Date: Thu, 13 Jun 2024 09:49:53 +0100
+Subject: [PATCH] Allow disabling autodetection of subunit library
+
+It can be useful to avoid linking to subunit when we are building the ch=
eck
+library for the host, e.g. in a buildroot recipe, where the built check =
is
+linked into other applications which are used on the host to build image=
s.
+
+These applications are built with the host's cross-compiler and can use
+the host's pkgconfig to determine if libraries are available. When check
+is linked against other libraries, it can fail this check for subunit.
+
+Allow disabling the autodetection of subunit with a configure flag
+-DENABLE_SUBUNIT_EXT=3DOFF
+
+Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
+
+Upstream-Status: Submitted [https://github.com/libcheck/check/pull/353/]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ CMakeLists.txt | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2ee580bc..6b36015b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -393,7 +393,13 @@ if (HAVE_LIBRT)
+   ADD_DEFINITIONS(-DHAVE_LIBRT=3D1)
+ endif (HAVE_LIBRT)
+=20
+-check_library_exists(subunit subunit_test_start "" HAVE_SUBUNIT)
++# Allow disabling subunit
++IF(ENABLE_SUBUNIT_EXT)
++  check_library_exists(subunit subunit_test_start "" HAVE_SUBUNIT)
++ELSE(ENABLE_SUBUNIT_EXT)
++  set(HAVE_SUBUNIT, false)
++ENDIF(ENABLE_SUBUNIT_EXT)
++
+ if (HAVE_SUBUNIT)
+   set(SUBUNIT "subunit")
+   set(ENABLE_SUBUNIT 1)
diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/reci=
pes-support/libcheck/libcheck_0.15.2.bb
index ea0453a1667..2e56a1ab00c 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -11,7 +11,8 @@ LICENSE  =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D2d5025d4aa3495befef8f1=
7206a5b0a1"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/check-${PV}.tar.gz \
-           file://automake-output.patch"
+           file://automake-output.patch \
+           file://subunit.patch"
 SRC_URI[sha256sum] =3D "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d88=
35eb1a52932fa20a"
 GITHUB_BASE_URI =3D "https://github.com/libcheck/check/releases/"
=20
@@ -22,6 +23,7 @@ inherit cmake pkgconfig texinfo github-releases
 RREPLACES:${PN} =3D "check (<=3D 0.9.5)"
=20
 EXTRA_OECMAKE:append:class-target =3D " -DAWK_PATH=3D${bindir}/awk"
+EXTRA_OECMAKE =3D "-DENABLE_SUBUNIT_EXT=3DOFF"
=20
 do_install:append:class-native() {
     create_cmdline_shebang_wrapper ${D}${bindir}/checkmk
@@ -34,4 +36,3 @@ PACKAGES =3D+ "checkmk"
 FILES:checkmk =3D "${bindir}/checkmk"
=20
 RDEPENDS:checkmk =3D "gawk"
-
--=20
2.43.0


