Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B27E7716C
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 10:46:52 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.8038.1733395608389704630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 02:46:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout09.t-online.de (Postfix) with SMTP id 9844D4A8
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Dec 2024 11:46:45 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.36.186]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tJ9Nc-2eMZST0; Thu, 5 Dec 2024 11:46:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv3] libsecret: add pam support depending on DISTRO_FEATURES
Date: Thu,  5 Dec 2024 11:46:41 +0100
Message-ID: <20241205104641.3358-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1733395605-0D7F99BF-70C0F1E8/0/0 CLEAN NORMAL
X-TOI-MSGID: 6b1988df-4faf-43a9-b29d-a4af08cc1be8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 10:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208375

pam module has been ported from gnome-keyring to libsecret
[https://gitlab.gnome.org/GNOME/libsecret/-/commit/9a37dc839a9be1670afeb6=
47d9f82b6ef1cd0893]

Add a PACKAGECONFIG for pam and enable it if pam is in DISTRO_FEATURES

Add a patch that adds an option to disables the pam test, because it woul=
d require
pam_wrapper recipe
[https://gitlab.com/cwrap/pam_wrapper]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...eson-add-option-to-disable-pam-tests.patch | 80 +++++++++++++++++++
 .../libsecret/libsecret_0.21.4.bb             |  5 ++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-gnome/libsecret/libsecret/0001-meson-add=
-option-to-disable-pam-tests.patch

diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option=
-to-disable-pam-tests.patch b/meta/recipes-gnome/libsecret/libsecret/0001=
-meson-add-option-to-disable-pam-tests.patch
new file mode 100644
index 0000000000..87ab8a32cd
--- /dev/null
+++ b/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-dis=
able-pam-tests.patch
@@ -0,0 +1,80 @@
+From b90ecbdb4b91961a77a7cbb3a9b6a57128e2194b Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 3 Dec 2024 15:58:17 +0100
+Subject: [PATCH] meson: add option to disable pam tests
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsecret/-/m=
erge_requests/151/commits]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson_options.txt |  1 +
+ pam/meson.build   | 44 +++++++++++++++++++++++---------------------
+ 2 files changed, 24 insertions(+), 21 deletions(-)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index 936eff8..8fa2a4e 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -8,3 +8,4 @@ option('bashcompdir', type: 'string', value: '', descrip=
tion: 'Override default
+ option('bash_completion', type: 'feature', value: 'auto', description: =
'Install bash completion files')
+ option('tpm2', type: 'boolean', value: false, description: 'With TPM2 S=
oftware Stack')
+ option('pam', type: 'boolean', value: false, description: 'Build PAM mo=
dule')
++option('pam-tests', type: 'boolean', value: true, description: 'Build P=
AM Tests')
+diff --git a/pam/meson.build b/pam/meson.build
+index 8413b58..5155329 100644
+--- a/pam/meson.build
++++ b/pam/meson.build
+@@ -19,27 +19,29 @@ pam_gnome_keyring =3D shared_library('pam_gnome_keyr=
ing',
+ )
+=20
+ # pam tests
+-pam_wrapper =3D dependency('pam_wrapper', required: true)
+-libpamtest =3D dependency('libpamtest', required: true)
++if get_option('pam-tests')
++  pam_wrapper =3D dependency('pam_wrapper', required: true)
++  libpamtest =3D dependency('libpamtest', required: true)
+=20
+-subdir('servicedir')
++  subdir('servicedir')
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
++  test_bin =3D executable('pam_test',
++    sources: [
++      'test-pam.c',
++    ],
++    dependencies: [
++      libpamtest,
++      glib_deps,
++    ],
++  )
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
++  test('pam-test',
++    test_bin,
++    env: {
++      'LD_PRELOAD': 'libpam_wrapper.so',
++      'PAM_WRAPPER': '1',
++      'PAM_WRAPPER_DEBUGLEVEL': '5',
++      'PAM_WRAPPER_SERVICE_DIR': meson.current_build_dir() + '/serviced=
ir',
++    },
++  )
++endif
+--=20
+2.47.0
+
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb b/meta/reci=
pes-gnome/libsecret/libsecret_0.21.4.bb
index 88c3c73510..d356681252 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
@@ -13,11 +13,16 @@ inherit gnomebase gi-docgen vala gobject-introspectio=
n manpages
=20
 DEPENDS +=3D "glib-2.0 libgcrypt gettext-native"
=20
+SRC_URI +=3D "file://0001-meson-add-option-to-disable-pam-tests.patch"
 SRC_URI[archive.sha256sum] =3D "163d08d783be6d4ab9a979ceb5a4fecbc1d9660d=
3c34168c581301cd53912b20"
=20
+EXTRA_OEMESON +=3D "-Dpam-tests=3Dfalse"
+
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


