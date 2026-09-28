Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8B3CA5FA3
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:32:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64297.1790616725908742661
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=DOnSbD//;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F29631655
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:32:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0D7793F763
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790616725; bh=Lmi2WLVpcrfMaSxFxzsvlBB51lqbE2pu7zDVWDzjXXU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DOnSbD///6117a+52AILGhNwCbg1r3TBHlCDb3OAlWFiU/XJ985jFxyF0wYDFWkm+
	 YWCs4cFlP2dAusivyJg40xc6fXgUzdaUxA4xvFCGmezj0af4NemPvDtbwRGt01qhO6
	 AisMM7PVURi5ISgvZn8FoiTFdXFD13L/rSbnhK+I=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 3/4] recipetool: set PYPI_PACKAGE_SDIST if needed
Date: Mon, 28 Sep 2026 18:31:57 +0100
Message-ID: <20260928173158.781301-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928173158.781301-1-ross.burton@arm.com>
References: <20260928173158.781301-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 17:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246780

Normalise the PyPI package name when setting PYPI_PACKAGE, and also set
PYPI_PACKAGE_SDIST if required.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../lib/recipetool/create_buildsys_python.py   | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/l=
ib/recipetool/create_buildsys_python.py
index 61979c842cf..1d8a3b8dfda 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -115,6 +115,14 @@ class PythonRecipeHandler(RecipeHandler):
     def __init__(self):
         pass
=20
+    @staticmethod
+    def pypi_normalise(s):
+        """
+        Normalize the package names.
+        https://packaging.python.org/en/latest/specifications/name-norma=
lization/
+        """
+        return re.sub(r"[-_.]+", "-", s).lower()
+
     def process_url(self, args, classes, handled, extravalues):
         """
         Convert any pypi url https://pypi.org/project/<package>/<version=
> into https://files.pythonhosted.org/packages/source/...
@@ -143,6 +151,7 @@ class PythonRecipeHandler(RecipeHandler):
                 for release in reversed(data["releases"][version]):
                     if release["packagetype"] =3D=3D "sdist":
                         fetch_uri =3D release["url"]
+                        sdist =3D release["filename"].rsplit("-")[0]
                         break
             else:
                 logger.warning("Cannot handle pypi url %s: cannot fetch =
package information using %s", source, json_url)
@@ -152,14 +161,19 @@ class PythonRecipeHandler(RecipeHandler):
             if match:
                 fetch_uri =3D source
                 pypi_package =3D match.group(1)
-                _, version =3D determine_from_url(fetch_uri)
+                sdist, version =3D determine_from_url(fetch_uri)
=20
         if match and not args.no_pypi:
             if required_version and version !=3D required_version:
                 raise Exception("Version specified using --version/-V (%=
s) and version specified in the url (%s) do not match" % (required_versio=
n, version))
-            # This is optionnal if BPN looks like "python-<pypi_package>=
" or "python3-<pypi_package>" (see pypi.bbclass)
+            # PYPI_PACKAGE is optional if BPN looks like "python-<pypi_p=
ackage>" or "python3-<pypi_package>" (see pypi.bbclass)
             # but at this point we cannot know because because user can =
specify the output name of the recipe on the command line
+            pypi_package =3D self.pypi_normalise(pypi_package)
             extravalues["PYPI_PACKAGE"] =3D pypi_package
+            # Some sdists don't use normalised names, so check and set P=
YPI_PACKAGE_SDIST if needed
+            if sdist !=3D pypi_package.replace("-", "_"):
+                extravalues["PYPI_PACKAGE_SDIST"] =3D sdist
+
             # If the tarball extension is not 'tar.gz' (default value in=
 pypi.bblcass) whe should set PYPI_PACKAGE_EXT in the recipe
             pypi_package_ext =3D re.match(r'.*%s-%s\.(.*)$' % (pypi_pack=
age, version), fetch_uri)
             if pypi_package_ext:
--=20
2.43.0


