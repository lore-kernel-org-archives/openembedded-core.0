Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B80AC56202
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:00:53 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14573.1785844843951429406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=eiC4kGka;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260804120038c98dec45ad00020762-bgv6cy@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260804120038c98dec45ad00020762
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 14:00:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=KIp3fy9ivWo03/5d6hf+YxRNrFAt41ChKTqy4tb7ZQA=;
 b=eiC4kGkaikw/eH3PbmVv9whcCh7CPgGClTcpBkuig6llj7tWfbUpQRVOKXUPPZVazKUNJI
 IMLcfPW69t4bqoz5UWWEICQ+kCatrZxKYGp5I+Yt1fyVUIb4btQyDfGwpZmV+UgdFMbv3wVQ
 TJ00aQJOdtbdMFOrOJoGqAKMln83ESF1JIZpG4mEF72JZKFtAAX4BXJjT57I54IU6tpmQkh2
 qJpPjH/aXi9F40arbHNqWBkRo8k/7BFYZU3ZBYczMc+/H8VqgQ++wUIjfjXUpdTPHJ/lSL+E
 fnP1tPksFmjFkZ6ftsBc1iN5ct4oSff9susQbjTXy15VY7usJsspWJDA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 04/14] devtool: ide-sdk: fix meson compile_commands.json
Date: Tue,  4 Aug 2026 13:59:28 +0200
Message-ID: <20260804120034.378787-5-adrian.freihofer@siemens.com>
In-Reply-To: <20260804120034.378787-1-adrian.freihofer@siemens.com>
References: <20260804120034.378787-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242724

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The generated meson.cross references the toolchain c/c++ binaries by
bare name (e.g. "aarch64-poky-linux-clang++"), relying on PATH being
set up by the meson wrapper script at build time. Meson stores that
command exactly as configured in compile_commands.json and
meson-info/intro-compilers.json without resolving it to an absolute
path. cpptools (via the mesonbuild extension) resolves compilerPath
using its own process PATH, which does not include the toolchain
directory, and silently falls back to a host compiler, breaking
IntelliSense.

Real builds are unaffected since the wrapper script sets up PATH at
build time, so leave the recipe's meson.cross untouched. Instead,
layer an extra --cross-file on top that only absolutizes the c/cpp
[binaries] entries, reusing the exact same flags as CC/CXX to avoid
any behavior drift. Meson merges multiple machine files, with later
files overriding matching keys from earlier ones.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 41 +++++++++++++++++++++
 scripts/lib/devtool/ide_sdk.py              |  1 +
 2 files changed, 42 insertions(+)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 96f007ca91..38f73e355c 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -128,6 +128,45 @@ class IdeVSCode(IdeBase):
     def dot_code_dir(self, modified_recipe):
         return os.path.join(modified_recipe.srctree, '.vscode')
 
+    def __gen_meson_absolute_cross_file(self, modified_recipe):
+        """Generate an extra cross file overriding c/cpp binaries with absolute paths.
+
+        The recipe's generated meson.cross references the toolchain binaries
+        (e.g. "aarch64-poky-linux-clang++") by bare name, relying on PATH
+        being set up by the meson wrapper script at build time. Meson stores
+        that command exactly as configured (it never resolves it to an
+        absolute path itself), so it ends up unresolved in
+        compile_commands.json and meson-info/intro-compilers.json. cpptools
+        (via the mesonbuild extension) resolves compilerPath using its own
+        process PATH, which does not include the toolchain directory, and
+        silently falls back to a host compiler for IntelliSense.
+
+        Real builds are unaffected since the wrapper script sets up PATH, so
+        the recipe's meson.cross is left untouched. Instead, an extra
+        --cross-file is layered on top with only the c/cpp [binaries]
+        entries absolutized, reusing the exact same flags as CC/CXX to avoid
+        any behavior drift. Meson merges multiple machine files, with later
+        files overriding matching keys from earlier ones.
+        """
+        def absolutize(cmd):
+            args = cmd.split()
+            args[0] = os.path.join(
+                modified_recipe.staging_bindir_toolchain, args[0])
+            return repr(args)
+
+        lines = ["[binaries]"]
+        if modified_recipe.cc:
+            lines.append("c = %s" % absolutize(modified_recipe.cc))
+        if modified_recipe.cxx:
+            lines.append("cpp = %s" % absolutize(modified_recipe.cxx))
+
+        os.makedirs(modified_recipe.ide_sdk_dir, exist_ok=True)
+        cross_file = os.path.join(
+            modified_recipe.ide_sdk_dir, 'meson-absolute-toolchain.cross')
+        with open(cross_file, 'w') as f:
+            f.write(os.linesep.join(lines) + os.linesep)
+        return ['--cross-file', cross_file]
+
     def __vscode_settings_meson(self, settings_dict, modified_recipe):
         if modified_recipe.build_tool is not BuildTool.MESON:
             return
@@ -135,6 +174,8 @@ class IdeVSCode(IdeBase):
 
         confopts = modified_recipe.mesonopts.split()
         confopts += modified_recipe.meson_cross_file.split()
+        if modified_recipe.meson_cross_file:
+            confopts += self.__gen_meson_absolute_cross_file(modified_recipe)
         confopts += modified_recipe.extra_oemeson.split()
         settings_dict["mesonbuild.configureOptions"] = confopts
         settings_dict["mesonbuild.buildFolder"] = modified_recipe.b
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 940bb8211e..69b002b635 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -478,6 +478,7 @@ class RecipeModified:
         self.bblayers = recipe_d.getVar('BBLAYERS').split()
         self.bitbakepath = recipe_d.getVar('BITBAKEPATH')
         self.bpn = recipe_d.getVar('BPN')
+        self.cc = recipe_d.getVar('CC')
         self.cxx = recipe_d.getVar('CXX')
         self.d = recipe_d.getVar('D')
         self.debug_build = recipe_d.getVar('DEBUG_BUILD')
-- 
2.55.0


