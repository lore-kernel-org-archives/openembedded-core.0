Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AB2E8B37C
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 22:22:02 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6175.1770157316146480486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 14:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=IA2UJxza;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20260203222154cb51fb32890002072d-_yxrdu@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260203222154cb51fb32890002072d
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Feb 2026 23:21:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FD/GiPLj6YlbUnW/TzRNOae6+QK0ApT19VPzQZ1jMxo=;
 b=IA2UJxzaCjhCdMU0hl2Wc6EnKf6IJv8xKg2+qu06k+CzEft1YYtfwcRgmmAxOgYdnw9PRJ
 kTQFbtYnvOyxmcyZQb2cx0Yj/j50q482oBfwMNo4RgwKBrKMjw+P/4axmhU9USrD8FfULyJu
 0goVp0K4UCyQnD2v1DkPVXf7ShBkVZ6hi8y6BOXxgCgoOuWixZgcXs+dGaGuR370NoGduZwZ
 Kp5bKbp1l9nh/4eOjQevPDMqAm47Ur3shXHYUa05CT6jmJawicN5ePVXbgdZEVWQTGslU4zi
 Q/OR1pTAmRsnL+hDRh7o8JY23mO5UMszCOaORdFcwTcUGjuOrdUpuKIA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 10/12] devtool: ide-sdk: evaluate DEBUG_PREFIX_MAP
Date: Tue,  3 Feb 2026 23:16:26 +0100
Message-ID: <20260203222139.1599349-11-adrian.freihofer@siemens.com>
In-Reply-To: <20260203222139.1599349-1-adrian.freihofer@siemens.com>
References: <20260203222139.1599349-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 22:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230477

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Improve the reverse mapping for searching the source files for remote
debugging by taking the details from DEBUG_PREFIX_MAP into account when
generating GDB's debug-file-directory mappings. This allows settings
such as DEBUG_PREFIX_MAP = "" for modified recipes to be used to avoid
any path remapping.

Background:
For packaged debug-symbols, the references to the source code need to be
relocated to paths which are valid on the target system. By default,
devtool ide-sdk tries to keep the relocated paths and configures the
debugger to reverse map them back to the original source paths. The goal
is to provide a debug setup which is a close as possible to a regular
build.

Usually this works well, but there are situations where the reverse
mapping is not unambiguous. For example the default DEBUG_PREFIX_MAP

 DEBUG_PREFIX_MAP ?= "\
 -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
 -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} \

adds two different source paths (${S} and ${B}) to the same target path
(${TARGET_DBGSRC_DIR}). If both source paths contain files with the same
name, the debugger cannot determine which source file to use. For this
example it is usually sufficient to only map ${S} to the target path.
The source files in ${B} are probably a few generated files which are
not that interesting for debugging. But depending on the project, the
files in ${B} might also be relevant for debugging.

Also add a hint to the generated local.conf snippet to use
DEBUG_PREFIX_MAP = "" if the user wants to optimize the build for
debugging.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 26 +++++---
 scripts/lib/devtool/ide_plugins/ide_none.py | 28 ++++----
 scripts/lib/devtool/ide_sdk.py              | 73 ++++++++++++++++++++-
 scripts/lib/devtool/standard.py             |  7 +-
 4 files changed, 111 insertions(+), 23 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 05d513f160..647a5b8cc6 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -266,18 +266,26 @@ class IdeVSCode(IdeBase):
             launch_config['additionalSOLibSearchPath'] = modified_recipe.solib_search_path_str(
                 gdb_cross_config.image_recipe)
             # First: Search for sources of this recipe in the workspace folder
-            if modified_recipe.pn in modified_recipe.target_dbgsrc_dir:
-                src_file_map[modified_recipe.target_dbgsrc_dir] = "${workspaceFolder}"
-            else:
-                logger.error(
-                    "TARGET_DBGSRC_DIR must contain the recipe name PN.")
+            # If compiled with DEBUG_PREFIX_MAP = "", no reverse map is is needed. The binaries
+            # contain the full path to the source files. But by default there is a reverse map.
+            for target_path, host_path in modified_recipe.reverse_debug_prefix_map.items():
+                if host_path.startswith(modified_recipe.real_srctree):
+                    src_file_map[target_path] = "${workspaceFolder}" + host_path[len(modified_recipe.real_srctree):]
+                else:
+                    src_file_map[target_path] = host_path
+
             # Second: Search for sources of other recipes in the rootfs-dbg
-            if modified_recipe.target_dbgsrc_dir.startswith("/usr/src/debug"):
+            # We expect that /usr/src/debug/${PN}/${PV} or no mapping is used for the recipes
+            # own sources and we can use the key "/usr/src/debug" for the rootfs-dbg.
+            if "/usr/src/debug" in src_file_map:
+                logger.error(
+                    'Key "/usr/src/debug" already exists in src_file_map. '
+                    'Something with DEBUG_PREFIX_MAP looks unexpected and finding '
+                    'sources in the rootfs-dbg will not work as expected.'
+                )
+            else:
                 src_file_map["/usr/src/debug"] = os.path.join(
                     gdb_cross_config.image_recipe.rootfs_dbg, "usr", "src", "debug")
