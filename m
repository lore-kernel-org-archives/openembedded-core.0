Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F48C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 07:21:17 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.56912.1710141670644156748
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 00:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout11.t-online.de (Postfix) with SMTP id AF94096F7
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 08:21:08 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.172.233]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rjZy7-29izbd0; Mon, 11 Mar 2024 08:21:07 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] vala: fix for gtk4 prior to 4.14
Date: Mon, 11 Mar 2024 08:21:25 +0100
Message-ID: <20240311072125.214522-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710141667-2F7FDC95-AB5E5100/0/0 CLEAN NORMAL
X-TOI-MSGID: 7e3cd410-dfd6-4f84-8a02-67751b06853b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 07:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196918

- add a backport patch to fix compatibility with older gtk4 versions
- merge .bb and .inc

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/vala/vala.inc           | 71 -----------------
 ...tk4-Preserve-compatibility-with-4.14.patch | 39 ++++++++++
 meta/recipes-devtools/vala/vala_0.56.15.bb    | 76 ++++++++++++++++++-
 3 files changed, 114 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala.inc
 create mode 100644 meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-co=
mpatibility-with-4.14.patch

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/=
vala/vala.inc
deleted file mode 100644
index 0177e86240..0000000000
--- a/meta/recipes-devtools/vala/vala.inc
+++ /dev/null
@@ -1,71 +0,0 @@
-SUMMARY =3D "C#-like programming language for easing GObject programming=
"
-HOMEPAGE =3D "http://vala-project.org"
-DESCRIPTION =3D "Vala is a C#-like language dedicated to ease GObject pr=
ogramming. \
-Vala compiles to plain C and has no runtime environment nor penalities w=
hatsoever."
-SECTION =3D "devel"
-DEPENDS =3D "bison-native flex-native glib-2.0 gobject-introspection"
-
-# Appending libxslt-native to dependencies has an effect
-# of rebuilding the manual, which is very slow. Let's do this
-# only when api-documentation distro feature is enabled.
-DEPENDS:append:class-target =3D " ${@bb.utils.contains('DISTRO_FEATURES'=
, 'api-documentation', 'libxslt-native', '', d)}"
-
-# vala-native contains a native version of vapigen, which we use instead=
 of the target one
-DEPENDS:append:class-target =3D " vala-native"
-BBCLASSEXTEND =3D "native"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
-
-SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
.')[1]}"
-
-SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/$=
{BP}.tar.xz"
-inherit autotools pkgconfig upstream-version-is-even
-
-FILES:${PN} +=3D "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${=
SHRT_VER}/"
-FILES:${PN}-doc +=3D "${datadir}/devhelp"
-
-# .gir files from gobject-introspection are installed to ${libdir} when =
multilib is enabled
-GIRDIR_OPT =3D "${@'--girdir=3D${STAGING_LIBDIR}/gir-1.0' if d.getVar('M=
ULTILIBS') else ''}"
-
-do_configure:prepend:class-target() {
-        # Write out a vapigen wrapper that will be provided by pkg-confi=
g file installed in target sysroot
-        # The wrapper will call a native vapigen
-        cat > ${B}/vapigen-wrapper << EOF
-#!/bin/sh
-vapigen-${SHRT_VER} ${GIRDIR_OPT} "\$@"
-EOF
-        chmod +x ${B}/vapigen-wrapper
-}
-
-EXTRA_OECONF +=3D " --disable-valadoc"
-
-# Vapigen wrapper needs to be available system-wide, because it will be =
used
-# to build vapi files from all other packages with vala support
-do_install:append:class-target() {
-        install -d ${D}${bindir_crossscripts}/
-        install ${B}/vapigen-wrapper ${D}${bindir_crossscripts}/
-}
-
-# Put vapigen wrapper into target sysroot so that it can be used when bu=
ilding
-# vapi files.
-SYSROOT_DIRS +=3D "${bindir_crossscripts}"
-
-inherit multilib_script
-MULTILIB_SCRIPTS =3D "${PN}:${bindir}/vala-gen-introspect-0.56"
-
-SYSROOT_PREPROCESS_FUNCS:append:class-target =3D " vapigen_sysroot_prepr=
ocess"
-vapigen_sysroot_preprocess() {
-        # Tweak the vapigen name in the vapigen pkgconfig file, so that =
it picks
-        # up our wrapper.
-        sed -i \
-           -e "s|vapigen=3D.*|vapigen=3D${bindir_crossscripts}/vapigen-w=
rapper|" \
-           ${SYSROOT_DESTDIR}${libdir}/pkgconfig/vapigen-${SHRT_VER}.pc
-}
-
-SSTATE_SCAN_FILES +=3D "vapigen-wrapper"
-
-PACKAGE_PREPROCESS_FUNCS +=3D "vala_package_preprocess"
-
-vala_package_preprocess () {
-	rm -rf ${PKGD}${bindir_crossscripts}
-}
diff --git a/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibi=
lity-with-4.14.patch b/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve=
-compatibility-with-4.14.patch
new file mode 100644
index 0000000000..161474086e
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-wi=
th-4.14.patch
@@ -0,0 +1,39 @@
+From 17349020fb95454d06f827fd555b05248f10a370 Mon Sep 17 00:00:00 2001
+From: Rico Tzschichholz <ricotz@ubuntu.com>
+Date: Thu, 7 Mar 2024 17:56:05 +0100
+Subject: [PATCH] gtk4: Preserve compatibility with < 4.14
+
+Don't prefer new accessor methods for Calendar.day/month/year
+
+Fixes https://gitlab.gnome.org/GNOME/vala/issues/1531
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/vala/-/commit/=
e0c4ea8c4a0bbf859b5341a7465b395892789d9e]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ vapi/gtk4.vapi                 | 3 +++
+ vapi/metadata/Gtk-4.0.metadata | 5 +++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/vapi/gtk4.vapi b/vapi/gtk4.vapi
+index 49f8b2078..51ecea27d 100644
+--- a/vapi/gtk4.vapi
++++ b/vapi/gtk4.vapi
+@@ -7350,11 +7350,14 @@ namespace Gtk {
+ 		[Version (since =3D "4.14")]
+ 		public void set_year (int year);
+ 		public void unmark_day (uint day);
++		[NoAccessorMethod]
+ 		public int day { get; set; }
++		[NoAccessorMethod]
+ 		public int month { get; set; }
+ 		public bool show_day_names { get; set; }
+ 		public bool show_heading { get; set; }
+ 		public bool show_week_numbers { get; set; }
++		[NoAccessorMethod]
+ 		public int year { get; set; }
+ 		public signal void day_selected ();
+ 		public signal void next_month ();
+--=20
+2.44.0
+
diff --git a/meta/recipes-devtools/vala/vala_0.56.15.bb b/meta/recipes-de=
vtools/vala/vala_0.56.15.bb
index dc483b12ba..1f55689c45 100644
--- a/meta/recipes-devtools/vala/vala_0.56.15.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.15.bb
@@ -1,3 +1,77 @@
-require ${BPN}.inc
+SUMMARY =3D "C#-like programming language for easing GObject programming=
"
+HOMEPAGE =3D "http://vala-project.org"
+DESCRIPTION =3D "Vala is a C#-like language dedicated to ease GObject pr=
ogramming. \
+Vala compiles to plain C and has no runtime environment nor penalities w=
hatsoever."
+SECTION =3D "devel"
+DEPENDS =3D "bison-native flex-native glib-2.0 gobject-introspection"
=20
+# Appending libxslt-native to dependencies has an effect
+# of rebuilding the manual, which is very slow. Let's do this
+# only when api-documentation distro feature is enabled.
+DEPENDS:append:class-target =3D " ${@bb.utils.contains('DISTRO_FEATURES'=
, 'api-documentation', 'libxslt-native', '', d)}"
+
+# vala-native contains a native version of vapigen, which we use instead=
 of the target one
