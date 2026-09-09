Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D827DC88E40
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:51 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.95.1788990824826707821
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=ePaI9cBc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20260909215343d525040fa000020753-_lxefr@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260909215343d525040fa000020753
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=tWBgFYnnCkCw0nF7ViejA15m8nweKEV0YCuM5njyl+E=;
 b=ePaI9cBc38rcck7UathuvvsdK18tTh9OByvZqBlNtpJNZkvvqBrgOr622pmiOJi6LuMJrD
 8oEvOZ24T2It98FKDXPeAbYSAkGhfzYfol0cKS76FBzSgQJnvl3P3vBR+6D1FrrsRp2DONUq
 5i2r93tKkItGPV/DoFk5k33t0fUx5Naoqtjeu5YKxnKjvTXs45Ip8P251Z5NQeyE9l87j7vz
 CpAwJH9VlBTRfmWEhRpKZVrYMiw/uMMsGzFM4K/pwa8lHxEf8JcZa2T6Ujume00l9lDkn15D
 yOXAZb6c9kPZfokUeCrjzu2n3W/XlOxUov4FdaqQA8pqZXELJFIEkTNQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 11/15] devtool: ide-sdk: support clangd for non-clang toolchain recipes
Date: Wed,  9 Sep 2026 23:53:11 +0200
Message-ID: <20260909215337.89106-12-adrian.freihofer@siemens.com>
In-Reply-To: <20260909215337.89106-1-adrian.freihofer@siemens.com>
References: <20260909215337.89106-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245514

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Make the IntelliSense provider choice independent of TOOLCHAIN.

clangd ships in the clang recipe, whose "clang-native" is only pulled
into RECIPE_SYSROOT_NATIVE via clang-cross-* when TOOLCHAIN == "clang".
Introduce a new bitbake variable IDE_SDK_INTELLISENSE which can be set
to "clangd" on a gcc (or other non-clang) recipe.

This requires adding the clang-native recipe to the sysroots in addition
to the recipes TOOLCHAIN. Add RecipeModified.update_bbappend(), mirroring
RecipeImage's marker-section bbappend management: which adds
DEPENDS:append = " clang-native" to the recipe's own workspace bbappend.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py |  3 +-
 scripts/lib/devtool/ide_sdk.py              | 99 ++++++++++++++++++++-
 2 files changed, 98 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index acf3db7494..8a8ab8bf3d 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -291,7 +291,8 @@ class IdeVSCode(IdeBase):
         recommendations = []
         # clangd (matched to the recipe's real cross compiler via
         # compile_commands.json) replaces cpptools as the IntelliSense provider
-        # if toolchain is clang. CodeLLDB/GDB debugging is unaffected either way.
+        # when selected via IDE_SDK_INTELLISENSE (defaults to clangd for the
+        # clang toolchain). CodeLLDB/GDB debugging is unaffected either way.
         use_clangd = (modified_recipe.ide_sdk_intellisense == 'clangd'
                       and modified_recipe.build_tool.is_c_cpp)
         if use_clangd:
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index a3fbe7cdcb..f9a92ac5ca 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -752,9 +752,12 @@ class RecipeModified:
 
     VALID_BASH_ENV_NAME_CHARS = re.compile(r"^[a-zA-Z0-9_]*$")
 
-    def __init__(self, name):
+    MARKER = '# devtool ide-sdk: clangd toolchain support'
+
+    def __init__(self, name, orig_bbappend_content=None):
         self.name = name
         self.bootstrap_tasks = [name + ':do_install']
+        self._orig_bbappend_content = orig_bbappend_content
         self.debugger_cross = None
         # workspace
         self.real_srctree = None
@@ -829,6 +832,73 @@ class RecipeModified:
         self._installed_binaries = None
         self._gdb_pretty_print_scripts = None
 
