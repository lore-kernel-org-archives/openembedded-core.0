Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C22C4707C
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 13:07:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10998.1704892056086302496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 05:07:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F3DB2F4
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 05:08:21 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 64C733F64C
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 05:07:35 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] gtk-doc: don't manually call gtkdocize
Date: Wed, 10 Jan 2024 13:07:28 +0000
Message-Id: <20240110130730.3698802-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110130730.3698802-1-ross.burton@arm.com>
References: <20240110130730.3698802-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 13:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193506

From: Ross Burton <ross.burton@arm.com>

The autoreconf call will now call gtkdocize if needed, so we don't need
to run it manually here.

This obsoletes GTKDOC_DOCDIR.  If this is needed then the replacement is
to ensure that the configure.ac has a call to GTK_DOC_CHECK which passes
--docdir.

For example, this is the change required for kmod:

-GTK_DOC_CHECK([1.14],[--flavour no-tmpl-flat])
+GTK_DOC_CHECK([1.14],[--flavour no-tmpl-flat --docdir libkmod/docs])

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/gtk-doc.bbclass | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/classes-recipe/gtk-doc.bbclass b/meta/classes-recipe/gt=
k-doc.bbclass
index c980c6bb52d..9d3911966bb 100644
--- a/meta/classes-recipe/gtk-doc.bbclass
+++ b/meta/classes-recipe/gtk-doc.bbclass
@@ -33,21 +33,11 @@ EXTRA_OEMESON:prepend =3D "-D${GTKDOC_MESON_OPTION}=3D=
${@bb.utils.contains('GTKDOC_E
 # needed for m4 macros.
 DEPENDS:append =3D " gtk-doc-native"
=20
-# The documentation directory, where the infrastructure will be copied.
-# gtkdocize has a default of "." so to handle out-of-tree builds set thi=
s to $S.
-GTKDOC_DOCDIR ?=3D "${S}"
-
 export STAGING_DIR_HOST
=20
 inherit python3native pkgconfig qemu
 DEPENDS:append =3D "${@' qemu-native' if d.getVar('GTKDOC_ENABLED') =3D=3D=
 'True' else ''}"
=20
-do_configure:prepend () {
-	# Need to use ||true as this is only needed if configure.ac both exists
-	# and uses GTK_DOC_CHECK.
-	gtkdocize --srcdir ${S} --docdir ${GTKDOC_DOCDIR} || true
-}
-
 do_compile:prepend:class-target () {
     if [ ${GTKDOC_ENABLED} =3D True ]; then
         # Write out a qemu wrapper that will be given to gtkdoc-scangobj=
 so that it
--=20
2.34.1


