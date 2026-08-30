Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC2DC624C2
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 14:29:54 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9430.1788100183423104196
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 07:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=lm1/4NWu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20260830142940a1c4eced5600020715-nkeach@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260830142940a1c4eced5600020715
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 16:29:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7/VaUD5YeLphG9cw5Smci7s/DApnGoNA/E+ahV2Me2Y=;
 b=lm1/4NWujuZAAL69pGdggb0naPlnr7nyQcDdx9iqJoQBOO4LWm8C/zV3IDgVbBqvxQWN1v
 JWgkd1c15ZcmggtBB3dFByiUlNosn8/fS56aeKfLzTJgKKeizQQ5Tgdk+Wu6iUthSWwrHNtv
 XAb8UZAH5iAqFQ57VIVP3NHJphLJ4rpM6CreuJyTRKdaCff6cA6Kyp5fdCfK0bZ8nhDh693c
 BIhxyKY9Sj5/MXrPbfutnbaM+T6YtCLWzNZFkm2ESsBNLjaT+ESufOx14/L9tyK7dosg6OZU
 67y4sl6w4BeBRH2Wl24oV1fjyKV8aJKAc+Mf47W7lTke18WG+MqrY+ag==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 05/24] devtool: ide-sdk: auto-write image debug settings to bbappend
Date: Sun, 30 Aug 2026 16:28:32 +0200
Message-ID: <20260830142922.17241-6-adrian.freihofer@siemens.com>
In-Reply-To: <20260830142922.17241-1-adrian.freihofer@siemens.com>
References: <20260830142922.17241-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 14:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244669

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Simplify devtool ide-sdk usage by automatically generating the image
modifications required for debugging, instead of requiring manual
local.conf edits.

Generate the needed IMAGE_* and debug-server settings in the workspace
image bbappend based on the selected recipes and debugger. Add only
settings that are still missing, and remove the generated section
again when it becomes unnecessary, so configuration stays minimal and
up to date.

This was not done before because rewriting image metadata after parse
caused basehash inconsistency warnings. That is now handled by
controlling the parse flow and allowing the required additional parse
round(s) after bbappend updates.

Build in two phases so debugger ports are known before the image build,
and handle bbappend updates in a way that avoids basehash
non-determinism warnings.

This allows to simplify the documentation. We can remove the instructions
for manually configuring IMAGE_GEN_DEBUGFS, IMAGE_FSTYPES_DEBUGFS,
IMAGE_CLASSES as well as appends to IMAGE_INSTALL in local.conf. That
just happens automatically now when running devtool ide-sdk.

