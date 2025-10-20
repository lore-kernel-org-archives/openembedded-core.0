Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9F4CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 07:11:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.12516.1760944278325184328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 00:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=O7sgvK+z;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 01AB84E411D9;
	Mon, 20 Oct 2025 07:11:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC56C606D5;
	Mon, 20 Oct 2025 07:11:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9C9C102F23A4;
	Mon, 20 Oct 2025 09:11:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760944271; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jdDk1PGFwERQlFkAgPt17Svy1BGiDFRUt/4/TwLOywg=;
	b=O7sgvK+zYImp+Rd47Hu0vdq6PUdjdnkbuSiVgEiTtblojQD0kGc5I50asTqk5VrUSDe7ET
	Sv/74ksC2wnvIvLDBKL3vn/EWpaNPY347QBFsDux0xhhEH9m75L3Tmmt3/z4/OnvTQ6QY/
	+Np9p6vw2AMRf9vtKwe7fy/jjoatnLTustDzMVP5ABz6vhc7Jcz3MbIjbjkKEleaLfKeHk
	XcWBeT6JFXtblSFBCvVnVAp3Put5DypaS9FBu0YlIGx2XLfxSrEMf25H4jkflrcO8Ixq6n
	XYSbaiHZbBl42LBXJ06kYG42uJ7sjycDLcvLE0E9K4JpOjKTvJobghaFUJfi9g==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [scarthgap v2 10/11] spdx 3.0: Rework how SPDX aliases are linked
Date: Mon, 20 Oct 2025 09:09:50 +0200
Message-ID: <20251020070952.942165-11-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
References: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225108

From: Joshua Watt <JPEWhacker@gmail.com>

The SPDX code needs to be able to look up an Element by its SPDX ID,
locating the file that (should) contain the SPDX ID and opening it for
parsing. Previously, the code would do this be hashing each Element
SPDX ID and Alias, and the creating a symbolic link to the file that
contains the element with a name of the hash.

This worked well as it was possible to look up any arbitrary SPDX ID or
alias by simply hashing it and following the symbolic link to get the
file. However, the down side of this approach is that it creates a lot
of symbolic links, since it will make one or two per Element in the
document. This can be a problem when using SPDX_INCLUDE_SOURCES, for
example.

This change reworks this strategy so that the only Element that gets a
symbolic link based on the hash is the singular SpdxDocument that is
create for each file. All other Elements are assigned an alias with a
special prefix that encodes the hash of SpdxDocument alias. Thus, when
attempting to look up an arbitrary alias, the code sees the special
prefix, extract the hash, opens the file based on the symlink with that
hash name, then finds the matching Element in the file. This drastically
reduces the number of symbolic links by making only one per file.

This also means that the custom link extension can be removed since it
is now superfluous.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 838d64c09657ac53175737fc4e7fd6f01f3dcf47)
Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.=
com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
index c279ea162b..238c26d076 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -142,35 +142,31 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCas=
e):
     def test_base_files(self):
         self.check_recipe_spdx(
             "base-files",
-            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/base-files.spdx.j=
son",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/package-base-file=
s.spdx.json",
         )
=20
-
     def test_gcc_include_source(self):
-        import oe.spdx30
-
         objset =3D self.check_recipe_spdx(
             "gcc",
-            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/gcc.spdx.json",
-            extraconf=3Dtextwrap.dedent(
-                """\
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-gcc.spdx.=
json",
+            extraconf=3D"""\
                 SPDX_INCLUDE_SOURCES =3D "1"
-                """
-            ),
+                """,
         )
=20
         gcc_pv =3D get_bb_var("PV", "gcc")
-        filename =3D f'gcc-{gcc_pv}/README'
+        filename =3D f"gcc-{gcc_pv}/README"
         found =3D False
         for software_file in objset.foreach_type(oe.spdx30.software_File=
):
             if software_file.name =3D=3D filename:
                 found =3D True
-                self.logger.info(f"The spdxId of {filename} in gcc.spdx.=
json is {software_file.spdxId}")
+                self.logger.info(
+                    f"The spdxId of {filename} in recipe-gcc.spdx.json i=
s {software_file.spdxId}"
+                )
                 break
=20
         self.assertTrue(
-            found,
-            f"Not found source file {filename} in gcc.spdx.json\n"
+            found, f"Not found source file {filename} in recipe-gcc.spdx=
.json\n"
         )
=20
     def test_core_image_minimal(self):
--=20
2.43.0