-            else:
-                logger.error(
-                    "TARGET_DBGSRC_DIR must start with /usr/src/debug.")
         else:
             logger.warning(
                 "Cannot setup debug symbols configuration for GDB. IMAGE_GEN_DEBUGFS is not enabled.")
diff --git a/scripts/lib/devtool/ide_plugins/ide_none.py b/scripts/lib/devtool/ide_plugins/ide_none.py
index 8284c4e0a5..ba65f6f7da 100644
--- a/scripts/lib/devtool/ide_plugins/ide_none.py
+++ b/scripts/lib/devtool/ide_plugins/ide_none.py
@@ -78,19 +78,25 @@ class GdbCrossConfigNone(GdbCrossConfig):
                              os.path.join(self.modified_recipe.recipe_sysroot, 'usr', 'include') + '"')
         if self.image_recipe.rootfs_dbg:
             # First: Search for sources of this recipe in the workspace folder
-            if self.modified_recipe.pn in self.modified_recipe.target_dbgsrc_dir:
-                gdbinit_lines.append('set substitute-path "%s" "%s"' %
-                                     (self.modified_recipe.target_dbgsrc_dir, self.modified_recipe.real_srctree))
-            else:
-                logger.error(
-                    "TARGET_DBGSRC_DIR must contain the recipe name PN.")
+            # If compiled with DEBUG_PREFIX_MAP = "", no reverse map is is needed. The binaries
+            # contain the full path to the source files. But by default there is a reverse map.
+            src_file_map = dict(self.modified_recipe.reverse_debug_prefix_map)
+
             # Second: Search for sources of other recipes in the rootfs-dbg
-            if self.modified_recipe.target_dbgsrc_dir.startswith("/usr/src/debug"):
-                gdbinit_lines.append('set substitute-path "/usr/src/debug" "%s"' % os.path.join(
-                    self.image_recipe.rootfs_dbg, "usr", "src", "debug"))
-            else:
+            # We expect that /usr/src/debug/${PN}/${PV} or no mapping is used for the recipes
+            # own sources and we can use the key "/usr/src/debug" for the rootfs-dbg.
+            if "/usr/src/debug" in src_file_map:
                 logger.error(
-                    "TARGET_DBGSRC_DIR must start with /usr/src/debug.")
+                    'Key "/usr/src/debug" already exists in src_file_map. '
+                    'Something with DEBUG_PREFIX_MAP looks unexpected and finding sources '
+                    'in the rootfs-dbg will not work as expected.'
+                )
+            else:
+                src_file_map["/usr/src/debug"] = os.path.join(
+                    self.image_recipe.rootfs_dbg, "usr", "src", "debug")
+
+            for target_path, host_path in src_file_map.items():
+                gdbinit_lines.append('set substitute-path "%s" "%s"' % (target_path, host_path))
         else:
             logger.warning(
                 "Cannot setup debug symbols configuration for GDB. IMAGE_GEN_DEBUGFS is not enabled.")
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 96d60ad4f1..78d7ed78c6 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -14,6 +14,7 @@ import shutil
 import stat
 import subprocess
 import sys
+import shlex
 from argparse import RawTextHelpFormatter
 from enum import Enum
 
@@ -397,6 +398,7 @@ class RecipeModified:
         self.bpn = None
         self.d = None
         self.debug_build = None
+        self.reverse_debug_prefix_map = {}
         self.fakerootcmd = None
         self.fakerootenv = None
         self.libdir = None
@@ -408,10 +410,10 @@ class RecipeModified:
         self.recipe_id = None
         self.recipe_sysroot = None
         self.recipe_sysroot_native = None
+        self.s = None
         self.staging_incdir = None
         self.strip_cmd = None
         self.target_arch = None
-        self.target_dbgsrc_dir = None
         self.topdir = None
         self.workdir = None
         # Service management
@@ -479,13 +481,13 @@ class RecipeModified:
             recipe_d.getVar('RECIPE_SYSROOT'))
         self.recipe_sysroot_native = os.path.realpath(
             recipe_d.getVar('RECIPE_SYSROOT_NATIVE'))
+        self.s = recipe_d.getVar('S')
         self.staging_bindir_toolchain = os.path.realpath(
             recipe_d.getVar('STAGING_BINDIR_TOOLCHAIN'))
         self.staging_incdir = os.path.realpath(
             recipe_d.getVar('STAGING_INCDIR'))
         self.strip_cmd = recipe_d.getVar('STRIP')
         self.target_arch = recipe_d.getVar('TARGET_ARCH')
