Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DB2C46467
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 03:50:31 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.13753.1673063426787706574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 19:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout07.t-online.de (Postfix) with SMTP id A4DB11B1A3
	for <openembedded-core@lists.openembedded.org>; Sat,  7 Jan 2023 04:50:24 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.225]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pE0Dj-1ZigZl0; Sat, 7 Jan 2023 04:50:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv4] gcr3: update 3.40.0 -> 3.41.1
Date: Sat,  7 Jan 2023 04:50:02 +0100
Message-Id: <20230107035002.1701343-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673063411-C9488B6F-F70D437A/0/0 CLEAN NORMAL
X-TOI-MSGID: df8978c9-4630-4928-b242-889fe6d80478
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 03:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175613

 - remove unneded backport patches
 - partly import the patch to fix ssh_agent option from gcr4 recipe
 - convert from gtk-doc to gi-docgen

gcr 3.41.1:
- meson: Fix unknown kw argument in gnome.generate_gir [GNOME/gcr!68]
- gcr: Add G_SPAWN_CLOEXEC_PIPES flag to all the g_spawn commands
- docs: Port from gtk-doc to gi-docgen [GNOME/gcr!76]
- Unbreak build without systemd [GNOME/gcr!75]
- Several CI fixes
- Updated translations

gcr 3.41.0:
- Port ssh-agent from gnome-keyring [GNOME/gcr!67]
- build: Fix parallel build failure due to missing marshal dependency [GN=
OME/gcr!68]
- Fix warnings by dropping `volatile` for g_once_init_inter locations [GN=
OME/gcr!69]
- tests: More robust against GTask unref race condition [GNOME/gcr!72,GNO=
ME/gcr#84]
- Updated translations

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...build-fix-one-parallel-build-failure.patch | 37 -----------
 ...ectly-handle-disabled-ssh_agent-opti.patch | 36 +++++++++++
 ...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch | 61 -------------------
 .../gcr/{gcr3_3.40.0.bb =3D> gcr3_3.41.1.bb}    | 19 +++---
 4 files changed, 48 insertions(+), 105 deletions(-)
 delete mode 100644 meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-=
one-parallel-build-failure.patch
 create mode 100644 meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctl=
y-handle-disabled-ssh_agent-opti.patch
 delete mode 100644 meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aea=
d164d7c8ce2c4d8.patch
 rename meta/recipes-gnome/gcr/{gcr3_3.40.0.bb =3D> gcr3_3.41.1.bb} (63%)

diff --git a/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-par=
allel-build-failure.patch b/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.bu=
ild-fix-one-parallel-build-failure.patch
deleted file mode 100644
index 81c4bdbbcc..0000000000
--- a/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-b=
uild-failure.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From cb3708bad88e713e4ccf705cb8c14c5996cd9d06 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 23 Apr 2021 16:32:38 +0800
-Subject: [PATCH] gcr/meson.build: fix one parallel build failure
-
-ui/gcr-live-search.c includes gcr/gcr-marshal.h. Because missing
-dependency, following error occurred intermittently during doing paralle=
l
-build:
-
- -o ui/libgcr-ui-3.so.1.0.0.p/gcr-live-search.c.o -c ../gcr-3.38.1/ui/gc=
r-live-search.c
-../gcr-3.38.1/ui/gcr-live-search.c:32:10: fatal error: gcr/gcr-marshal.h=
: No such file or directory
-   32 | #include "gcr/gcr-marshal.h"
-      |          ^~~~~~~~~~~~~~~~~~~
-compilation terminated.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gcr/-/merge_r=
equests/68/diffs]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- gcr/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gcr/meson.build b/gcr/meson.build
-index 06c3a63..d9d4b8f 100644
---- a/gcr/meson.build
-+++ b/gcr/meson.build
-@@ -181,6 +181,7 @@ gcr_base_dep =3D declare_dependency(
-   sources: [
-     gcr_enums_gen[1],
-     gcr_oids[1],
-+    gcr_marshal_gen[1],
-   ],
- )
-=20
---=20
-2.17.1
-
diff --git a/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handl=
e-disabled-ssh_agent-opti.patch b/meta/recipes-gnome/gcr/gcr3/0001-meson.=
build-correctly-handle-disabled-ssh_agent-opti.patch
new file mode 100644
index 0000000000..d3c26d97ae
--- /dev/null
+++ b/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disab=
led-ssh_agent-opti.patch
@@ -0,0 +1,36 @@
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
diff --git a/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c=
8ce2c4d8.patch b/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead16=
4d7c8ce2c4d8.patch
deleted file mode 100644
index ae4e2ac1eb..0000000000
--- a/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d=
8.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8 Mon Sep 17 00:00:00 2001
-From: Jakub Jirutka <jakub@jirutka.cz>
-Date: Wed, 12 Jan 2022 00:24:20 +0100
-Subject: [PATCH] meson: Fix unknown kw argument in gnome.generate_gir
-
-This argument has been removed in Meson 0.61.0:
-
-    gck/meson.build:130:2: ERROR: gnome.generate_gir got unknown keyword=
 arguments "packages"
