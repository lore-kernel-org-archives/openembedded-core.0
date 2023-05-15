Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81AFC7EE30
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 13:30:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.88212.1684157399371808871
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 06:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEB322F4;
	Mon, 15 May 2023 06:30:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9D6023F67D;
	Mon, 15 May 2023 06:29:58 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/8] gnutls: use system libtasn1
Date: Mon, 15 May 2023 14:29:50 +0100
Message-Id: <20230515132955.2231164-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515132955.2231164-1-ross.burton@arm.com>
References: <20230515132955.2231164-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 13:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181253

From: Ross Burton <ross.burton@arm.com>

Instead of using an internal ASN.1 parser, re-use libtasn1 from the
system by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.0.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.8.0.bb
index 1e0f1f6912b..0758eb15a93 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.0.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.0.bb
@@ -30,13 +30,13 @@ SRC_URI[sha256sum] =3D "0ea0d11a1660a1e63f960f157b197=
abe6d0c8cb3255be24e1fb3815930
=20
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
=20
-PACKAGECONFIG ??=3D "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'secc=
omp', d)}"
+PACKAGECONFIG ??=3D "libidn libtasn1 ${@bb.utils.filter('DISTRO_FEATURES=
', 'seccomp', d)}"
=20
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
 PACKAGECONFIG[seccomp] =3D "--with-libseccomp-prefix=3D${STAGING_EXECPRE=
FIXDIR},ac_cv_libseccomp=3Dno,libseccomp"
 PACKAGECONFIG[libidn] =3D "--with-idn,--without-idn,libidn2"
-PACKAGECONFIG[libtasn1] =3D "--with-included-libtasn1=3Dno,--with-includ=
ed-libtasn1,libtasn1"
+PACKAGECONFIG[libtasn1] =3D "--without-included-libtasn1,--with-included=
-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] =3D "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] =3D "--with-tpm,--without-tpm,trousers"
 PACKAGECONFIG[fips] =3D "--enable-fips140-mode --with-libdl-prefix=3D${S=
TAGING_BASELIBDIR}"
--=20
2.34.1


