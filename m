Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEEFC5DF6D
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 19:41:43 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15970.1786909295039130617
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 12:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Beup+TnM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-2026081619413229f0ceef9c00020755-xthelo@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026081619413229f0ceef9c00020755
        for <openembedded-core@lists.openembedded.org>;
        Sun, 16 Aug 2026 21:41:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=G7LVVwYWMZiWTFPbGoHBnWd++oOlopoo8Yx8tzuzJps=;
 b=Beup+TnME56dLy1IuUY357Rd4Jlg6pDGWvU2UGtrfaDSHzv6/jB7JP1QgNGUvvcuVbIESJ
 Ue8Zcz6u/0+rzvq/Eyzn5qE66sonk7cwN5lL6uPNZCrWdWHSgUNMk1aprHq0L00nb74huYb/
 Nx38LbOkWXMROi0/p2gE3R87ZMLj1SncovOrU/yfhCDU1kL+bqdvOj8JeA7ETWtRya5pLq2i
 Bgf63t1jr+UA3Jjk47jdXjzO41RHOVxYzowVXE9NanCcdOZULVI492v9L6Iga/RegXxOIdKh
 cKvbrK4GeE7NEhXS4zvFKiIEAee0NojJn7YWqsUnoGIKwKLgo3IpNuwA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 04/14] devtool: ide-sdk: fix meson IntelliSense for gcc toolchain
Date: Sun, 16 Aug 2026 21:40:47 +0200
Message-ID: <20260816194127.86607-5-adrian.freihofer@siemens.com>
In-Reply-To: <20260816194127.86607-1-adrian.freihofer@siemens.com>
References: <20260816194127.86607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 19:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243551

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The configurationProvider = "mesonbuild.mesonbuild" approach in
c_cpp_properties.json worked for meson recipes built with clang (the
__gen_meson_absolute_cross_file workaround absolutized the clang
binary path in an extra cross-file so the mesonbuild extension could
find it), but failed for the gcc toolchain: the extension could not
resolve the bare compiler name in the meson.cross file and silently
fell back to the host compiler for IntelliSense. The sysroot was also
absent, so built-in headers were resolved against the host system.

Replace the extension-based approach with explicit settings that work
for both gcc and clang toolchains:
  - compilerPath: absolute path to the cross CXX binary in
    staging_bindir_toolchain, so cpptools finds the right compiler
  - compilerArgs: ["--sysroot=<recipe_sysroot>"], so built-in
    includes are resolved against the target sysroot headers
  - compileCommands: path to compile_commands.json in the meson build
    directory B, which meson/ninja generates automatically with the
    exact per-file flags (include paths, defines, -march= etc.)
  - intelliSenseMode: derived from TARGET_ARCH and TOOLCHAIN
    (linux-gcc-arm64 / linux-clang-x64, etc.)

With compileCommands pointing at the real compilation database, the
mesonbuild extension is no longer needed for IntelliSense, so the
__gen_meson_absolute_cross_file workaround is also removed.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 66 +++++++--------------
 1 file changed, 23 insertions(+), 43 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 9faba3f2d1..d190858d44 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -147,45 +147,6 @@ class IdeVSCode(IdeBase):
     def dot_code_dir(self, modified_recipe):
         return os.path.join(modified_recipe.srctree, '.vscode')
 