+DEPENDS:append:class-target =3D " vala-native"
+BBCLASSEXTEND =3D "native"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
+
+SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
.')[1]}"
+
+SRC_URI =3D " \
+	http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz =
\
+	file://0001-gtk4-Preserve-compatibility-with-4.14.patch \
+"
 SRC_URI[sha256sum] =3D "535b6452ed310fd5fb5c7dd6794b6213dac3b48e645e5bff=
3173741ec2cb3f2b"
+
+inherit autotools pkgconfig upstream-version-is-even
+
+FILES:${PN} +=3D "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${=
SHRT_VER}/"
+FILES:${PN}-doc +=3D "${datadir}/devhelp"
+
+# .gir files from gobject-introspection are installed to ${libdir} when =
multilib is enabled
+GIRDIR_OPT =3D "${@'--girdir=3D${STAGING_LIBDIR}/gir-1.0' if d.getVar('M=
ULTILIBS') else ''}"
+
+do_configure:prepend:class-target() {
+        # Write out a vapigen wrapper that will be provided by pkg-confi=
g file installed in target sysroot
+        # The wrapper will call a native vapigen
+        cat > ${B}/vapigen-wrapper << EOF
+#!/bin/sh
+vapigen-${SHRT_VER} ${GIRDIR_OPT} "\$@"
+EOF
+        chmod +x ${B}/vapigen-wrapper
+}
+
+EXTRA_OECONF +=3D " --disable-valadoc"
+
+# Vapigen wrapper needs to be available system-wide, because it will be =
used
+# to build vapi files from all other packages with vala support
+do_install:append:class-target() {
+        install -d ${D}${bindir_crossscripts}/
+        install ${B}/vapigen-wrapper ${D}${bindir_crossscripts}/
+}
+
+# Put vapigen wrapper into target sysroot so that it can be used when bu=
ilding
+# vapi files.
+SYSROOT_DIRS +=3D "${bindir_crossscripts}"
+
+inherit multilib_script
+MULTILIB_SCRIPTS =3D "${PN}:${bindir}/vala-gen-introspect-0.56"
+
+SYSROOT_PREPROCESS_FUNCS:append:class-target =3D " vapigen_sysroot_prepr=
ocess"
+vapigen_sysroot_preprocess() {
+        # Tweak the vapigen name in the vapigen pkgconfig file, so that =
it picks
+        # up our wrapper.
+        sed -i \
+           -e "s|vapigen=3D.*|vapigen=3D${bindir_crossscripts}/vapigen-w=
rapper|" \
+           ${SYSROOT_DESTDIR}${libdir}/pkgconfig/vapigen-${SHRT_VER}.pc
+}
+
+SSTATE_SCAN_FILES +=3D "vapigen-wrapper"
+
+PACKAGE_PREPROCESS_FUNCS +=3D "vala_package_preprocess"
+
+vala_package_preprocess () {
+	rm -rf ${PKGD}${bindir_crossscripts}
+}
+
--=20
2.44.0


