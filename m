Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57A5C4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 13:07:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11043.1704892052810471271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 05:07:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E072C2F4
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 05:08:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C833E3F64C
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 05:07:31 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] glib-2.0: no need to depend on target gtk-doc
Date: Wed, 10 Jan 2024 13:07:22 +0000
Message-Id: <20240110130730.3698802-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 13:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193500

From: Ross Burton <ross.burton@arm.com>

The meson.build looks for a target gtk-doc, but it should be looking for
the native package.

Fixing this means we can drop the need for a target gtk-doc package.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../glib-2.0/glib-2.0/native-gtkdoc.patch     | 21 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb |  1 +
 meta/recipes-core/glib-2.0/glib.inc           |  2 --
 3 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.pat=
ch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch b/me=
ta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch
new file mode 100644
index 00000000000..f56c2b85640
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch
@@ -0,0 +1,21 @@
+docs/reference: depend on a native gtk-doc
+
+In a cross-compiled environment we don't need a target gtk-doc, but a
+native gtk-doc.
+
+Upstream-Status: Backport [f3ff370d1b24f8afb51cd4e865593d5b678188a9]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/docs/reference/meson.build b/docs/reference/meson.build
+index c417ffecb..67c1dda56 100644
+--- a/docs/reference/meson.build
++++ b/docs/reference/meson.build
+@@ -42,7 +42,7 @@ ignore_decorators =3D '|'.join(ignore_decorators)
+ if get_option('gtk_doc')
+   # Check we have the minimum gtk-doc version required. Older versions =
won't
+   # generate correct documentation.
+-  dependency('gtk-doc', version : '>=3D1.32.1',
++  dependency('gtk-doc', version : '>=3D1.32.1', native: true,
+     fallback : ['gtk-doc', 'dummy_dep'],
+     default_options : ['tests=3Dfalse'])
+=20
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.78.3.bb
index 13d4b38e22e..2729b2a5963 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
+           file://native-gtkdoc.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \=20
                                 file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index eb292c51d44..ae6fc519922 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -30,8 +30,6 @@ LEAD_SONAME =3D "libglib-2.0.*"
=20
 inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-=
even bash-completion gio-module-cache manpages
=20
-DEPENDS:append:class-target =3D "${@' gtk-doc' if d.getVar('GTKDOC_ENABL=
ED') =3D=3D 'True' else ''}"
-
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
 S =3D "${WORKDIR}/glib-${PV}"
--=20
2.34.1