Support also bbappend files with version in the file name like for
example: foo_1.2.bbappend or foo_git.bbappend.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 251 +++++++++++++++++++++++++++------
 1 file changed, 206 insertions(+), 45 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index d7575ec523..b62a0f612e 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -185,32 +185,79 @@ class RecipeImage:
     rootfs must be created as part of the SDK.
     """
 
-    def __init__(self, name):
-        self.combine_dbg_image = False
-        self.gdbserver_missing = False
+    MARKER = '# devtool ide-sdk: image debug settings'
+
+    def __init__(self, name, orig_bbappend_content=None):
         self.name = name
         self.rootfs = None
         self.__rootfs_dbg = None
         self.bootstrap_tasks = [self.name + ':do_build']
+        # Debug settings already provided by the base configuration (e.g.
+        # local.conf, MACHINE, DISTRO, the recipe itself) plus any bbappend
+        # content other than devtool ide-sdk's own section (see
+        # strip_bbappend_sections()). Populated by initialize().
+        self.base_image_gen_debugfs = False
+        self.base_image_fstypes_debugfs = ''
+        self.base_has_combined_dbg = False
+        self.base_image_install = set()
+        self._bbappend = None
+        # Content of the bbappend before strip_bbappend_sections() ran.
+        self._orig_bbappend_content = orig_bbappend_content
+
+    @classmethod
+    def _strip_marker_section(cls, content):
+        """Remove devtool ide-sdk's own image debug settings section, if any"""
+        return re.sub(
+            r'^' + re.escape(cls.MARKER) + r'\n(?:[^\n]+\n)*',
+            '', content, flags=re.MULTILINE)
+
+    @classmethod
+    def strip_bbappend_sections(cls, config, recipe_names):
+        """Remove devtool ide-sdk's own bbappend section from earlier runs
+
+        Returns a {recipe name: content before stripping} dict for the recipes
+        that have a bbappend, to be passed on to the RecipeImage constructor.
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
+            stripped = cls._strip_marker_section(content)
+            if stripped != content:
+                with open(bbappend, 'w') as f:
+                    f.write(stripped)
+        return originals
 
     def initialize(self, config, tinfoil):
+        appends_dir = os.path.join(config.workspace_path, 'appends')
+        self._bbappend = os.path.join(appends_dir, self.name + '.bbappend')
+
+        # strip_bbappend_sections() ran before the tinfoil session started, so
+        # this parse sees the same bbappend content as any other parse of this
+        # recipe until the tinfoil session ends.
         image_d = parse_recipe(
             config, tinfoil, self.name, appends=True, filter_workspace=False)
         if not image_d:
             raise DevtoolError(
                 "Parsing image recipe %s failed" % self.name)
 
-        self.combine_dbg_image = bb.data.inherits_class(
+        self.base_image_gen_debugfs = image_d.getVar(
+            'IMAGE_GEN_DEBUGFS') == '1'
+        self.base_image_fstypes_debugfs = image_d.getVar(
+            'IMAGE_FSTYPES_DEBUGFS') or ''
+        self.base_has_combined_dbg = bb.data.inherits_class(
             'image-combined-dbg', image_d)
+        self.base_image_install = set(
+            (image_d.getVar('IMAGE_INSTALL') or '').split())
 
         workdir = image_d.getVar('WORKDIR')
         self.rootfs = os.path.join(workdir, 'rootfs')
-        if image_d.getVar('IMAGE_GEN_DEBUGFS') == "1":
-            self.__rootfs_dbg = os.path.join(workdir, 'rootfs-dbg')
-
-        package_install = image_d.getVar('PACKAGE_INSTALL').split()
-        self.gdbserver_missing = 'gdbserver' not in package_install
-        self.lldb_server_missing = 'lldb-server' not in package_install
+        self.__rootfs_dbg = os.path.join(workdir, 'rootfs-dbg')
 
     @property
     def debug_support(self):
@@ -222,6 +269,76 @@ class RecipeImage:
             return self.__rootfs_dbg
         return None
 
+    def update_image_bbappend(self, recipes_modified):
+        """Write debug settings for modified-mode recipes into the image bbappend.
+
+        Writes IMAGE_GEN_DEBUGFS, IMAGE_FSTYPES_DEBUGFS, IMAGE_CLASSES for
+        image-combined-dbg, the appropriate debug server (gdbserver or
+        lldb-server), and IMAGE_INSTALL entries for each modified recipe
+        (including the ptest package when the recipe inherits ptest).
+
+        initialize() already stripped this section from the bbappend on
+        disk before parsing, so it only needs to be added back here, if
+        still needed. Returns True if the resulting bbappend content
+        actually differs from what was on disk when initialize() ran, False
+        if it is left exactly as it was.
+        """
+        wants_gdbserver = any(
+            r.wants_gdbserver and r.toolchain != 'clang'
+            for r in recipes_modified)
+        wants_lldb_server = any(
+            r.wants_gdbserver and r.toolchain == 'clang'
+            for r in recipes_modified)
+
+        # Only add what the base configuration (e.g. local.conf) does not
+        # already provide, to avoid duplicate/conflicting settings.
+        lines = []
+        if not self.base_image_gen_debugfs:
+            lines.append('IMAGE_GEN_DEBUGFS = "1"')
+        if self.base_image_fstypes_debugfs != '':
+            lines.append('IMAGE_FSTYPES_DEBUGFS = ""')
+        if not self.base_has_combined_dbg:
+            lines.append('IMAGE_CLASSES += "image-combined-dbg"')
+        if wants_gdbserver and 'gdbserver' not in self.base_image_install:
+            lines.append('IMAGE_INSTALL:append = " gdbserver"')
+        if wants_lldb_server and 'lldb-server' not in self.base_image_install:
+            lines.append('IMAGE_INSTALL:append = " lldb-server"')
+        for r in recipes_modified:
+            if r.name not in self.base_image_install:
+                lines.append('IMAGE_INSTALL:append = " %s"' % r.name)
+            if r.has_ptest and (r.name + '-ptest') not in self.base_image_install:
+                lines.append('IMAGE_INSTALL:append = " %s-ptest"' % r.name)
+
+        original_content = self._orig_bbappend_content or ''
+        # strip_bbappend_sections() left this on disk, and it is what bitbake
+        # parsed. Any difference from it invalidates the parsed basehashes.
+        if os.path.exists(self._bbappend):
+            with open(self._bbappend, 'r') as f:
+                parsed_content = f.read()
+        else:
+            parsed_content = ''
+
+        if not lines:
+            # The base configuration already provides everything needed.
+            if parsed_content != original_content:
+                logger.info(
+                    "Removed image debug settings from %s: already provided by the base configuration", self._bbappend)
+            return False
+
+        new_section = self.MARKER + '\n' + '\n'.join(lines) + '\n'
+        new_content = parsed_content
+        if new_content and not new_content.endswith('\n'):
+            new_content += '\n'
+        new_content += new_section
+
+        appends_dir = os.path.dirname(self._bbappend)
+        os.makedirs(appends_dir, exist_ok=True)
+        with open(self._bbappend, 'w') as f:
+            f.write(new_content)
+
+        logger.info("Updated image bbappend %s", self._bbappend)
+        return True
+
 
 class RecipeMetaIdeSupport:
     """For the shared sysroots mode meta-ide-support is needed
