Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826ADCCFA1F
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 13:15:31 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11175.1762521328838329947
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 05:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=iNZbFaps;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 67566C0FAA2;
	Fri,  7 Nov 2025 13:15:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90995606A6;
	Fri,  7 Nov 2025 13:15:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49A90118525DD;
	Fri,  7 Nov 2025 14:15:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762521327; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Tj5nGhAdJ6ayYlWnkY3jbt9QdTKRE2LnmdxB5SpHm0Y=;
	b=iNZbFaps9F8pFVMGAbbuH/jbskGUkzHz9GZhj8m7q0kBGsum9BGdVov3gFsClmPTnfjsnI
	0dxU1+cmpsohLloL7QiQwBHsqnVfFAiTplU4LrEzyOC438sAYLr4ubo4KeJ3sNb8lyMyMW
	SzyBZ1lGJKnaU5UIK7Wu0eDM/etSj15qnWEk9CBvooDFi0Fu9f2PrQBHloHHSfD9J4RBz/
	dC5dnxuga6sXFN0GgAuazqQGiugBf25gKQTSRpB4LvQXuPqGpyxGpuQBhhOd7Nul/uc3la
	laQra11jJiMCY1yiI668DZk1mEGCqP8XR25XS587HJTVlFuSd2EWcZBAYJ4BEg==
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
Subject: [scarthgap v4 14/17] spdx 3.0: Rework how SPDX aliases are linked
Date: Fri,  7 Nov 2025 14:14:48 +0100
Message-ID: <20251107131502.3857600-15-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
References: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 13:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226050

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
index a54b74a59c..f22bd6c275 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -143,35 +143,31 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCas=
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


