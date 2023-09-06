Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552DCEE14D3
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 18:14:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6281.1694024069417993859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 11:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 103A3106F;
	Wed,  6 Sep 2023 11:15:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 968623F67D;
	Wed,  6 Sep 2023 11:14:28 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/7] libsoup-2.4: update PACKAGECONFIG
Date: Wed,  6 Sep 2023 19:14:18 +0100
Message-Id: <20230906181420.795510-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230906181420.795510-1-ross.burton@arm.com>
References: <20230906181420.795510-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 18:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187346

From: Ross Burton <ross.burton@arm.com>

Add explicit PACKAGECONFIGs for brotli,ntlm, and sysprof.

libsoup needs to be told where ntlm_auth will be on the target, so write
a cross file to do so.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libsoup/libsoup-2.4_2.74.3.bb              | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/re=
cipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 79281fbf5b5..5abeced30b2 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -25,12 +25,24 @@ UPSTREAM_CHECK_REGEX =3D "libsoup-(?P<pver>2(\.(?!99)=
\d+)+)\.tar"
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
-# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards. D=
isable by default.
 PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[brotli] =3D "-Dbrotli=3Denabled,-Dbrotli=3Ddisabled,brotli=
"
+# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards
 PACKAGECONFIG[gnome] =3D "-Dgnome=3Dtrue,-Dgnome=3Dfalse"
 PACKAGECONFIG[gssapi] =3D "-Dgssapi=3Denabled,-Dgssapi=3Ddisabled,krb5"
-
-EXTRA_OEMESON:append =3D " -Dvapi=3Ddisabled -Dtls_check=3Dfalse"
+PACKAGECONFIG[ntlm] =3D "-Dntlm=3Denabled,-Dntlm=3Ddisabled"
+PACKAGECONFIG[sysprof] =3D "-Dsysprof=3Denabled,-Dsysprof=3Ddisabled,sys=
prof"
+
+# Tell libsoup where the target ntlm_auth is installed
+do_write_config:append:class-target() {
+    cat >${WORKDIR}/soup.cross <<EOF
+[binaries]
+ntlm_auth =3D '${bindir}/ntlm_auth'
+EOF
+}
+EXTRA_OEMESON +=3D "--cross-file ${WORKDIR}/soup.cross"
+
+EXTRA_OEMESON +=3D "-Dvapi=3Ddisabled -Dtls_check=3Dfalse"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.34.1