-        self.target_dbgsrc_dir = recipe_d.getVar('TARGET_DBGSRC_DIR')
         self.topdir = recipe_d.getVar('TOPDIR')
         self.workdir = os.path.realpath(recipe_d.getVar('WORKDIR'))
 
@@ -504,6 +506,9 @@ class RecipeModified:
             self.meson_cross_file = recipe_d.getVar('MESON_CROSS_FILE')
             self.build_tool = BuildTool.MESON
 
+        self.reverse_debug_prefix_map = self._init_reverse_debug_prefix_map(
+            recipe_d.getVar('DEBUG_PREFIX_MAP'))
+
         # Recipe ID is the identifier for IDE config sections
         self.recipe_id = self.bpn + "-" + self.package_arch
         self.recipe_id_pretty = self.bpn + ": " + self.package_arch
@@ -563,6 +568,70 @@ class RecipeModified:
         """Return a : separated list of paths usable by GDB's set solib-search-path"""
         return ':'.join(self.solib_search_path(image))
 
+    def _init_reverse_debug_prefix_map(self, debug_prefix_map):
+        """Parses GCC map options and returns a mapping of target to host paths.
+
+        This function scans a string containing GCC options such as -fdebug-prefix-map,
+        -fmacro-prefix-map, and -ffile-prefix-map (in both '--option value' and '--option=value'
+        forms), extracting all mappings from target paths (used in debug info) to host source
+        paths. If multiple mappings for the same target path are found, the most suitable
+        host path is selected (preferring 'sources' over 'build' directories).
+        """
+        prefixes = ("-fdebug-prefix-map", "-fmacro-prefix-map", "-ffile-prefix-map")
+        all_mappings = {}
+        args = shlex.split(debug_prefix_map)
+        i = 0
+
+        # Collect all mappings, storing potentially multiple host paths per target path
+        while i < len(args):
+            arg = args[i]
+            mapping = None
+            for prefix in prefixes:
+                if arg == prefix:
+                    i += 1
+                    mapping = args[i]
+                    break
+                elif arg.startswith(prefix + '='):
+                    mapping = arg[len(prefix)+1:]
+                    break
+            if mapping:
+                host_path, target_path = mapping.split('=', 1)
+                if target_path:
+                    if target_path not in all_mappings:
+                        all_mappings[target_path] = []
+                    all_mappings[target_path].append(os.path.realpath(host_path))
+            i += 1
+
+        # Select the best host path for each target path (only 1:1 mappings are supported by GDB)
+        mappings = {}
+        unused_host_paths = []
+        for target_path, host_paths in all_mappings.items():
+            if len(host_paths) == 1:
+                mappings[target_path] = host_paths[0]
+            else:
+                # First priority path for sources is the source directory S
+                # Second priority path is any other directory
+                # Least priority is the build directory B, which probably contains only generated source files
+                sources_paths = [path for path in host_paths if os.path.realpath(path).startswith(os.path.realpath(self.s))]
+                if sources_paths:
+                    mappings[target_path] = sources_paths[0]
+                    unused_host_paths.extend([path for path in host_paths if path != sources_paths[0]])
+                else:
+                    # If no 'sources' path, prefer non-'build' paths
+                    non_build_paths = [path for path in host_paths if not os.path.realpath(path).startswith(os.path.realpath(self.b))]
+                    if non_build_paths:
+                        mappings[target_path] = non_build_paths[0]
+                        unused_host_paths.extend([path for path in host_paths if path != non_build_paths[0]])
+                    else:
+                        # Fall back to first path if all are build paths
+                        mappings[target_path] = host_paths[0]
+                        unused_host_paths.extend(host_paths[1:])
+
+        if unused_host_paths:
+            logger.info("Some source directories mapped by -fdebug-prefix-map are not included in the debugger search paths. Ignored host paths: %s", unused_host_paths)
+
+        return mappings
+
     def __init_exported_variables(self, d):
         """Find all variables with export flag set.
 
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1fd5947c41..f4d5d7cd3f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -971,7 +971,12 @@ def modify(args, config, basepath, workspace):
                         continue
                     f.write('# patches_%s: %s\n' % (branch, ','.join(branch_patches[branch])))
             if args.debug_build:
-                f.write('\nDEBUG_BUILD = "1"\n')
+                f.write('\n# Optimize for debugging. Use e.g. -Og instead of -O2\n')
+                f.write('DEBUG_BUILD = "1"\n')
+                f.write('\n# Keep the paths to the source files for remote debugging\n')
+                f.write('# DEBUG_PREFIX_MAP = ""\n')
+                f.write('# WARN_QA:remove = "buildpaths"\n')
+                f.write('# ERROR_QA:remove = "buildpaths"\n')
 
         update_unlockedsigs(basepath, workspace, args.fixed_setup, [pn])
 
-- 
2.52.0