-    def __gen_meson_absolute_cross_file(self, modified_recipe):
-        """Generate an extra cross file overriding c/cpp binaries with absolute paths.
-
-        The recipe's generated meson.cross references the toolchain binaries
-        (e.g. "aarch64-poky-linux-clang++") by bare name, relying on PATH
-        being set up by the meson wrapper script at build time. Meson stores
-        that command exactly as configured (it never resolves it to an
-        absolute path itself), so it ends up unresolved in
-        compile_commands.json and meson-info/intro-compilers.json. cpptools
-        (via the mesonbuild extension) resolves compilerPath using its own
-        process PATH, which does not include the toolchain directory, and
-        silently falls back to a host compiler for IntelliSense.
-
-        Real builds are unaffected since the wrapper script sets up PATH, so
-        the recipe's meson.cross is left untouched. Instead, an extra
-        --cross-file is layered on top with only the c/cpp [binaries]
-        entries absolutized, reusing the exact same flags as CC/CXX to avoid
-        any behavior drift. Meson merges multiple machine files, with later
-        files overriding matching keys from earlier ones.
-        """
-        def absolutize(cmd):
-            args = cmd.split()
-            args[0] = os.path.join(
-                modified_recipe.staging_bindir_toolchain, args[0])
-            return repr(args)
-
-        lines = ["[binaries]"]
-        if modified_recipe.cc:
-            lines.append("c = %s" % absolutize(modified_recipe.cc))
-        if modified_recipe.cxx:
-            lines.append("cpp = %s" % absolutize(modified_recipe.cxx))
-
-        os.makedirs(modified_recipe.ide_sdk_dir, exist_ok=True)
-        cross_file = os.path.join(
-            modified_recipe.ide_sdk_dir, 'meson-absolute-toolchain.cross')
-        with open(cross_file, 'w') as f:
-            f.write(os.linesep.join(lines) + os.linesep)
-        return ['--cross-file', cross_file]
-
     def __vscode_settings_meson(self, settings_dict, modified_recipe):
         if modified_recipe.build_tool is not BuildTool.MESON:
             return
@@ -193,11 +154,16 @@ class IdeVSCode(IdeBase):
 
         confopts = modified_recipe.mesonopts.split()
         confopts += modified_recipe.meson_cross_file.split()
-        if modified_recipe.meson_cross_file:
-            confopts += self.__gen_meson_absolute_cross_file(modified_recipe)
         confopts += modified_recipe.extra_oemeson.split()
         settings_dict["mesonbuild.configureOptions"] = confopts
         settings_dict["mesonbuild.buildFolder"] = modified_recipe.b
+        # Prevent the extension from writing C_Cpp.default.configurationProvider
+        # for itself once meson-info.json appears, which would take precedence
+        # over the compileCommands set in c_cpp_properties.json.
+        settings_dict["mesonbuild.modifySettings"] = False
+        # Clear any such value a previous run (or extension version without
+        # modifySettings support) already wrote to this workspace's settings.
+        settings_dict["C_Cpp.default.configurationProvider"] = ""
 
     def __vscode_settings_cmake(self, settings_dict, modified_recipe):
         """Add cmake specific settings to settings.json.
@@ -328,8 +294,22 @@ class IdeVSCode(IdeBase):
         if modified_recipe.build_tool is BuildTool.CMAKE:
             properties_dict["configurationProvider"] = "ms-vscode.cmake-tools"
         elif modified_recipe.build_tool is BuildTool.MESON:
-            properties_dict["configurationProvider"] = "mesonbuild.mesonbuild"
-            properties_dict["compilerPath"] = os.path.join(modified_recipe.staging_bindir_toolchain, modified_recipe.cxx.split()[0])
+            # configurationProvider = "mesonbuild.mesonbuild" does not work because
+            # the cross-compiler is not in PATH and omits the sysroot by default.
+            compiler_type = 'clang' if modified_recipe.toolchain == 'clang' else 'gcc'
+            arch_map = {
+                'aarch64': 'arm64', 'x86_64': 'x64', 'arm': 'arm',
+                'i686': 'x86', 'i586': 'x86', 'riscv64': 'x64', 'riscv32': 'x86',
+            }
+            intelli_arch = arch_map.get(modified_recipe.target_arch, 'x64')
+            properties_dict["compilerPath"] = os.path.join(
+                modified_recipe.staging_bindir_toolchain,
+                modified_recipe.cxx.split()[0])
+            properties_dict["compilerArgs"] = [
+                "--sysroot=" + modified_recipe.recipe_sysroot]
+            properties_dict["compileCommands"] = os.path.join(
+                modified_recipe.b, 'compile_commands.json')
+            properties_dict["intelliSenseMode"] = "linux-%s-%s" % (compiler_type, intelli_arch)
         elif modified_recipe.build_tool is BuildTool.KERNEL_MODULE:
             # Using e.g. configurationProvider = "ms-vscode.makefile-tools" was not successful
             properties_dict["compilerPath"] = os.path.join(modified_recipe.staging_bindir_toolchain, modified_recipe.kernel_cc.split()[0])
-- 
2.55.0


