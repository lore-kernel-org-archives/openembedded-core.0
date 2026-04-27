Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEEDFF8872
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 20:46:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5992.1777322810038155514
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 13:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=JXT9CzgU;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E461616F2
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 13:46:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E2063F763
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 13:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777322809; bh=5/+S2QgTSmF1c7oSQvPzT+N7GBUSWcWnBdRs9/y5xJE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JXT9CzgU5eiIELwzOBu8x4+YXE3Tuc2BTXBeFEbP5Rtq2h1nbW5Q2Six8BTIVXtoY
	 I1xvYdbcR7cdwBrhZQeynajOUNglU0aVhIFBq1HYdC1lzMHRmoR5XqbyjgDw/Y7ebf
	 XD6apagMFAONyZV/A6ZcXDvCkP0/h7ROqHJRvr+0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] p11-kit: add PACKAGECONFIG for trust and systemd
Date: Mon, 27 Apr 2026 21:46:38 +0100
Message-ID: <20260427204640.2003231-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427204640.2003231-1-ross.burton@arm.com>
References: <20260427204640.2003231-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 20:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236022

libtasn dependencies are specific to the trust module, add a PACKAGECONFI=
G
for that and move the dependencies. This is currently enabled by default
to preserve behaviour.

p11-kit has optional systemd user units for the remote server, add a
PACKAGECONFIG for that that respects the systemd DISTRO_FEATURE.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.26.2.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb b/meta/recipe=
s-support/p11-kit/p11-kit_0.26.2.bb
index aa8b28e0e71..a0e2e17d026 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
@@ -6,16 +6,17 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D02933887f609=
807fbb57aa4237d14a50"
=20
 inherit meson gettext pkgconfig gtk-doc bash-completion manpages
=20
-DEPENDS =3D "libtasn1 libtasn1-native libffi"
+DEPENDS =3D "libffi"
=20
 DEPENDS:append =3D "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') =3D=3D =
'True' else ''}"
=20
-SRC_URI =3D "gitsm://github.com/p11-glue/p11-kit;branch=3Dmaster;protoco=
l=3Dhttps;tag=3D${PV} \
-           "
+SRC_URI =3D "gitsm://github.com/p11-glue/p11-kit;branch=3Dmaster;protoco=
l=3Dhttps;tag=3D${PV}"
 SRCREV =3D "8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef"
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
} trust"
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
 PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native"
+PACKAGECONFIG[trust] =3D "-Dtrust_module=3Denabled,-Dtrust_module=3Ddisa=
bled,libtasn1-native libtasn1"
 PACKAGECONFIG[trust-paths] =3D "-Dtrust_paths=3D/etc/ssl/certs/ca-certif=
icates.crt,,,ca-certificates"
=20
 EXTRA_OEMESON:append =3D " -Dnls=3D${@'false' if d.getVar('USE_NLS') =3D=
=3D 'no' else 'true'}"
--=20
2.43.0


