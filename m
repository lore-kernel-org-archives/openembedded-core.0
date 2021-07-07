Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18670.1625648664295873668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 02:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AA9FED1
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jul 2021 02:04:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B78A43F694
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jul 2021 02:04:22 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-2.0: fix g-file-into modification time test
Date: Wed,  7 Jul 2021 10:04:14 +0100
Message-Id: <20210707090414.2896696-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The GFileInfo modification time test assumed that the difference between
a modification timestamp in seconds and in microseconds must be greater
than 0.

Mathmatically, there's a one-in-a-million chance that it will be 0.  It
turns out that one-in-a-million chances happen approximately once every
fortnight on the autobuilder.

[ YOCTO 14373 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../glib-2.0/glib-2.0/time-test.patch         | 40 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/time-test.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/time-test.patch b/meta/r=
ecipes-core/glib-2.0/glib-2.0/time-test.patch
new file mode 100644
index 00000000000..4d7ef97bb56
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/time-test.patch
@@ -0,0 +1,40 @@
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_=
requests/2177]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 289f8be1b397a453cfcf35641455f3ae5fb4faeb Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 6 Jul 2021 19:26:03 +0100
+Subject: [PATCH] gio/tests/g-file-info: don't assume million-in-one even=
ts
+ don't happen
+
+The modification time test creates a file, gets the modification time in
+seconds, then gets the modification time in microseconds and assumes
+that the difference between the two has to be above 0.
+
+As rare as this may be, it can happen:
+
+$ stat g-file-info-test-50A450 -c %y
+2021-07-06 18:24:56.000000767 +0100
+
+Change the test to simply assert that the difference not negative to
+handle this case.
+---
+ gio/tests/g-file-info.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gio/tests/g-file-info.c b/gio/tests/g-file-info.c
+index c11c50462..fd0c64b55 100644
+--- a/gio/tests/g-file-info.c
++++ b/gio/tests/g-file-info.c
+@@ -178,7 +178,7 @@ test_g_file_info_modification_time (void)
+   g_assert_nonnull (dt_usecs);
+=20
+   ts =3D g_date_time_difference (dt_usecs, dt);
+-  g_assert_cmpint (ts, >, 0);
++  g_assert_cmpint (ts, >=3D, 0);
+   g_assert_cmpint (ts, <, G_USEC_PER_SEC);
+=20
+   /* Try round-tripping the modification time. */
+--=20
+2.25.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.68.3.bb
index 2a3a00fadae..62c8d49464f 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
            file://0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.=
patch \
+           file://time-test.patch \
            "
 SRC_URI_append_class-native =3D " file://relocate-modules.patch"
=20
--=20
2.25.1

