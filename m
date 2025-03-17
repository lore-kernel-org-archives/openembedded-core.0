Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECA5C28B30
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 12:52:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.51576.1742215924240039415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 05:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71BB013D5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 05:52:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 318313F694
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 05:52:03 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] docbook-xml-dtd4: clean up LICENSE situation
Date: Mon, 17 Mar 2025 12:51:58 +0000
Message-ID: <20250317125159.3675476-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 12:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213087

Don't use the common 'OASIS' license, as this isn't a SPDX license and
is in fact specifically the DocBook XML v4 license text.

Instead, use NO_GENERIC_LICENSE to ship a custom license file. We still
need to ship a copy of it in-tree because the license code needs a bare
copy of the license text.  Reference the in-tree license text in the
license checksum to show that we've verified they match.

Also, clean up some comments.

Thanks to hongxu.jia@eng.windriver.com for a previous iteration of this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../docbook-xml-dtd4/LICENSE-OASIS            |  4 ---
 .../docbook-xml/docbook-xml-dtd4_4.5.bb       | 25 ++++---------------
 2 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-O=
ASIS b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS
index 6da7f5b8c74..13f303dc6ae 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS
@@ -10,7 +10,3 @@ If you modify the DocBook DTD in any way, except for de=
claring and
 referencing additional sets of general entities and declaring
 additional notations, label your DTD as a variant of DocBook.  See
 the maintenance documentation for more information.
-
-Please direct all questions, bug reports, or suggestions for=20
-changes to the docbook@lists.oasis-open.org mailing list. For more
-information, see http://www.oasis-open.org/docbook/.
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/=
meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
index 5229a0366c2..58e9b6659e5 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
@@ -3,28 +3,13 @@ DESCRIPTION =3D "Document type definitions for verifica=
tion of XML data \
 files against the DocBook rule set."
 HOMEPAGE =3D "https://docbook.org"
=20
-# The upstream sources are not distributed with a license file.
-# LICENSE-OASIS is included as a "patch" to workaround this. When
-# upgrading this recipe, please verify whether this is still needed.
+LICENSE =3D "DocBook"
+NO_GENERIC_LICENSE[DocBook] =3D "LICENSE-OASIS"
=20
-LICENSE =3D "OASIS"
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE-OASIS;md5=3Dc608985dd5f7f215e6=
69e7639a0b1d2e"
-
-# To support apps with xml schema backward compatibility, we must
-# install a set of schemas. Install the latest based on PV and then
-# name any specific versions as required. TODO: Figure out a mechanism
-# to filter exactly which versions are necessary, if that's even
-# possible.
-#
-# DocBook.org lists available release packages at https://docbook.org/xm=
l/.
-#
-# The release packages relate docbook source at
-# https://github.com/docbook/docbook but building them requires the
-# Gradle build system. In future, it might be safer to use the source
-# tree which would also enable proper SBOM generation through the
-# bitbake build system.
-#
+LIC_FILES_CHKSUM =3D "file://docbook-4.5/docbookx.dtd;beginline=3D15;end=
line=3D30;md5=3Dab12da76ad94a41d04e1587693ebd9b6 \
+                    file://LICENSE-OASIS;md5=3Db9ee6208caa6e66c68dfad6f3=
1d73f92"
=20
+# Install the latest 4.5 DTDs, and the previous releases for backward co=
mpatibility.
 SRC_URI =3D "https://docbook.org/xml/4.1.2/docbkx412.zip;name=3Dpayload4=
12;subdir=3Ddocbook-4.1.2 \
            https://docbook.org/xml/4.2/docbook-xml-4.2.zip;name=3Dpayloa=
d42;subdir=3Ddocbook-4.2 \
            https://docbook.org/xml/4.3/docbook-xml-4.3.zip;name=3Dpayloa=
d43;subdir=3Ddocbook-4.3 \
--=20
2.43.0


