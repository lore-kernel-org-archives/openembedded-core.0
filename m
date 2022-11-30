Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A4DC352A1
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 05:35:20 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.3895.1669786511615912053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 21:35:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout11.t-online.de (Postfix) with SMTP id 36BDCC1F3
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 06:35:10 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.245]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p0FkQ-0QHosG0; Wed, 30 Nov 2022 06:35:06 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv8 4/4] gcr: add recipe for gcr-4, needed to build with gtk4
Date: Wed, 30 Nov 2022 06:34:50 +0100
Message-Id: <20221130053450.95655-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130053450.95655-1-f_l_k@t-online.de>
References: <20221130053450.95655-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669786506-E77DC07E-37124A8B/0/0 CLEAN NORMAL
X-TOI-MSGID: aa81c71b-8bf0-4cae-b61a-c65dc26c0853
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 05:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173992

gcr-3 recipe is still needed for gnome projects that stick to gtk+3, rena=
me to gcr3.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-add-options-to-set-ssh-binary-paths.patch | 60 +++++++++++++++++++
 ...ectly-handle-disabled-ssh_agent-opti.patch | 49 +++++++++++++++
 ...build-fix-one-parallel-build-failure.patch |  0
 ...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch |  0
 .../gcr/{gcr_3.40.0.bb =3D> gcr3_3.40.0.bb}     |  8 ++-
 meta/recipes-gnome/gcr/gcr_4.0.0.bb           | 51 ++++++++++++++++
 6 files changed, 166 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson-add-options-to-=
set-ssh-binary-paths.patch
 create mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly=
-handle-disabled-ssh_agent-opti.patch
 rename meta/recipes-gnome/gcr/{gcr =3D> gcr3}/0001-gcr-meson.build-fix-o=
ne-parallel-build-failure.patch (100%)
 rename meta/recipes-gnome/gcr/{gcr =3D> gcr3}/b3ca1d02bb0148ca787ac4aead=
164d7c8ce2c4d8.patch (100%)
 rename meta/recipes-gnome/gcr/{gcr_3.40.0.bb =3D> gcr3_3.40.0.bb} (87%)
 create mode 100644 meta/recipes-gnome/gcr/gcr_4.0.0.bb

diff --git a/meta/recipes-gnome/gcr/gcr/0001-meson-add-options-to-set-ssh=
-binary-paths.patch b/meta/recipes-gnome/gcr/gcr/0001-meson-add-options-t=
o-set-ssh-binary-paths.patch
new file mode 100644
index 0000000000..cd3552464a
--- /dev/null
+++ b/meta/recipes-gnome/gcr/gcr/0001-meson-add-options-to-set-ssh-binary=
-paths.patch
@@ -0,0 +1,60 @@
+From 89992bde916fe53dd737a5d678bc66dd51cd1f45 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 28 Nov 2022 15:47:50 +0100
+Subject: [PATCH] meson: add options to set ssh binary paths
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Submitted [ https://gitlab.gnome.org/GNOME/gcr/-/merge_=
requests/115/diffs?commit_id=3Df19dfa4fe0986f3f75b29f9c05cead59fe87cd19 ]
+---
+ meson.build       | 11 +++++++++--
+ meson_options.txt | 10 ++++++++++
+ 2 files changed, 19 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 11d7fa7..231d7e2 100644
+--- a/meson.build
++++ b/meson.build
+@@ -58,9 +58,16 @@ if p11_system_config_modules =3D=3D ''
+   error('Couldn\'t find location for pkcs11 module config')
+ endif
+ libsecret_dep =3D dependency('libsecret-1', version: '>=3D 0.20', requi=
red: get_option('ssh_agent'))
++
+ if get_option('ssh_agent')
+-  ssh_add_path =3D find_program('ssh-add').full_path()
+-  ssh_agent_path =3D find_program('ssh-agent').full_path()
++  ssh_add_path =3D get_option('ssh_add_path')
++  ssh_agent_path =3D get_option('ssh_agent_path')
++  if ssh_add_path =3D=3D ''
++    ssh_add_path =3D find_program('ssh-add').full_path()
++  endif
++  if ssh_agent_path =3D=3D ''
++    ssh_agent_path =3D find_program('ssh-agent').full_path()
++  endif
+ endif
+=20
+ with_systemd =3D false
+diff --git a/meson_options.txt b/meson_options.txt
+index 6840e44..5355940 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -23,6 +23,16 @@ option('gpg_path',
+   value: '',
+   description: 'Path to gpg, autodetected if not set',
+ )
++option('ssh_add_path',
++  type: 'string',
++  value: '',
++  description: 'Path to ssh-add, autodetected if not set',
++)
++option('ssh_agent_path',
++  type: 'string',
++  value: '',
++  description: 'Path to ssh-agent, autodetected if not set',
++)
+ option('ssh_agent',
+   type: 'boolean',
+   value: true,
+--=20
+2.34.1
+
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
diff --git a/meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-para=
llel-build-failure.patch b/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.bui=
ld-fix-one-parallel-build-failure.patch
similarity index 100%
rename from meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-paral=
lel-build-failure.patch
rename to meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parall=
el-build-failure.patch
diff --git a/meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8=
ce2c4d8.patch b/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164=
d7c8ce2c4d8.patch
similarity index 100%
rename from meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8c=
e2c4d8.patch
rename to meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce=
2c4d8.patch
diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gc=
r/gcr3_3.40.0.bb
similarity index 87%
rename from meta/recipes-gnome/gcr/gcr_3.40.0.bb
rename to meta/recipes-gnome/gcr/gcr3_3.40.0.bb
index 917be5938b..5318768db6 100644
--- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
+++ b/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
@@ -20,11 +20,15 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
 inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version=
-is-even vala gobject-introspection gettext mime mime-xdg
 UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\=
d+)+)\.tar"
=20
-SRC_URI +=3D "file://0001-gcr-meson.build-fix-one-parallel-build-failure=
.patch \=20
-            file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
+SRC_URI =3D " \
+	https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=3Darc=
hive \
+	file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch \
+	file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
=20
 SRC_URI[archive.sha256sum] =3D "b9d3645a5fd953a54285cc64d4fc046736463dbd=
4dcc25caf5c7b59bed3027f5"
=20
+S =3D "${WORKDIR}/gcr-${PV}"
+
 PACKAGECONFIG ??=3D " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb b/meta/recipes-gnome/gcr=
/gcr_4.0.0.bb
new file mode 100644
index 0000000000..ff2f7978a9
--- /dev/null
+++ b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
@@ -0,0 +1,51 @@
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
+inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version=
-is-even vala gobject-introspection gettext mime mime-xdg
+UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\=
d+)+)\.tar"
+
+SRC_URI +=3D " \
+	file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch =
\
+	file://0001-meson-add-options-to-set-ssh-binary-paths.patch \
+"
+SRC_URI[archive.sha256sum] =3D "c45855924f0ee7bab43e2dd38bfafd2ac815c6e9=
864341c0161e171173dcec7c"
+
+PACKAGECONFIG ??=3D " \
+	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
+"
+PACKAGECONFIG[gtk] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
+PACKAGECONFIG[ssh_agent] =3D "-Dssh_agent=3Dtrue -Dssh_add_path=3D${bind=
ir}/ssh-add -Dssh_agent_path=3D${bindir}/ssh-agent,-Dssh_agent=3Dfalse,li=
bsecret,openssh"
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
+EXTRA_OEMESON +=3D "-Dgpg_path=3D${bindir}/gpg2"
--=20
2.34.1


