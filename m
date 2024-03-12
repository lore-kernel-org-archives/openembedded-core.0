Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C507C54E5D
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 05:22:06 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.1892.1710220921721241623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 22:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout07.t-online.de (Postfix) with SMTP id D55564AD07
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 06:21:59 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.43]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rjuaL-2MvcCf0; Tue, 12 Mar 2024 06:21:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv3 1/2] vala: merge bb and inc files
Date: Tue, 12 Mar 2024 06:22:06 +0100
Message-ID: <20240312052207.20685-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710220917-FCAAA990-8117738E/0/0 CLEAN NORMAL
X-TOI-MSGID: 505c355b-1b33-4680-8da9-2fa498df93b6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 05:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196969

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/vala/vala.inc        | 71 ---------------------
 meta/recipes-devtools/vala/vala_0.56.15.bb | 72 +++++++++++++++++++++-
 2 files changed, 71 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala.inc

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
diff --git a/meta/recipes-devtools/vala/vala_0.56.15.bb b/meta/recipes-de=
vtools/vala/vala_0.56.15.bb
index dc483b12ba..a8fdd0a97a 100644
--- a/meta/recipes-devtools/vala/vala_0.56.15.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.15.bb
@@ -1,3 +1,73 @@
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
+SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/$=
{BP}.tar.xz"
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
--=20
2.44.0


