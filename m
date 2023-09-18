Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF777C46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 12:57:24 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.50462.1695041843653163661
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 05:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout04.t-online.de (Postfix) with SMTP id AF0ED1C66
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 14:57:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiDoX-3f8wk50; Mon, 18 Sep 2023 14:57:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] libxmlb: import recipe from meta-oe
Date: Mon, 18 Sep 2023 14:57:09 +0200
Message-ID: <20230918125709.2016399-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695041841-46FF85E3-F3DCA677/0/0 CLEAN NORMAL
X-TOI-MSGID: 057eb201-c91d-4cd8-9e24-8df2bd04c7b4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 12:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187833

appstream has a dependency on it

- add a patch to fix a reproducibility and runtime issue with ptest
  ptest completes without error
- add the recipe to ptest-packagelists.inc

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 35 +++++++++++++++++++
 meta/recipes-gnome/libxmlb/libxmlb/run-ptest  |  3 ++
 meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb  | 25 +++++++++++++
 4 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c=
-hardcode-G_TEST_SRCDIR.patch
 create mode 100644 meta/recipes-gnome/libxmlb/libxmlb/run-ptest
 create mode 100644 meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index e023891b7b..d5f41a995e 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -47,6 +47,7 @@ PTESTS_FAST =3D "\
     libxml-sax-base-perl \
     libxml-simple-perl \
     libxml2 \
+    libxmlb \
     logrotate \
     lua \
     lzo \
diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardco=
de-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selft=
est.c-hardcode-G_TEST_SRCDIR.patch
new file mode 100644
index 0000000000..da8ce68df9
--- /dev/null
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TE=
ST_SRCDIR.patch
@@ -0,0 +1,35 @@
+From dc208bafc57c1ccaa0ca260f99c8b4c976271ebc Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sat, 16 Sep 2023 14:02:57 +0200
+Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
+
+This avoids:
+ libxmlb-0.3.14-r0 do_package_qa: QA Issue: File
+ /usr/libexec/installed-tests/libxmlb/xb-self-test in package libxmlb-pt=
est
+ contains reference to TMPDIR [buildpaths]
+
+and also fixes the runtime for the ptest.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ src/xb-self-test.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/xb-self-test.c b/src/xb-self-test.c
+index 47d9728..8b3dd0e 100644
+--- a/src/xb-self-test.c
++++ b/src/xb-self-test.c
+@@ -2870,7 +2870,7 @@ xb_speed_func(void)
+ int
+ main(int argc, char **argv)
+ {
+-	g_setenv("G_TEST_SRCDIR", SRCDIR, FALSE);
++	g_setenv("G_TEST_SRCDIR", "/usr/libexec/installed-tests/libxmlb", FALS=
E);
+=20
+ 	g_test_init(&argc, &argv, NULL);
+=20
+--=20
+2.41.0
+
diff --git a/meta/recipes-gnome/libxmlb/libxmlb/run-ptest b/meta/recipes-=
gnome/libxmlb/libxmlb/run-ptest
new file mode 100644
index 0000000000..6d0bb95d3a
--- /dev/null
+++ b/meta/recipes-gnome/libxmlb/libxmlb/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner libxmlb
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb b/meta/recipes-=
gnome/libxmlb/libxmlb_0.3.14.bb
new file mode 100644
index 0000000000..1d3b0de29a
--- /dev/null
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "A library to help create and query binary XML blobs"
+HOMEPAGE =3D "https://github.com/hughsie/libxmlb"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d75310=
742"
+
+SRC_URI =3D " \
+	git://github.com/hughsie/libxmlb.git;branch=3Dmain;protocol=3Dhttps \
+	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
+	file://run-ptest \
+"
+SRCREV =3D "aa577b276adc66564f5777f9a522ca3bf0bfa65e"
+S =3D "${WORKDIR}/git"
+
+DEPENDS =3D "glib-2.0 xz zstd"
+
+inherit gobject-introspection gtk-doc meson ptest-gnome lib_package pkgc=
onfig
+
+PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',=
 '', d)}"
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
+
+GTKDOC_MESON_OPTION =3D "gtkdoc"
+
+FILES:${PN} +=3D "${datadir}"
+
+BBCLASSEXTEND =3D "native"
--=20
2.41.0


