Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8532CE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:03:24 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.33235.1695200596645657538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 02:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout04.t-online.de (Postfix) with SMTP id 87D0A20568
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 11:03:13 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.179]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qit72-0ws7CD0; Wed, 20 Sep 2023 11:03:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv3] vte: upgrade 2.72.2 -> 2.74.0
Date: Wed, 20 Sep 2023 11:03:10 +0200
Message-ID: <20230920090312.2496296-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1695200592-82FEBF2D-1407CB21/0/0 CLEAN NORMAL
X-TOI-MSGID: 04e3d781-cb95-4f23-9713-40e823561711
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 09:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187899

Rework recipe

- remove legacy of the autotools buildsystem
- build	vapi dependent on gi-data
- docs require gir, add	a EXTRA_OEMESON:append to avoid	fail in
  a combination	where docs=3Dtrue	and gir=3Dfalse
- gtk+3 and gtk4 are requested by default-> add gtk4 dependency
- allow to build gtk4-nativesdk
- install systemd support files	depending on DISTRO_FEATURE
- update 0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/gtk4_4.12.1.bb        |  2 +-
 .../xorg-lib/libxkbcommon_1.5.0.bb            |  2 +-
 .../xorg-lib/xkeyboard-config_2.39.bb         |  2 +-
 ...EXITCODE-macro-for-non-glibc-systems.patch | 35 ++++++++-----------
 .../vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb}      | 24 ++++---------
 5 files changed, 24 insertions(+), 41 deletions(-)
 rename meta/recipes-support/vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb} (64%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.12.1.bb
index aa7115b11e..29adee4adf 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
@@ -47,7 +47,7 @@ inherit meson gettext pkgconfig gi-docgen update-altern=
atives gsettings features
 # gobject-introspection.bbclass pins introspection off for nativesk. As =
long as
 # we do not remove this wisdom or hack gtk4, it is not possible to build
 # nativesdk-gtk4
-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"
=20
 GSETTINGS_PACKAGE:class-native =3D ""
=20
diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb b/meta/=
recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
index 62e9b158e4..09da677de4 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
@@ -35,6 +35,6 @@ python populate_packages:prepend () {
 # xkbcommon: ERROR: couldn't find a Compose file for locale "C"
 RDEPENDS:${PN} =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx=
11-locale', 'libx11-compose-data', d)}"
=20
-BBCLASSEXTEND +=3D "native"
+BBCLASSEXTEND +=3D "native nativesdk"
=20
 CVE_PRODUCT +=3D "xkbcommon:libxkbcommon"
diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb b/me=
ta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb
index 4795464ac0..8a87d49399 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb
@@ -29,4 +29,4 @@ do_install:append () {
     cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
 }
=20
-BBCLASSEXTEND +=3D "native"
+BBCLASSEXTEND +=3D "native nativesdk"
diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-n=
on-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE=
-macro-for-non-glibc-systems.patch
index b4100fc381..8934d5f80a 100644
--- a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glib=
c-systems.patch
+++ b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glib=
c-systems.patch
@@ -11,32 +11,25 @@ Upstream-Status: Submitted [1]
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
=20
 [1] https://gitlab.gnome.org/GNOME/vte/issues/72
-
 ---
- src/missing.hh | 4 ++++
- src/widget.cc  | 1 +
- 2 files changed, 5 insertions(+)
+ src/widget.cc  | 4 +++
+ 1 files changed, 4 insertions(+)
=20
---- a/src/missing.hh
-+++ b/src/missing.hh
-@@ -24,6 +24,10 @@
- #define NSIG (8 * sizeof(sigset_t))
- #endif
+diff --git a/src/widget.cc b/src/widget.cc
+index 07f7cabf..31a77f68 100644
+--- a/src/widget.cc
++++ b/src/widget.cc
+@@ -16,6 +16,10 @@
+  * along with this library.  If not, see <https://www.gnu.org/licenses/=
>.
+  */
 =20
 +#ifndef W_EXITCODE
 +#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
 +#endif
 +
- #ifndef HAVE_FDWALK
- int fdwalk(int (*cb)(void* data, int fd),
-            void* data);
---- a/src/widget.cc
-+++ b/src/widget.cc
-@@ -21,6 +21,7 @@
- #include "widget.hh"
-=20
- #include <sys/wait.h> // for W_EXITCODE
-+#include "missing.hh" // for W_EXITCODE on non-glibc systems
+ #include "config.h"
 =20
- #include <exception>
- #include <new>
+ #include "widget.hh"
+--=20
+2.42.0
+
diff --git a/meta/recipes-support/vte/vte_0.72.2.bb b/meta/recipes-suppor=
t/vte/vte_0.74.0.bb
similarity index 64%
rename from meta/recipes-support/vte/vte_0.72.2.bb
rename to meta/recipes-support/vte/vte_0.74.0.bb
index 4249b75ac0..74574d3684 100644
--- a/meta/recipes-support/vte/vte_0.72.2.bb
+++ b/meta/recipes-support/vte/vte_0.74.0.bb
@@ -11,38 +11,28 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING.XTERM;md5=3Dd7fc3a23c16c039afafe2e042030f057 \
 "
=20
-DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gper=
f-native icu"
+DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 gtk4 libpcre2 libxml2-native=
 gperf-native icu"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
 GIR_MESON_OPTION =3D 'gir'
 GIDOCGEN_MESON_OPTION =3D "docs"
=20
-inherit gnomebase gi-docgen features_check upstream-version-is-even gobj=
ect-introspection
+inherit gnomebase gi-docgen features_check upstream-version-is-even gobj=
ect-introspection vala
=20
-# vapigen.m4 is required when vala is not present (but the one from vala=
 should be used normally)
 SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.pat=
ch"
-SRC_URI[archive.sha256sum] =3D "f7966fd185a6981f53964162b71cfef7e6064951=
55d6f5827b72aa0dd6741c9e"
+SRC_URI[archive.sha256sum] =3D "9ae08f777952ba793221152d360550451580f42d=
3b570e3341ebb6841984c76b"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-# Help g-ir-scanner find the .so for linking
-do_compile:prepend() {
-    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
-}
+EXTRA_OEMESON +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dv=
api=3Dtrue', '-Dvapi=3Dfalse', d)}"
+EXTRA_OEMESON:append =3D " ${@bb.utils.contains('GI_DATA_ENABLED', 'Fals=
e', '-Ddocs=3Dfalse', '', d)}"
=20
-# Package additional files
-FILES:${PN}-dev +=3D "${datadir}/vala/vapi/*"
-
-PACKAGECONFIG ??=3D "gnutls"
-PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse,vala-native vala"
+PACKAGECONFIG ??=3D "gnutls ${@bb.utils.filter('DISTRO_FEATURES', 'syste=
md', d)}"
 PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
 PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,systemd=
"
-# vala requires gir
-PACKAGECONFIG:remove:class-native =3D "vala"
-
-CFLAGS +=3D "-D_GNU_SOURCE"
=20
 PACKAGES =3D+ "libvte ${PN}-prompt"
+FILES:${PN} +=3D"${systemd_user_unitdir}"
 FILES:libvte =3D "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
 FILES:${PN}-prompt =3D " \
     ${sysconfdir}/profile.d \
--=20
2.42.0


