Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD42C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 15:20:28 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.935.1683040821205506487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 08:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id 90BFC3858
	for <openembedded-core@lists.openembedded.org>; Tue,  2 May 2023 17:20:19 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.42.41]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ptrnf-0KPC1S0; Tue, 2 May 2023 17:20:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 2/2] gcr: update 4.0.0 -> 4.1.0
Date: Tue,  2 May 2023 17:20:08 +0200
Message-Id: <20230502152008.113566-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502152008.113566-1-f_l_k@t-online.de>
References: <20230502152008.113566-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683040819-977FDC52-C275FCAE/0/0 CLEAN NORMAL
X-TOI-MSGID: 98f5cff3-8b2d-4e3f-8610-7a79481ccf15
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 15:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180745

 - remove backported patch

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ectly-handle-disabled-ssh_agent-opti.patch | 49 -------------------
 .../gcr/{gcr_4.0.0.bb =3D> gcr_4.1.0.bb}        |  3 +-
 2 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly=
-handle-disabled-ssh_agent-opti.patch
 rename meta/recipes-gnome/gcr/{gcr_4.0.0.bb =3D> gcr_4.1.0.bb} (92%)

diff --git a/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-handle=
-disabled-ssh_agent-opti.patch b/meta/recipes-gnome/gcr/gcr/0001-meson.bu=
ild-correctly-handle-disabled-ssh_agent-opti.patch
deleted file mode 100644
index 940f78ebab..0000000000
--- a/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-handle-disabl=
ed-ssh_agent-opti.patch
+++ /dev/null
@@ -1,49 +0,0 @@
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
-@@ -58,8 +58,10 @@ if p11_system_config_modules =3D=3D ''
-   error('Couldn\'t find location for pkcs11 module config')
- endif
- libsecret_dep =3D dependency('libsecret-1', version: '>=3D 0.20', requi=
red: get_option('ssh_agent'))
--ssh_add_path =3D find_program('ssh-add', required: get_option('ssh_agen=
t')).full_path()
--ssh_agent_path =3D find_program('ssh-agent', required: get_option('ssh_=
agent')).full_path()
-+if get_option('ssh_agent')
-+  ssh_add_path =3D find_program('ssh-add').full_path()
-+  ssh_agent_path =3D find_program('ssh-agent').full_path()
-+endif
-=20
- with_systemd =3D false
- libsystemd_deps =3D []
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
diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb b/meta/recipes-gnome/gcr=
/gcr_4.1.0.bb
similarity index 92%
rename from meta/recipes-gnome/gcr/gcr_4.0.0.bb
rename to meta/recipes-gnome/gcr/gcr_4.1.0.bb
index 7821e31b52..0cc466b614 100644
--- a/meta/recipes-gnome/gcr/gcr_4.0.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.1.0.bb
@@ -22,8 +22,7 @@ UPSTREAM_CHECK_REGEX =3D "gcr-(?P<pver>\d+\.(\d*[02468]=
)+(\.\d+)+)\.tar.xz"
=20
 REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x=
11', 'opengl', '', d)}"
=20
-SRC_URI +=3D "file://0001-meson.build-correctly-handle-disabled-ssh_agen=
t-opti.patch"
-SRC_URI[archive.sha256sum] =3D "c45855924f0ee7bab43e2dd38bfafd2ac815c6e9=
864341c0161e171173dcec7c"
+SRC_URI[archive.sha256sum] =3D "9ceaad29284ba919b9216e2888c18ec67240c2c9=
3b3a4856bc5488bbc1f3a383"
=20
 PACKAGECONFIG ??=3D " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
--=20
2.34.1


