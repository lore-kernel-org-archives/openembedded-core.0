Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D88AC35278
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web08.19563.1649611745328690196
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 10:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout12.t-online.de (Postfix) with SMTP id 687DF1F4F6
	for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 19:29:03 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.32.43]) by fwd86.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ndbMz-06ZnWr0; Sun, 10 Apr 2022 19:29:01 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] glib-networking: build with gnutls support
Date: Sun, 10 Apr 2022 19:28:52 +0200
Message-Id: <20220410172852.4136-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1649611741-000116DC-B2E0FA31/0/0 CLEAN NORMAL
X-TOI-MSGID: 4cb9b035-fe32-4a40-aeee-1e3181f1b003
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164204

this fixes authentication issues with geary and tls connection

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/glib-networking/glib-networking_2.72.0.bb | 2 +-
 meta/recipes-support/gnutls/gnutls_3.7.4.bb                 | 2 +-
 meta/recipes-support/p11-kit/p11-kit_0.24.1.bb              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
index d578f17aa5..73827b0a85 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
@@ -11,7 +11,7 @@ DEPENDS =3D "glib-2.0"
=20
 SRC_URI[archive.sha256sum] =3D "100aaebb369285041de52da422b6b716789d5e4d=
7549a3a71ba587b932e0823b"
=20
-PACKAGECONFIG ??=3D "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', =
'tests', '', d)}"
+PACKAGECONFIG ??=3D "openssl gnutls ${@bb.utils.contains('PTEST_ENABLED'=
, '1', 'tests', '', d)}"
=20
 PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Denabled,-Dgnutls=3Ddisabled,gnutls=
"
 PACKAGECONFIG[openssl] =3D "-Dopenssl=3Denabled,-Dopenssl=3Ddisabled,ope=
nssl"
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.7.4.bb
index b34eb7f5f0..c2bb1da8be 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -27,7 +27,7 @@ SRC_URI[sha256sum] =3D "e6adbebcfbc95867de01060d93c7899=
38cf89cc1d1f6ef9ef661890f62
=20
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
=20
-PACKAGECONFIG ??=3D "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'secc=
omp', d)}"
+PACKAGECONFIG ??=3D "libidn p11-kit ${@bb.utils.filter('DISTRO_FEATURES'=
, 'seccomp', d)}"
=20
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb b/meta/recipe=
s-support/p11-kit/p11-kit_0.24.1.bb
index 59cbb67961..32c382489e 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "git://github.com/p11-glue/p11-kit;branch=3D=
master;protocol=3Dhttps"
 SRCREV =3D "dd0590d4e583f107e3e9fafe9ed754149da335d0"
 S =3D "${WORKDIR}/git"
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "trust-paths"
 PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native"
 PACKAGECONFIG[trust-paths] =3D "-Dtrust_paths=3D/etc/ssl/certs/ca-certif=
icates.crt,,,ca-certificates"
=20
@@ -29,4 +29,4 @@ FILES:${PN} +=3D " \
 # PN contains p11-kit-proxy.so, a symlink to a loadable module
 INSANE_SKIP:${PN} =3D "dev-so"
=20
-BBCLASSEXTEND =3D "nativesdk"
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