-
-https://github.com/mesonbuild/meson/commit/f8fc5cb860465718fe7c79a1bf1fe=
00659f138de:
-
-> The packages argument to gnome.generate_gir was allowed, but never did=
 anything, so stop passing it.
-
-Fixes #89
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gck/meson.build | 1 -
- gcr/meson.build | 1 -
- ui/meson.build  | 1 -
- 3 files changed, 3 deletions(-)
-
-diff --git a/gck/meson.build b/gck/meson.build
-index 756b486..a21a1e9 100644
---- a/gck/meson.build
-+++ b/gck/meson.build
-@@ -131,7 +131,6 @@ if get_option('introspection')
-     sources: gck_gir_sources,
-     namespace: 'Gck',
-     nsversion: '@0@'.format(gck_major_version),
--    packages: gck_deps,
-     export_packages: 'gck-@0@'.format(gck_major_version),
-     includes: [ 'GObject-2.0', 'Gio-2.0' ],
-     header: 'gck/gck.h',
-diff --git a/gcr/meson.build b/gcr/meson.build
-index 2233a44..c83641b 100644
---- a/gcr/meson.build
-+++ b/gcr/meson.build
-@@ -190,7 +190,6 @@ if get_option('introspection')
-     sources: [ gcr_base_public_sources, gcr_base_headers ],
-     namespace: 'Gcr',
-     nsversion: '@0@'.format(gcr_major_version),
--    packages: gcr_base_deps,
-     export_packages: 'gcr-base-@0@'.format(gcr_major_version),
-     includes: [
-       'GObject-2.0',
-diff --git a/ui/meson.build b/ui/meson.build
-index e656ea2..32ee057 100644
---- a/ui/meson.build
-+++ b/ui/meson.build
-@@ -152,7 +152,6 @@ if get_option('introspection')
-     export_packages: 'gcr-ui-@0@'.format(gcr_major_version),
-     identifier_prefix: 'Gcr',
-     symbol_prefix: 'gcr',
--    packages: gcr_ui_deps,
-     includes: [
-       'GObject-2.0',
-       'Gio-2.0',
---=20
-GitLab
-
diff --git a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb b/meta/recipes-gnome/g=
cr/gcr3_3.41.1.bb
similarity index 63%
rename from meta/recipes-gnome/gcr/gcr3_3.40.0.bb
rename to meta/recipes-gnome/gcr/gcr3_3.41.1.bb
index 8d0f1e972a..ba5660a5ed 100644
--- a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
+++ b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
@@ -17,27 +17,30 @@ CFLAGS +=3D "-D_GNU_SOURCE"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
 GTKDOC_MESON_OPTION =3D "gtk_doc"
-inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version=
-is-even vala gobject-introspection gettext mime mime-xdg
+inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-versi=
on-is-even vala gobject-introspection gettext mime mime-xdg
 UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>3.(?!9\d+)\d+(\.\d+)+)\.tar"
=20
-SRC_URI =3D " \
-	https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=3Darc=
hive \
-	file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch \
-	file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
-
-SRC_URI[archive.sha256sum] =3D "b9d3645a5fd953a54285cc64d4fc046736463dbd=
4dcc25caf5c7b59bed3027f5"
+SRC_URI =3D "https://download.gnome.org/sources/gcr/3.41/gcr-${PV}.tar.x=
z;name=3Darchive"
+SRC_URI +=3D "file://0001-meson.build-correctly-handle-disabled-ssh_agen=
t-opti.patch"
+SRC_URI[archive.sha256sum] =3D "bb7128a3c2febbfee9c03b90d77d498d0ceb237b=
0789802d60185c71c4bea24f"
=20
 S =3D "${WORKDIR}/gcr-${PV}"
=20
 PACKAGECONFIG ??=3D " \
+	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
 "
 PACKAGECONFIG[gtk] =3D "-Dgtk=3Dtrue,-Dgtk=3Dfalse,gtk+3"
+PACKAGECONFIG[ssh_agent] =3D "-Dssh_agent=3Dtrue,-Dssh_agent=3Dfalse,lib=
secret,openssh"
+#'Use systemd socket activation for server programs'
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
     ${datadir}/gcr-3 \
+    ${systemd_user_unitdir}/gcr-ssh-agent.socket \
+    ${systemd_user_unitdir}/gcr-ssh-agent.service \
 "
=20
 # http://errors.yoctoproject.org/Errors/Details/20229/
@@ -50,5 +53,7 @@ do_write_config:append() {
     cat >${WORKDIR}/meson-${PN}.cross <<EOF
 [binaries]
 gpg2 =3D '${bindir}/gpg2'
+ssh-add =3D '${bindir}/ssh-add'
+ssh-agent =3D '${bindir}/ssh-agent'
 EOF
 }
--=20
2.34.1


