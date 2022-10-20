Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3718AC4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 15:37:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11029.1666280239928669937
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Oct 2022 08:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FAF6ED1;
	Thu, 20 Oct 2022 08:37:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D844C3F67D;
	Thu, 20 Oct 2022 08:37:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2] glib-2.0: fix rare GFileInfo test case failure
Date: Thu, 20 Oct 2022 16:37:16 +0100
Message-Id: <20221020153716.1197617-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 15:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172002

If a access or creation timestamp has 0 microseconds, then the test
fails as it doesn't expect this to be a valid value.  Expand a previous
fix for modification times to cover these timestamps too.

[ YOCTO #14373 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-info-don-t-assume-million-in-one-ev.patch | 51 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-=
file-info-don-t-assume-million-in-one-ev.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-in=
fo-don-t-assume-million-in-one-ev.patch b/meta/recipes-core/glib-2.0/glib=
-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
new file mode 100644
index 00000000000..c33fa88a765
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-=
t-assume-million-in-one-ev.patch
@@ -0,0 +1,51 @@
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/merge_r=
equests/2990]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 14838522a706ebdcc3cdab661d4c368099fe3a4e Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 6 Jul 2021 19:26:03 +0100
+Subject: [PATCH] gio/tests/g-file-info: don't assume million-in-one even=
ts
+ don't happen
+
+The access and creation time tests create a file, gets the time in
+seconds, then gets the time in microseconds and assumes that the
+difference between the two has to be above 0.
+
+As rare as this may be, it can happen:
+
+$ stat g-file-info-test-50A450 -c %y
+2021-07-06 18:24:56.000000767 +0100
+
+Change the test to simply assert that the difference not negative to
+handle this case.
+
+This is the same fix as 289f8b, but that was just modification time.
+---
+ gio/tests/g-file-info.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gio/tests/g-file-info.c b/gio/tests/g-file-info.c
+index 59411c3a8..a213e4b92 100644
+--- a/gio/tests/g-file-info.c
++++ b/gio/tests/g-file-info.c
+@@ -239,7 +239,7 @@ test_g_file_info_access_time (void)
+   g_assert_nonnull (dt_usecs);
+=20
+   ts =3D g_date_time_difference (dt_usecs, dt);
+-  g_assert_cmpint (ts, >, 0);
++  g_assert_cmpint (ts, >=3D, 0);
+   g_assert_cmpint (ts, <, G_USEC_PER_SEC);
+=20
+   /* Try round-tripping the access time. */
+@@ -316,7 +316,7 @@ test_g_file_info_creation_time (void)
+   g_assert_nonnull (dt_usecs);
+=20
+   ts =3D g_date_time_difference (dt_usecs, dt);
+-  g_assert_cmpint (ts, >, 0);
++  g_assert_cmpint (ts, >=3D, 0);
+   g_assert_cmpint (ts, <, G_USEC_PER_SEC);
+=20
+   /* Try round-tripping the creation time. */
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.72.3.bb
index dd1ea508d2c..b5ab6502a38 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
+           file://0001-gio-tests-g-file-info-don-t-assume-million-in-one=
-ev.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch"
=20
--=20
2.34.1


