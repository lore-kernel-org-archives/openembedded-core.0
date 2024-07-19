Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79494C3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 15:51:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21782.1721404313604371560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 08:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99F2C169E
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 08:52:18 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D51FB3F73F
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 08:51:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] pango: upgrade 1.52.2 -> 1.54.0
Date: Fri, 19 Jul 2024 16:51:50 +0100
Message-Id: <20240719155150.3250185-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 15:51:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202267

Upstream has removed installable tests, although there is pressure to
bring them back[1].

- Build fixes
- Memory leak fixes
- Drop the install-tests build option
- Add build-examples and build-tests build options
- Require meson 0.63
- Add pango_item_get_char_offset
- Update to Unicode 15.1
- Fix wrong use of GWeakRef, leading to crashes

[1] https://gitlab.gnome.org/GNOME/pango/-/issues/799

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 -
 .../0001-Skip-running-test-layout-test.patch  | 45 -------------------
 meta/recipes-graphics/pango/pango/run-ptest   |  6 ---
 .../{pango_1.52.2.bb =3D> pango_1.54.0.bb}      | 20 ++-------
 4 files changed, 3 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-graphics/pango/pango/0001-Skip-running-t=
est-layout-test.patch
 delete mode 100644 meta/recipes-graphics/pango/pango/run-ptest
 rename meta/recipes-graphics/pango/{pango_1.52.2.bb =3D> pango_1.54.0.bb=
} (68%)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index d7d711383c0..16d7b9e6b2c 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -53,7 +53,6 @@ PTESTS_FAST =3D "\
     m4 \
     nettle \
     opkg \
-    pango \
     popt \
     python3-atomicwrites \
     python3-attrs \
diff --git a/meta/recipes-graphics/pango/pango/0001-Skip-running-test-lay=
out-test.patch b/meta/recipes-graphics/pango/pango/0001-Skip-running-test=
-layout-test.patch
deleted file mode 100644
index ec7fb4727eb..00000000000
--- a/meta/recipes-graphics/pango/pango/0001-Skip-running-test-layout-tes=
t.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From b9bfe3a79f165682a6db3d7ee1928365e93b1ccf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 13 Apr 2022 19:39:29 -0700
-Subject: [PATCH] Skip running test-layout test
-
-This fails intermittently, it varies based on what version of harfbuzz
-is installed and if it does not match with what pango CI tests then we
-get random failures in this test. This has been disabled in other
-distros [1] too
-
-We want to drop this on next upgrade and see if this test passes if not
-then keep it disabled
-
-Fixes
-
-Running test: pango/test-layout.test
-1..36
-ok 1 /layout/letterspacing.layout
-ok 2 /layout/valid-7.layout
-not ok 3 /layout/valid-14.layout
-Bail out!
-FAIL: pango/test-layout.test (Child process killed by signal 6)
-
-[1] https://github.com/archlinux/svntogit-packages/commit/3f883e7ff8071a=
dad23b6bcc0ba4b995aff10d52
-
-Upstream-Status: Inappropriate [bugfix https://gitlab.gnome.org/GNOME/pa=
ngo/-/issues/677]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/test-layout.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/test-layout.c b/tests/test-layout.c
-index 1139e4f..b47a066 100644
---- a/tests/test-layout.c
-+++ b/tests/test-layout.c
-@@ -222,5 +222,5 @@ main (int argc, char *argv[])
-     }
-   g_dir_close (dir);
-=20
--  return g_test_run ();
-+  return 77;
- }
---=20
-2.35.2
-
diff --git a/meta/recipes-graphics/pango/pango/run-ptest b/meta/recipes-g=
raphics/pango/pango/run-ptest
deleted file mode 100644
index e1fab050ef9..00000000000
--- a/meta/recipes-graphics/pango/pango/run-ptest
+++ /dev/null
@@ -1,6 +0,0 @@
-#! /bin/sh
-
-# workaround for https://gitlab.gnome.org/GNOME/pango/-/issues/668
-mkdir -p /usr/share/fonts/pango-private
-cp -rf /usr/libexec/installed-tests/pango/fonts/* /usr/share/fonts/pango=
-private
-gnome-desktop-testing-runner pango
diff --git a/meta/recipes-graphics/pango/pango_1.52.2.bb b/meta/recipes-g=
raphics/pango/pango_1.54.0.bb
similarity index 68%
rename from meta/recipes-graphics/pango/pango_1.52.2.bb
rename to meta/recipes-graphics/pango/pango_1.54.0.bb
index 4f748e65540..de6f8bb3619 100644
--- a/meta/recipes-graphics/pango/pango_1.52.2.bb
+++ b/meta/recipes-graphics/pango/pango_1.54.0.bb
@@ -11,42 +11,28 @@ LICENSE =3D "LGPL-2.0-or-later"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f=
7e7"
=20
-
-inherit gnomebase gi-docgen ptest-gnome upstream-version-is-even gobject=
-introspection
+inherit gnomebase gi-docgen upstream-version-is-even gobject-introspecti=
on
=20
 UPSTREAM_CHECK_REGEX =3D "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
=20
 GIR_MESON_ENABLE_FLAG =3D "enabled"
 GIR_MESON_DISABLE_FLAG =3D "disabled"
=20
-SRC_URI +=3D "file://run-ptest \
-           file://0001-Skip-running-test-layout-test.patch \
-           "
-
-SRC_URI[archive.sha256sum] =3D "d0076afe01082814b853deec99f9349ece5f2ce8=
3908b8e58ff736b41f78a96b"
+SRC_URI[archive.sha256sum] =3D "8a9eed75021ee734d7fc0fdf3a65c3bba51dfefe=
4ae51a9b414a60c70b2d1ed8"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native fontconfig freetype virtual/libico=
nv cairo harfbuzz fribidi"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
-                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '=
', d)}"
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
=20
 PACKAGECONFIG[x11] =3D ",,virtual/libx11 libxft"
-PACKAGECONFIG[tests] =3D "-Dinstall-tests=3Dtrue, -Dinstall-tests=3Dfals=
e"
 PACKAGECONFIG[thai] =3D "-Dlibthai=3Denabled,-Dlibthai=3Ddisabled,libtha=
i"
=20
 GIR_MESON_OPTION =3D 'introspection'
=20
-do_configure:prepend() {
-	chmod +x ${S}/tests/*.py
-}
-
 LEAD_SONAME =3D "libpango-1.0*"
=20
 FILES:${PN} =3D "${bindir}/* ${libdir}/libpango*${SOLIBS}"
=20
-RDEPENDS:${PN}-ptest +=3D "cantarell-fonts"
-RDEPENDS:${PN}-ptest:append:libc-glibc =3D " locale-base-en-us"
-
 RPROVIDES:${PN} +=3D "pango-modules pango-module-indic-lang \
                     pango-module-basic-fc pango-module-arabic-lang"
=20
--=20
2.34.1