@@ -475,6 +592,8 @@ class RecipeModified:
         # Whether to warn when DEBUG_BUILD is not set.  Kernel modules are built
         # by the kernel's build system and DEBUG_BUILD does not influence them.
         self.wants_debug_build = True
+        # Whether this recipe provides a ptest package
+        self.has_ptest = False
         # build_tool = cmake
         self.oecmake_generator = None
         self.cmake_cache_vars = None
@@ -592,6 +711,8 @@ class RecipeModified:
             self.reverse_debug_prefix_map = self._init_reverse_debug_prefix_map(
                 recipe_d.getVar('DEBUG_PREFIX_MAP'))
 
+        self.has_ptest = bb.data.inherits_class('ptest', recipe_d)
+
         # Recipe ID is the identifier for IDE config sections
         self.recipe_id = self.bpn + "-" + self.package_arch
         self.recipe_id_pretty = self.bpn + ": " + self.package_arch
@@ -1235,9 +1356,21 @@ def ide_setup(args, config, basepath, workspace):
         if recipe in ['meta-ide-support', 'build-sysroots']:
             raise DevtoolError("Invalid recipe: %s." % recipe)
 
-    # Collect information about tasks which need to be bitbaked
+    # Collect information about tasks which need to be bitbaked.
+    # In modified mode the image build is held back until after
+    # setup_modified_recipe() has assigned the debugger port numbers and
+    # update_image_bbappend() has written the complete bbappend. That way
+    # the image is built with a single, stable recipe hash so that no
+    # basehash-changed warnings are emitted.
     bootstrap_tasks = []
     bootstrap_tasks_late = []
+    image_bootstrap_tasks = []
+    # Must happen before setup_tinfoil() so that every parse in this session
+    # sees the same bbappend content. Which of the recipes is the image is only
+    # known after parsing, so this covers all of them; for a recipe without an
+    # ide-sdk section it is a no-op.
+    orig_bbappend_contents = RecipeImage.strip_bbappend_sections(
+        config, args.recipenames)
     tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
     try:
         # define mode depending on recipes which need to be processed
