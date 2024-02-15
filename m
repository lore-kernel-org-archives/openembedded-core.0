Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF081C48BEB
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:04:38 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.19506.1708016675280777884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=Pfk4HrX2;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 972449C2A5D;
	Thu, 15 Feb 2024 12:04:34 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id HjiMKARcl8mf; Thu, 15 Feb 2024 12:04:33 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7CFBE9C45E9;
	Thu, 15 Feb 2024 12:04:33 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 7CFBE9C45E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708016673; bh=CXXvJd5HHbC0gDE9wLGWx/hgBkC90z5ByyIHwG1Mq0U=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=Pfk4HrX2vZw5rZxmv4OAAyvqOpdUllr3qs6KJ+bfi4Rw7HR4UzyYWBwD/7gE0r85d
	 DWw6IuDvqtvzLxV/QxYOTofFESE63WcMU1ynS8VvaI+aCMYMX0CaQF4/tlY5DplTfx
	 dbPZy1JS+vy/RTPS4gMgGeM9sokAdnIFvHt8Sgh/kCNlpuMB9vtJFkkcbzgG0WDqGF
	 iYw+d0UokKmBL/svMQ5tekGReYxItwD7dqqX23hiaBkjztUkc2u2+SnQCsv/vWkpKL
	 Wqj+xYJp74fhiHXrIxzzd+3vJOXQkwjP7ZgzAbrtqqsGGx2bGyrMdHXFnIj380DyrF
	 +hdBJDWyeSTVw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id uMvDwO7ldaGW; Thu, 15 Feb 2024 12:04:33 -0500 (EST)
Received: from sfl-deribaucourt.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id A10E79C3381;
	Thu, 15 Feb 2024 12:04:32 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@gmail.com,
	Ross.Burton@arm.com,
	mohammed.raza@savoirfairelinux.com,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [PATCH 6/6] devtool: code: Provide a generic C++ configuration
Date: Thu, 15 Feb 2024 18:04:22 +0100
Message-Id: <20240215170422.659073-7-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215170422.659073-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
References: <20240215170422.659073-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195554

By default, the cpptools VSCode extension will use the host's headers
and flags for linting. This results in a lot of include errors and
misleading definitions. Even though this generic configuration doesn't
include all the depenendencies, it is a proper fallback for recipe
classes we do not accurately cover, with at least the right sysroot.

Additionally, ide-sdk automatically detects and provides a launch.json
configuration for autotools recipes so we should recommend the C++
extensions for them.

If the recipe is of another class (like Python), then the configuration
will be generated but probably useless to the user. We'd need a mecanism
to know if the recipe contains C/C++ but I'm not aware of any
class-agnostic way to do it.
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 25 ++++++++++++---------
 scripts/lib/devtool/ide_sdk.py              |  3 +++
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/de=
vtool/ide_plugins/ide_code.py
index 7b683c74086..51cf2c8a736 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -157,31 +157,33 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), settings_file, settings_=
dict)
=20
+    def __vscode_extensions_generic(self, modified_recipe, recommendatio=
ns):
+        recommendations +=3D [
+            "ms-vscode.cpptools",
+            "ms-vscode.cpptools-extension-pack",
+            "ms-vscode.cpptools-themes"
+        ]
+
     def __vscode_extensions_cmake(self, modified_recipe, recommendations=
):
         if modified_recipe.build_tool is not BuildTool.CMAKE:
             return
         recommendations +=3D [
             "twxs.cmake",
-            "ms-vscode.cmake-tools",
-            "ms-vscode.cpptools",
-            "ms-vscode.cpptools-extension-pack",
-            "ms-vscode.cpptools-themes"
+            "ms-vscode.cmake-tools"
         ]
=20
     def __vscode_extensions_meson(self, modified_recipe, recommendations=
):
         if modified_recipe.build_tool is not BuildTool.MESON:
             return
         recommendations +=3D [
-            'mesonbuild.mesonbuild',
-            "ms-vscode.cpptools",
-            "ms-vscode.cpptools-extension-pack",
-            "ms-vscode.cpptools-themes"
+            'mesonbuild.mesonbuild'
         ]
=20
     def vscode_extensions(self, modified_recipe):
         recommendations =3D []
         self.__vscode_extensions_cmake(modified_recipe, recommendations)
         self.__vscode_extensions_meson(modified_recipe, recommendations)
+        self.__vscode_extensions_generic(modified_recipe, recommendation=
s)
         extensions_file =3D 'extensions.json'
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), extensions_file, {"recom=
mendations": recommendations})
@@ -194,8 +196,11 @@ class IdeVSCode(IdeBase):
             properties_dict["configurationProvider"] =3D "ms-vscode.cmak=
e-tools"
         elif modified_recipe.build_tool is BuildTool.MESON:
             properties_dict["configurationProvider"] =3D "mesonbuild.mes=
onbuild"
-        else:  # no C/C++ build
-            return
+        else: =20
+            # Provide a generic linting configuration
+            # We provide a C++ configuration with the proper sysroot
+            properties_dict["compilerPath"] =3D os.path.join(modified_re=
cipe.staging_bindir_toolchain, modified_recipe.cxx.split()[0])
+            properties_dict["compilerArgs"] =3D modified_recipe.cxx.spli=
t()[1:]
=20
         properties_dicts =3D {
             "configurations": [
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk=
.py
index 1e36f2b2093..c82b150a83e 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -345,6 +345,7 @@ class RecipeModified:
         self.base_libdir =3D recipe_d.getVar('base_libdir')
         self.bblayers =3D recipe_d.getVar('BBLAYERS').split()
         self.bpn =3D recipe_d.getVar('BPN')
+        self.cxx =3D recipe_d.getVar('CXX')
         self.d =3D recipe_d.getVar('D')
         self.fakerootcmd =3D recipe_d.getVar('FAKEROOTCMD')
         self.fakerootenv =3D recipe_d.getVar('FAKEROOTENV')
@@ -361,6 +362,8 @@ class RecipeModified:
             recipe_d.getVar('RECIPE_SYSROOT'))
         self.recipe_sysroot_native =3D os.path.realpath(
             recipe_d.getVar('RECIPE_SYSROOT_NATIVE'))
+        self.staging_bindir_toolchain =3D os.path.realpath(
+            recipe_d.getVar('STAGING_BINDIR_TOOLCHAIN'))
         self.staging_incdir =3D os.path.realpath(
             recipe_d.getVar('STAGING_INCDIR'))
         self.strip_cmd =3D recipe_d.getVar('STRIP')
--=20
2.34.1


