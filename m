Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E37DC4829D
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 15:39:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15188.1707493194268861505
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 07:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E421DA7
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Feb 2024 07:40:35 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2278B3F762
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Feb 2024 07:39:53 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][master-next 1/2] recipetool: don't dump stack traces if a toml parser can't be found
Date: Fri,  9 Feb 2024 15:39:50 +0000
Message-Id: <20240209153951.2659327-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 15:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195228

From: Ross Burton <ross.burton@arm.com>

If we can't find tomllib or tomli then we can just tell the user politely
that we can't parse the pyproject.toml file, there's no need to dump
exception stack traces.

Move the parser exception handler to catch the actual parse, as otherwise
it will never be used.

Whilst here, also add some debug statements to make it clear what of the
handlers is being called.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../lib/recipetool/create_buildsys_python.py  | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/l=
ib/recipetool/create_buildsys_python.py
index 60c59034504..a589343cfbf 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -573,12 +573,15 @@ class PythonSetupPyRecipeHandler(PythonRecipeHandle=
r):
         if 'buildsystem' in handled:
             return False
=20
+        logger.debug("Trying setup.py parser")
+
         # Check for non-zero size setup.py files
         setupfiles =3D RecipeHandler.checkfiles(srctree, ['setup.py'])
         for fn in setupfiles:
             if os.path.getsize(fn):
                 break
         else:
+            logger.debug("No setup.py found")
             return False
=20
         # setup.py is always parsed to get at certain required informati=
on, such as
@@ -799,12 +802,15 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipe=
Handler):
         if 'buildsystem' in handled:
             return False
=20
+        logger.debug("Trying pyproject.toml parser")
+
         # Check for non-zero size setup.py files
         setupfiles =3D RecipeHandler.checkfiles(srctree, ["pyproject.tom=
l"])
         for fn in setupfiles:
             if os.path.getsize(fn):
                 break
         else:
+            logger.debug("No pyproject.toml found")
             return False
=20
         setupscript =3D os.path.join(srctree, "pyproject.toml")
@@ -816,14 +822,16 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipe=
Handler):
                 try:
                     import tomli as tomllib
                 except ImportError:
-                    logger.exception("Neither 'tomllib' nor 'tomli' coul=
d be imported. Please use python3.11 or above or install tomli module")
-                    return False
-                except Exception:
-                    logger.exception("Failed to parse pyproject.toml")
+                    logger.error("Neither 'tomllib' nor 'tomli' could be=
 imported, cannot scan pyproject.toml.")
                     return False
=20
-            with open(setupscript, "rb") as f:
-                config =3D tomllib.load(f)
+            try:
+                with open(setupscript, "rb") as f:
+                    config =3D tomllib.load(f)
+            except Exception:
+                logger.exception("Failed to parse pyproject.toml")
+                return False
+
             build_backend =3D config["build-system"]["build-backend"]
             if build_backend in self.build_backend_map:
                 classes.append(self.build_backend_map[build_backend])
--=20
2.34.1


