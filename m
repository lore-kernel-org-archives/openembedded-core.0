Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3BDC4167B
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 06:57:47 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.7270.1670569066593871581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 22:57:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id D9A241F4AA
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Dec 2022 07:57:44 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.94]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3XKK-4EnnxS0; Fri, 9 Dec 2022 07:57:44 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 2/2] gcr: add recipe for gcr-4, needed to build with gtk4
Date: Fri,  9 Dec 2022 07:57:33 +0100
Message-Id: <20221209065733.1113310-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209065733.1113310-1-f_l_k@t-online.de>
References: <20221209065733.1113310-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670569064-69DEC991-CEFFB6A0/0/0 CLEAN NORMAL
X-TOI-MSGID: 5527ca87-9935-4b18-ba9d-a7012461d773
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 06:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174432

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ectly-handle-disabled-ssh_agent-opti.patch | 49 ++++++++++++++++
 meta/recipes-gnome/gcr/gcr_4.0.0.bb           | 57 +++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly=
-handle-disabled-ssh_agent-opti.patch
 create mode 100644 meta/recipes-gnome/gcr/gcr_4.0.0.bb

diff --git a/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-handle=
-disabled-ssh_agent-opti.patch b/meta/recipes-gnome/gcr/gcr/0001-meson.bu=
ild-correctly-handle-disabled-ssh_agent-opti.patch
new file mode 100644
index 0000000000..940f78ebab
--- /dev/null
+++ b/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-handle-disabl=
ed-ssh_agent-opti.patch
@@ -0,0 +1,49 @@
+From 9b67bb18d8409e0e693cc6000507acbd73a30eab Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 16 Nov 2022 11:27:24 +0100
+Subject: [PATCH 1/2] meson.build: correctly handle disabled ssh_agent op=
tion
+
+Existing code produces these errors:
+| gcr/meson.build:61:0: ERROR: Unable to get the path of a not-found ext=
ernal program
+| gcr/meson.build:101:5: ERROR: Unknown variable "ssh_add_path".
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/gcr/-/commit/=
9b67bb18d8409e0e693cc6000507acbd73a30eab ]
+---
+ meson.build | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 3f35173..11d7fa7 100644
+--- a/meson.build
++++ b/meson.build
+@@ -58,8 +58,10 @@ if p11_system_config_modules =3D=3D ''
+   error('Couldn\'t find location for pkcs11 module config')
+ endif
+ libsecret_dep =3D dependency('libsecret-1', version: '>=3D 0.20', requi=
red: get_option('ssh_agent'))
+-ssh_add_path =3D find_program('ssh-add', required: get_option('ssh_agen=
t')).full_path()
+-ssh_agent_path =3D find_program('ssh-agent', required: get_option('ssh_=
agent')).full_path()
++if get_option('ssh_agent')
++  ssh_add_path =3D find_program('ssh-add').full_path()
++  ssh_agent_path =3D find_program('ssh-agent').full_path()
++endif
+=20
+ with_systemd =3D false
+ libsystemd_deps =3D []
+@@ -96,8 +98,10 @@ conf.set('HAVE_TIMEGM', cc.has_function('timegm'))
+ conf.set('HAVE_MLOCK', cc.has_function('mlock'))
+ conf.set_quoted('GPG_EXECUTABLE', gpg_path)
+ conf.set_quoted('LIBGCRYPT_VERSION', libgcrypt_dep.version())
+-conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
+-conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
++if get_option('ssh_agent')
++  conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
++  conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
++endif
+ conf.set10('WITH_SYSTEMD', with_systemd)
+ config_file =3D configure_file(
+   output: 'config.h',
+--=20
+2.34.1
+
diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb b/meta/recipes-gnome/gcr=
/gcr_4.0.0.bb
new file mode 100644
index 0000000000..264069ffd1
--- /dev/null
+++ b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
@@ -0,0 +1,57 @@
+SUMMARY =3D "A library for bits of crypto UI and parsing etc"
+DESCRIPTION =3D "GCR is a library for displaying certificates, and crypt=
o UI, \
+accessing key stores. It also provides the viewer for crypto files on th=
e \
+GNOME desktop."
+HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/gcr"
+BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gcr/issues"
+
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
+
+DEPENDS =3D "p11-kit glib-2.0 libgcrypt gnupg-native \
+           ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-nati=
ve', '', d)}"
+
+CACHED_CONFIGUREVARS +=3D "ac_cv_path_GPG=3D'gpg2'"
+
+CFLAGS +=3D "-D_GNU_SOURCE"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+GTKDOC_MESON_OPTION =3D "gtk_doc"
+inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-versi=
on-is-even vala gobject-introspection gettext mime mime-xdg
+UPSTREAM_CHECK_REGEX =3D "gcr-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
+
+SRC_URI +=3D "file://0001-meson.build-correctly-handle-disabled-ssh_agen=
t-opti.patch"
+SRC_URI[archive.sha256sum] =3D "c45855924f0ee7bab43e2dd38bfafd2ac815c6e9=
864341c0161e171173dcec7c"
+
+PACKAGECONFIG ??=3D " \
+	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
+"
+PACKAGECONFIG[gtk] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
+PACKAGECONFIG[ssh_agent] =3D "-Dssh_agent=3Dtrue,-Dssh_agent=3Dfalse,lib=
secret,openssh"
+#'Use systemd socket activation for server programs'
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
+
+FILES:${PN} +=3D " \
+    ${datadir}/dbus-1 \
+    ${datadir}/gcr-4 \
+    ${systemd_user_unitdir}/gcr-ssh-agent.socket \
+    ${systemd_user_unitdir}/gcr-ssh-agent.service \
+"
+
+# http://errors.yoctoproject.org/Errors/Details/20229/
+ARM_INSTRUCTION_SET:armv4 =3D "arm"
+ARM_INSTRUCTION_SET:armv5 =3D "arm"
+ARM_INSTRUCTION_SET:armv6 =3D "arm"
+
+EXTRA_OEMESON +=3D "--cross-file=3D${WORKDIR}/meson-${PN}.cross"
+
+do_write_config:append() {
+    cat >${WORKDIR}/meson-${PN}.cross <<EOF
+[binaries]
+gpg2 =3D '${bindir}/gpg2'
+ssh-add =3D '${bindir}/ssh-add'
+ssh-agent =3D '${bindir}/ssh-agent'
+EOF
+}
--=20
2.34.1


