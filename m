Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF591C54764
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 16:55:42 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.46415.1708361738647841568
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 08:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=pZrbIrJm;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 015BB9C34C2;
	Mon, 19 Feb 2024 11:55:38 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id V5vbwPd50tUk; Mon, 19 Feb 2024 11:55:36 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C404D9C4165;
	Mon, 19 Feb 2024 11:55:36 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com C404D9C4165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708361736; bh=q2OOzVkUbofT8hyiboJIa1MHReJH/EVrQThtvzFFsis=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=pZrbIrJmiUQqOGuuPtfx5ref+pWH5350HuoR/CgLe6oCvDSwMniMvZ0Q9YSkNBLuT
	 SIjJCyU2cr05iz0YKNEQkctinYb6wXxAKofy9cGBh9zuVYnGcrB178TWRbBDybZcbm
	 ItgyyTCZXQHVFYBLsoesU78kiMSN5a+PY8j+EEINi91HbQoEDStUR/Djyme/jMpR33
	 wyqImQUzZlL66SSYomBOvz18kcJQ4CJBGOYcsEfNP6ebh5VmcGSFC6WQXQGHI+tm69
	 /tg9qLBuU1+gKUqTvbfG0DgpFjLawIkCNqkdjD/U1/DOmFPk9b2vO5NA0w2k9nAWaO
	 oL/XQyAHrhbyA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id G7wFKplWu32w; Mon, 19 Feb 2024 11:55:36 -0500 (EST)
Received: from sfl-deribaucourt.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 14DAD9C3372;
	Mon, 19 Feb 2024 11:55:35 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@gmail.com,
	Ross.Burton@arm.com,
	mohammed.raza@savoirfairelinux.com,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [PATCH v2 5/5] devtool: code: Provide a generic C++ configuration
Date: Mon, 19 Feb 2024 17:55:25 +0100
Message-Id: <20240219165525.714512-6-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
References: <20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 16:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195890

By default, the cpptools VSCode extension will use the host's headers
and flags for linting. This results in a lot of include errors and
misleading definitions. Even though this generic configuration doesn't
include all the depenendencies, it is a proper fallback for recipe
classes we do not accurately cover, with at least the right sysroot.

Additionally, ide-sdk automatically detects and provides a launch.json
configuration for autotools recipes so we should recommend the C++
extensions for them.

Recipes which use C/C++ without a build system are not covered by this
patch.

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirf=
airelinux.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py |  3 +++
 scripts/lib/devtool/ide_plugins/ide_code.py | 27 +++++++++++++--------
 scripts/lib/devtool/ide_sdk.py              |  5 ++++
 3 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/de=
vtool/ide_plugins/__init__.py
index 3371b242640..59e90663908 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -21,6 +21,7 @@ class BuildTool(Enum):
     UNDEFINED =3D auto()
     CMAKE =3D auto()
     MESON =3D auto()
+    AUTOTOOLS =3D auto()
=20
     @property
     def is_c_ccp(self):
@@ -28,6 +29,8 @@ class BuildTool(Enum):
             return True
         if self is BuildTool.MESON:
             return True
+        if self is BuildTool.AUTOTOOLS:
+            return True
         return False
=20
=20
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/de=
vtool/ide_plugins/ide_code.py
index 7b683c74086..0942fde8196 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -157,31 +157,35 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), settings_file, settings_=
dict)
=20
-    def __vscode_extensions_cmake(self, modified_recipe, recommendations=
):
-        if modified_recipe.build_tool is not BuildTool.CMAKE:
+    def __vscode_extensions_generic(self, modified_recipe, recommendatio=
ns):
+        if not modified_recipe.build_tool.is_c_ccp:
             return
         recommendations +=3D [
-            "twxs.cmake",
-            "ms-vscode.cmake-tools",
             "ms-vscode.cpptools",
             "ms-vscode.cpptools-extension-pack",
             "ms-vscode.cpptools-themes"
         ]
=20
+    def __vscode_extensions_cmake(self, modified_recipe, recommendations=
):
+        if modified_recipe.build_tool is not BuildTool.CMAKE:
+            return
+        recommendations +=3D [
+            "twxs.cmake",
+            "ms-vscode.cmake-tools"
+        ]
+
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
@@ -194,8 +198,11 @@ class IdeVSCode(IdeBase):
             properties_dict["configurationProvider"] =3D "ms-vscode.cmak=
e-tools"
         elif modified_recipe.build_tool is BuildTool.MESON:
             properties_dict["configurationProvider"] =3D "mesonbuild.mes=
onbuild"
-        else:  # no C/C++ build
-            return
+        elif modified_recipe.build_tool.is_c_ccp:
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
index f292edbe25c..6313daa8700 100755
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
@@ -380,6 +383,8 @@ class RecipeModified:
             self.extra_oemeson =3D recipe_d.getVar('EXTRA_OEMESON')
             self.meson_cross_file =3D recipe_d.getVar('MESON_CROSS_FILE'=
)
             self.build_tool =3D BuildTool.MESON
+        elif bb.data.inherits_class('autotools', recipe_d):
+            self.build_tool =3D BuildTool.AUTOTOOLS
=20
         # Recipe ID is the identifier for IDE config sections
         self.recipe_id =3D self.bpn + "-" + self.package_arch
--=20
2.34.1


