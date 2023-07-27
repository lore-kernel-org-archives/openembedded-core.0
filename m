Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5D0C001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 11:38:29 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.5232.1690457906624541418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 04:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout02.t-online.de (Postfix) with SMTP id 931AC1AE85
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 13:38:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.239.8]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qOzK0-1rnVvF0; Thu, 27 Jul 2023 13:38:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gcr3: remove recipe
Date: Thu, 27 Jul 2023 13:38:07 +0200
Message-Id: <20230727113807.4743-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1690457900-998269C6-2F8FFDCC/0/0 CLEAN NORMAL
X-TOI-MSGID: c47abcd3-a670-4536-b890-629d56563158
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 11:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184929

It will be added to meta-gnome

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 ...ectly-handle-disabled-ssh_agent-opti.patch | 36 -----------
 meta/recipes-gnome/gcr/gcr3_3.41.1.bb         | 59 -------------------
 3 files changed, 96 deletions(-)
 delete mode 100644 meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctl=
y-handle-disabled-ssh_agent-opti.patch
 delete mode 100644 meta/recipes-gnome/gcr/gcr3_3.41.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 17f038c71e..f058647ce5 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -189,7 +189,6 @@ RECIPE_MAINTAINER:pn-gcc-runtime =3D "Khem Raj <raj.k=
hem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-source-13.1.1 =3D "Khem Raj <raj.khem@gmail.com=
>"
 RECIPE_MAINTAINER:pn-gconf =3D "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-gcr3 =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-gcr =3D "Alexander Kanavin <alex.kanavin@gmail.com>=
"
 RECIPE_MAINTAINER:pn-gdb =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gdb-cross-${TARGET_ARCH} =3D "Khem Raj <raj.khem@gm=
ail.com>"
diff --git a/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handl=
e-disabled-ssh_agent-opti.patch b/meta/recipes-gnome/gcr/gcr3/0001-meson.=
build-correctly-handle-disabled-ssh_agent-opti.patch
deleted file mode 100644
index d3c26d97ae..0000000000
--- a/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disab=
led-ssh_agent-opti.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9b67bb18d8409e0e693cc6000507acbd73a30eab Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 16 Nov 2022 11:27:24 +0100
-Subject: [PATCH 1/2] meson.build: correctly handle disabled ssh_agent op=
tion
-
-Existing code produces these errors:
-| gcr/meson.build:61:0: ERROR: Unable to get the path of a not-found ext=
ernal program
-| gcr/meson.build:101:5: ERROR: Unknown variable "ssh_add_path".
-
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
-Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/gcr/-/commit/=
9b67bb18d8409e0e693cc6000507acbd73a30eab ]
----
- meson.build | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 3f35173..11d7fa7 100644
---- a/meson.build
-+++ b/meson.build
-@@ -96,8 +98,10 @@ conf.set('HAVE_TIMEGM', cc.has_function('timegm'))
- conf.set('HAVE_MLOCK', cc.has_function('mlock'))
- conf.set_quoted('GPG_EXECUTABLE', gpg_path)
- conf.set_quoted('LIBGCRYPT_VERSION', libgcrypt_dep.version())
--conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
--conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
-+if get_option('ssh_agent')
-+  conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
-+  conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
-+endif
- conf.set10('WITH_SYSTEMD', with_systemd)
- config_file =3D configure_file(
-   output: 'config.h',
---=20
-2.34.1
-
diff --git a/meta/recipes-gnome/gcr/gcr3_3.41.1.bb b/meta/recipes-gnome/g=
cr/gcr3_3.41.1.bb
deleted file mode 100644
index ba5660a5ed..0000000000
--- a/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
+++ /dev/null
@@ -1,59 +0,0 @@
-SUMMARY =3D "A library for bits of crypto UI and parsing etc"
-DESCRIPTION =3D "GCR is a library for displaying certificates, and crypt=
o UI, \
-accessing key stores. It also provides the viewer for crypto files on th=
e \
-GNOME desktop."
-HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/gcr"
-BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gcr/issues"
-
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
-
-DEPENDS =3D "p11-kit glib-2.0 libgcrypt gnupg-native \
-           ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-nati=
ve', '', d)}"
-
-CACHED_CONFIGUREVARS +=3D "ac_cv_path_GPG=3D'gpg2'"
-
-CFLAGS +=3D "-D_GNU_SOURCE"
-
-GNOMEBASEBUILDCLASS =3D "meson"
-GTKDOC_MESON_OPTION =3D "gtk_doc"
-inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-versi=
on-is-even vala gobject-introspection gettext mime mime-xdg
-UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>3.(?!9\d+)\d+(\.\d+)+)\.tar"
-
-SRC_URI =3D "https://download.gnome.org/sources/gcr/3.41/gcr-${PV}.tar.x=
z;name=3Darchive"
-SRC_URI +=3D "file://0001-meson.build-correctly-handle-disabled-ssh_agen=
t-opti.patch"
-SRC_URI[archive.sha256sum] =3D "bb7128a3c2febbfee9c03b90d77d498d0ceb237b=
0789802d60185c71c4bea24f"
-
-S =3D "${WORKDIR}/gcr-${PV}"
-
-PACKAGECONFIG ??=3D " \
-	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
-"
-PACKAGECONFIG[gtk] =3D "-Dgtk=3Dtrue,-Dgtk=3Dfalse,gtk+3"
-PACKAGECONFIG[ssh_agent] =3D "-Dssh_agent=3Dtrue,-Dssh_agent=3Dfalse,lib=
secret,openssh"
-#'Use systemd socket activation for server programs'
-PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
-
-FILES:${PN} +=3D " \
-    ${datadir}/dbus-1 \
-    ${datadir}/gcr-3 \
-    ${systemd_user_unitdir}/gcr-ssh-agent.socket \
-    ${systemd_user_unitdir}/gcr-ssh-agent.service \
-"
-
-# http://errors.yoctoproject.org/Errors/Details/20229/
-ARM_INSTRUCTION_SET:armv4 =3D "arm"
-ARM_INSTRUCTION_SET:armv5 =3D "arm"
-ARM_INSTRUCTION_SET:armv6 =3D "arm"
-
-EXTRA_OEMESON +=3D "--cross-file ${WORKDIR}/meson-${PN}.cross"
-do_write_config:append() {
-    cat >${WORKDIR}/meson-${PN}.cross <<EOF
-[binaries]
-gpg2 =3D '${bindir}/gpg2'
-ssh-add =3D '${bindir}/ssh-add'
-ssh-agent =3D '${bindir}/ssh-agent'
-EOF
-}
--=20
2.39.3