+    @staticmethod
+    def _strip_marker_section(content, marker):
+        """Remove one devtool ide-sdk marker section, if present"""
+        return re.sub(
+            r'^' + re.escape(marker) + r'\n(?:[^\n]+\n)*',
+            '', content, flags=re.MULTILINE)
+
+    @classmethod
+    def strip_bbappend_sections(cls, config, recipe_names):
+        """Remove devtool ide-sdk's own bbappend section from earlier runs
+
+        Runs before setup_tinfoil() so that every parse in this session sees the
+        original recipe content and only non standard flags can be bbappended later.
+        """
+        originals = {}
+        appends_dir = os.path.join(config.workspace_path, 'appends')
+        for name in recipe_names:
+            bbappend = os.path.join(appends_dir, name + '.bbappend')
+            if not os.path.exists(bbappend):
+                continue
+            with open(bbappend, 'r') as f:
+                content = f.read()
+            originals[name] = content
+            stripped = cls._strip_marker_section(content, cls.MARKER)
+            if stripped != content:
+                with open(bbappend, 'w') as f:
+                    f.write(stripped)
+        return originals
+
+    def update_bbappend(self):
+        """Add DEPENDS on clang-native when clangd is used as only the IntelliSense engine"""
+        wants_clang_native = (
+            self.build_tool.is_c_cpp
+            and self.ide_sdk_intellisense == 'clangd'
+            and self.toolchain != 'clang')
+
+        original_content = self._orig_bbappend_content or ''
+        if os.path.exists(self.bbappend):
+            with open(self.bbappend, 'r') as f:
+                parsed_content = f.read()
+        else:
+            parsed_content = ''
+
+        if not wants_clang_native:
+            if self.MARKER in original_content:
+                logger.info(
+                    "Removed clangd toolchain support from %s: no longer needed", self.bbappend)
+            return False
+
+        new_section = self.MARKER + '\nDEPENDS:append = " clang-native"\n'
+        new_content = parsed_content
+        if new_content and not new_content.endswith('\n'):
+            new_content += '\n'
+        new_content += new_section
+
+        if new_content == original_content:
+            return False
+
+        appends_dir = os.path.dirname(self.bbappend)
+        os.makedirs(appends_dir, exist_ok=True)
+        with open(self.bbappend, 'w') as f:
+            f.write(new_content)
+        logger.info(
+            "Updated %s: added DEPENDS on clang-native, needed to stage clangd "
+            "for IDE_SDK_INTELLISENSE=\"clangd\"", self.bbappend)
+        return True
+
     def initialize(self, config, workspace, tinfoil):
         recipe_d = parse_recipe(
             config, tinfoil, self.name, appends=True, filter_workspace=False)
@@ -885,7 +955,8 @@ class RecipeModified:
         self.target_arch = recipe_d.getVar('TARGET_ARCH')
         self.tmpdir = os.path.realpath(recipe_d.getVar('TMPDIR'))
         self.toolchain = recipe_d.getVar('TOOLCHAIN')
-        self.ide_sdk_intellisense = 'clangd' if self.toolchain == 'clang' else 'cpptools'
+        self.ide_sdk_intellisense = recipe_d.getVar('IDE_SDK_INTELLISENSE') or (
+            'clangd' if self.toolchain == 'clang' else 'cpptools')
         self.topdir = recipe_d.getVar('TOPDIR')
         self.workdir = os.path.realpath(recipe_d.getVar('WORKDIR'))
 
@@ -1650,6 +1721,8 @@ def ide_setup(args, config, basepath, workspace):
     # ide-sdk section it is a no-op.
     orig_bbappend_contents = RecipeImage.strip_bbappend_sections(
         config, args.recipenames)
+    orig_recipe_bbappend_contents = RecipeModified.strip_bbappend_sections(
+        config, args.recipenames)
     tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
     try:
         # define mode depending on recipes which need to be processed
@@ -1769,7 +1842,8 @@ def ide_setup(args, config, basepath, workspace):
                         str(recipes_modified_names))
             debuggers = {}
             for recipe_name in recipes_modified_names:
-                recipe_modified = RecipeModified(recipe_name)
+                recipe_modified = RecipeModified(
+                    recipe_name, orig_recipe_bbappend_contents.get(recipe_name))
                 recipe_modified.initialize(config, workspace, tinfoil)
                 bootstrap_tasks += recipe_modified.bootstrap_tasks
                 recipes_modified.append(recipe_modified)
@@ -1797,7 +1871,26 @@ def ide_setup(args, config, basepath, workspace):
     if args.bitbake_k:
         bb_cmd += "-k "
 
+    # Add back the clangd toolchain support section stripped above, if still
+    # needed. Runs even with --skip-bitbake, otherwise it would be lost (see
+    # RecipeModified.strip_bbappend_sections()).
+    recipe_bbappend_changed = False
+    for recipe_modified in recipes_modified:
+        if recipe_modified.update_bbappend():
+            recipe_bbappend_changed = True
+
     if not args.skip_bitbake:
+        if recipe_bbappend_changed:
+            # The bbappend content just written differs from the one bitbake
+            # parsed during the tinfoil session above. See update_image_bbappend()'s
+            # matching reset for phase 2 for why this is needed.
+            reparse_tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
+            try:
+                reparse_tinfoil.run_command('resetCooker')
+                reparse_tinfoil.parse_recipes()
+            finally:
+                reparse_tinfoil.shutdown()
+
         # Phase 1: build modified recipes and debug tools so that
         # installed_binaries is populated and port numbers can be assigned.
         # The image is built in phase 2, after the complete bbappend is written.
-- 
2.55.0


