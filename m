Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9A6C54E60
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:15:41 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.33958.1710728136654824431
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id DD74F19C66
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 03:15:34 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.150]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rm2XF-3rC4cj0; Mon, 18 Mar 2024 03:15:33 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libsoup: enable vapi support
Date: Mon, 18 Mar 2024 03:15:58 +0100
Message-ID: <20240318021558.99372-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710728133-FB7FD94C-F780BE0F/0/0 CLEAN NORMAL
X-TOI-MSGID: 345f1c42-1f90-4a16-81ce-2068fadf8f94
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197274

without vapi gnome-calculator-46.0 will fail with:
| ../gnome-calculator-46.0/lib/currency-provider.vala:161.19-161.47:
error: The name `send_and_splice_async' does not exist in the context
of `Soup.Session' (libsoup-3.0)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-support/libsoup/libsoup_3.4.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes=
-support/libsoup/libsoup_3.4.4.bb
index 6d382a7852..6f7cac4cf8 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -19,7 +19,7 @@ CVE_PRODUCT =3D "libsoup"
=20
 S =3D "${WORKDIR}/libsoup-${PV}"
=20
-inherit meson gettext pkgconfig upstream-version-is-even gobject-introsp=
ection gi-docgen
+inherit meson gettext pkgconfig upstream-version-is-even gobject-introsp=
ection gi-docgen vala
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
@@ -39,7 +39,7 @@ EOF
 }
 EXTRA_OEMESON:append:class-target =3D " --cross-file ${WORKDIR}/soup.cro=
ss"
=20
-EXTRA_OEMESON +=3D "-Dvapi=3Ddisabled -Dtls_check=3Dfalse"
+EXTRA_OEMESON +=3D "-Dtls_check=3Dfalse"
 # Disable the test suites
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dautobahn=3Ddisabled -Dpkcs11_tests=
=3Ddisabled"
=20
--=20
2.44.0


