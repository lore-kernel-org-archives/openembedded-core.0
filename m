Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861BFCA0EDC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 11:02:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6755.1755774167255900236
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 04:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91A0B152B
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 04:02:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 70A683F58B
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 04:02:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] nghttp2: rewrite recipe to be an idiomatic library recipe
Date: Thu, 21 Aug 2025 12:02:42 +0100
Message-ID: <20250821110242.1773085-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 11:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222226

This recipe for nghttp2 doesn't build any of the binaries, just the core
library, but is structured like a recipe that is primarily an application
that happens to ship libraries.

Remove the lib${BPN} package and put the library into PN (which will then
be debian-renamed).

Use the shorthand option to just build the library.

Add documentation enabling/disabling options so we don't install the
docs if not needed. Currently there are no extra dependencies as the
sphinx-generated manpages are pre-built in the tarballs, but this could
change.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/nghttp2/nghttp2_1.66.0.bb | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb b/meta/recipe=
s-support/nghttp2/nghttp2_1.66.0.bb
index 123ddb2d081..49d6d7e6329 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
@@ -8,18 +8,9 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-=
${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "00ba1bdf0ba2c74b2a4fe6c8b1069dc9d82f82608af24442=
d430df97c6f9e631"
=20
 inherit cmake manpages python3native github-releases
-PACKAGECONFIG[manpages] =3D ""
=20
-# examples are never installed, and don't need to be built in the
-# first place
-EXTRA_OECMAKE =3D "-DENABLE_EXAMPLES=3DOFF -DENABLE_APP=3DOFF -DENABLE_H=
PACK_TOOLS=3DOFF -DENABLE_PYTHON_BINDINGS=3DOFF"
+PACKAGECONFIG[manpages] =3D "-DENABLE_DOC=3DON,-DENABLE_DOC=3DOFF"
=20
-PACKAGES =3D+ "lib${BPN}"
-
-RDEPENDS:${PN}:class-native =3D ""
-
-ALLOW_EMPTY:${PN} =3D "1"
-FILES:${PN} =3D ""
-FILES:lib${BPN} =3D "${libdir}/*${SOLIBS}"
+EXTRA_OECMAKE =3D "-DENABLE_LIB_ONLY=3DON -DENABLE_PYTHON_BINDINGS=3DOFF=
"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


