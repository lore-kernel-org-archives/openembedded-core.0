Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8136BD75E26
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 11:05:05 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.21479.1732273503777798341
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 03:05:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout05.t-online.de (Postfix) with SMTP id 8A28EAB4
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 12:05:00 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.36.225]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tERT7-3TgfPl0; Fri, 22 Nov 2024 12:04:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] libsecret: add pam support depending on DISTRO_FEATURE
Date: Fri, 22 Nov 2024 12:04:48 +0100
Message-ID: <20241122110448.2060-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1732273497-EEFED6C2-3BE1B286/0/0 CLEAN NORMAL
X-TOI-MSGID: 2d6a041f-b1b7-4a4a-97e9-de20d39a7528
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 11:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207599

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libsecret/0001-pam-disable-tests.patch    | 71 +++++++++++++++++++
 .../libsecret/libsecret_0.21.4.bb             |  3 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-gnome/libsecret/libsecret/0001-pam-disab=
le-tests.patch

diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-pam-disable-test=
s.patch b/meta/recipes-gnome/libsecret/libsecret/0001-pam-disable-tests.p=
atch
new file mode 100644
index 0000000000..b7ef6662bc
--- /dev/null
+++ b/meta/recipes-gnome/libsecret/libsecret/0001-pam-disable-tests.patch
@@ -0,0 +1,71 @@
+From a028d36dc7b8d0bc33e674d2a0427b171aef2d32 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Wed, 20 Nov 2024 16:30:07 +0100
+Subject: [PATCH] pam/meson.build: disable tests
+
+Otherwise a recipe for pam_wrapper would be required:
+https://gitlab.com/cwrap/pam_wrapper
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ pam/meson.build | 42 +++++++++++++++++++++---------------------
+ 1 file changed, 21 insertions(+), 21 deletions(-)
+
+diff --git a/pam/meson.build b/pam/meson.build
+index 8413b58..06d41c4 100644
+--- a/pam/meson.build
++++ b/pam/meson.build
+@@ -19,27 +19,27 @@ pam_gnome_keyring =3D shared_library('pam_gnome_keyr=
ing',
+ )
+=20
+ # pam tests
+-pam_wrapper =3D dependency('pam_wrapper', required: true)
+-libpamtest =3D dependency('libpamtest', required: true)
++#pam_wrapper =3D dependency('pam_wrapper', required: true)
++#libpamtest =3D dependency('libpamtest', required: true)
+=20
+-subdir('servicedir')
++#subdir('servicedir')
+=20
+-test_bin =3D executable('pam_test',
+-  sources: [
+-    'test-pam.c',
+-  ],
+-  dependencies: [
+-    libpamtest,
+-    glib_deps,
+-  ],
+-)
++#test_bin =3D executable('pam_test',
++#  sources: [
++#    'test-pam.c',
++#  ],
++#  dependencies: [
++#    libpamtest,
++#    glib_deps,
++#  ],
++#)
+=20
+-test('pam-test',
+-  test_bin,
+-  env: {
+-    'LD_PRELOAD': 'libpam_wrapper.so',
+-    'PAM_WRAPPER': '1',
+-    'PAM_WRAPPER_DEBUGLEVEL': '5',
+-    'PAM_WRAPPER_SERVICE_DIR': meson.current_build_dir() + '/servicedir=
',
+-  },
+-)
++#test('pam-test',
++#  test_bin,
++#  env: {
++#    'LD_PRELOAD': 'libpam_wrapper.so',
++#    'PAM_WRAPPER': '1',
++#    'PAM_WRAPPER_DEBUGLEVEL': '5',
++#    'PAM_WRAPPER_SERVICE_DIR': meson.current_build_dir() + '/servicedi=
r',
++#  },
++#)
+--=20
+2.47.0
+
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb b/meta/reci=
pes-gnome/libsecret/libsecret_0.21.4.bb
index 88c3c73510..1bdd26d500 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
@@ -13,11 +13,14 @@ inherit gnomebase gi-docgen vala gobject-introspectio=
n manpages
=20
 DEPENDS +=3D "glib-2.0 libgcrypt gettext-native"
=20
+SRC_URI +=3D "file://0001-pam-disable-tests.patch"
 SRC_URI[archive.sha256sum] =3D "163d08d783be6d4ab9a979ceb5a4fecbc1d9660d=
3c34168c581301cd53912b20"
=20
 GTKDOC_MESON_OPTION =3D 'gtk_doc'
=20
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[manpages] =3D "-Dmanpage=3Dtrue,-Dmanpage=3Dfalse,libxslt-=
native xmlto-native"
+PACKAGECONFIG[pam] =3D "-Dpam=3Dtrue,-Dpam=3Dfalse,libpam"
=20
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET:armv4 =3D "arm"
--=20
2.47.0