@@ -1269,8 +1402,9 @@ def ide_setup(args, config, basepath, workspace):
             if not recipes_modified_names:
                 appends_dir = os.path.join(config.workspace_path, 'appends')
                 recipes_modified_names = sorted(
-                    os.path.splitext(os.path.basename(path))[0]
-                    for path in glob.glob(os.path.join(appends_dir, '*.bbappend')))
+                    bb.parse.vars_from_file(path, None)[0]
+                    for path in glob.glob(os.path.join(appends_dir, '*.bbappend'))
+                    if bb.parse.vars_from_file(path, None)[0] not in recipes_image_names)
                 if recipes_modified_names:
                     logger.info(
                         "No modified recipes specified, using workspace bbappends from %s: %s",
@@ -1302,9 +1436,17 @@ def ide_setup(args, config, basepath, workspace):
         recipes_images = []
         for recipes_image_name in recipes_image_names:
             logger.info("Using image: %s" % recipes_image_name)
-            recipe_image = RecipeImage(recipes_image_name)
+            recipe_image = RecipeImage(
+                recipes_image_name,
+                orig_bbappend_contents.get(recipes_image_name))
             recipe_image.initialize(config, tinfoil)
-            bootstrap_tasks += recipe_image.bootstrap_tasks
+            if args.mode == DevtoolIdeMode.modified:
+                # Keep the image build separate so that the complete bbappend
+                # can be written in one step before the image is built,
+                # avoiding sstate hash mismatches.
+                image_bootstrap_tasks += recipe_image.bootstrap_tasks
+            else:
+                bootstrap_tasks += recipe_image.bootstrap_tasks
             recipes_images.append(recipe_image)
 
         # Provide a Direct SDK with shared sysroots
@@ -1357,37 +1499,22 @@ def ide_setup(args, config, basepath, workspace):
     finally:
         tinfoil.shutdown()
 
+    bb_cmd = 'bitbake '
+    if args.bitbake_k:
+        bb_cmd += "-k "
+
     if not args.skip_bitbake:
-        bb_cmd = 'bitbake '
-        if args.bitbake_k:
-            bb_cmd += "-k "
-        bb_cmd_early = bb_cmd + ' '.join(bootstrap_tasks)
-        exec_build_env_command(
-            config.init_path, basepath, bb_cmd_early, watch=True)
-        if bootstrap_tasks_late:
-            bb_cmd_late = bb_cmd + ' '.join(bootstrap_tasks_late)
+        # Phase 1: build modified recipes and debug tools so that
+        # installed_binaries is populated and port numbers can be assigned.
+        # The image is built in phase 2, after the complete bbappend is written.
+        if bootstrap_tasks:
             exec_build_env_command(
-                config.init_path, basepath, bb_cmd_late, watch=True)
-
-    wants_gdbserver = any(
-        r.wants_gdbserver and r.toolchain == 'gcc'
-        for r in recipes_modified)
-    wants_lldb_server = any(
-        r.wants_gdbserver and r.toolchain == 'clang'
-        for r in recipes_modified)
-    for recipe_image in recipes_images:
-        if wants_gdbserver and recipe_image.gdbserver_missing:
-            logger.warning(
-                "gdbserver not installed in image %s. Remote debugging will not be available" % recipe_image)
-        if wants_lldb_server and recipe_image.lldb_server_missing:
-            logger.warning(
-                "lldb-server not installed in image %s. "
-                "Remote debugging with LLDB (CodeLLDB) will not be available. "
-                "Add 'lldb-server' to IMAGE_INSTALL." % recipe_image)
-
-        if (wants_gdbserver or wants_lldb_server) and recipe_image.combine_dbg_image is False:
-            logger.warning(
-                'IMAGE_CLASSES += "image-combined-dbg" is missing for image %s. Remote debugging will not find debug symbols from rootfs-dbg.' % recipe_image)
+                config.init_path, basepath,
+                bb_cmd + ' '.join(bootstrap_tasks), watch=True)
+        if bootstrap_tasks_late:
+            exec_build_env_command(
+                config.init_path, basepath,
+                bb_cmd + ' '.join(bootstrap_tasks_late), watch=True)
 
     # Instantiate the active IDE plugin
     ide = ide_plugins[args.ide]()
@@ -1408,6 +1535,39 @@ def ide_setup(args, config, basepath, workspace):
                     'You might want to add DEBUG_BUILD = "1" to %s. '
                     'Note that devtool modify --debug-build can do this automatically.',
                     recipe_modified.name, recipe_modified.bbappend)
+
+        # Ports are now assigned. Write the complete image bbappend in a
+        # single step so that the image is built with exactly one recipe
+        # hash. This avoids the sstate basehash-changed warnings that
+        # arise when the bbappend is modified after the image has
+        # already been built. This also runs with --skip-bitbake, otherwise
+        # the section removed by strip_bbappend_sections() would be lost.
+        bbappend_changed = False
+        for ri in recipes_images:
+            if ri.update_image_bbappend(recipes_modified):
+                bbappend_changed = True
+
+        if not args.skip_bitbake:
+            if image_bootstrap_tasks:
+                if bbappend_changed:
+                    # The bbappend content just written differs from the one
+                    # bitbake parsed during the tinfoil session above. With a
+                    # memory resident server that session's basehashes are
+                    # still cached, so reparsing would report "basehash value
+                    # changed ... not deterministic" for every task. Tell
+                    # bitbake the recipe intentionally changed by resetting the
+                    # cooker: this clears its basehash history.
+                    reparse_tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
+                    try:
+                        reparse_tinfoil.run_command('resetCooker')
+                        reparse_tinfoil.parse_recipes()
+                    finally:
+                        reparse_tinfoil.shutdown()
+
+                # Phase 2: build the image
+                exec_build_env_command(
+                    config.init_path, basepath,
+                    bb_cmd + ' '.join(image_bootstrap_tasks), watch=True)
     else:
         raise DevtoolError("Must not end up here.")
 
@@ -1483,7 +1643,8 @@ def register_commands(subparsers, context):
     parser_ide_sdk.add_argument(
         '-I', '--key', help='Specify ssh private key for connection to the target')
     parser_ide_sdk.add_argument(
-        '--skip-bitbake', help='Generate IDE configuration but skip calling bitbake to update the SDK', action='store_true')
+        '--skip-bitbake', help='Skip the bitbake builds which update the SDK. The recipes are still parsed, '
+        'the IDE configuration is generated from their metadata', action='store_true')
     parser_ide_sdk.add_argument(
         '-k', '--bitbake-k', help='Pass -k parameter to bitbake', action='store_true')
     parser_ide_sdk.add_argument(
-- 
2.55.0


