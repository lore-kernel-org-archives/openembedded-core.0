Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD897E8B370
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 22:22:01 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6009.1770157316111104452
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 14:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=c1qrNDYK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-2026020322215407a3611e5b000207b2-vptla4@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026020322215407a3611e5b000207b2
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Feb 2026 23:21:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Pb2CVcyi2Tbrb0594k8JqqK8GfbvknijF9X1OmF2Zjo=;
 b=c1qrNDYK4v7xqfE845U7jenu6emfKtTDq3bbaQBB+PtSLVx2dt4RiuPSAc+zYCc0X85bEB
 yWxAkeCCDTZckYOmRe/z/TwtECsPcKxBGo7WnloG/wHd1WjauP6b/sqTd3TlXZaXiz4EYZpT
 NTTUDOMVhOtQ1bO3Kfy4+FpY6tl52QGrtGa0ZIVt2yjkH2pilV4CxYNXo9AoKgPwHSePH/Fy
 rM46TguGUDl8jRwkpvigoo5qxR08AKwcNESMR6nzb0+OdvJM5u2Sofx9yJg+2C5k/mYwO/HQ
 QG20jKdlOLQsd5qR4Egp8D51jivW/uUtkxN3UhLK1ZmfDIM4fNgJVCdA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 12/12] devtool: ide-sdk: Support GDB pretty-printing for C++ STL types
Date: Tue,  3 Feb 2026 23:16:28 +0100
Message-ID: <20260203222139.1599349-13-adrian.freihofer@siemens.com>
In-Reply-To: <20260203222139.1599349-1-adrian.freihofer@siemens.com>
References: <20260203222139.1599349-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 22:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230486

From: Adrian Freihofer <adrian.freihofer@siemens.com>

GDB requires Python scripts provided by GCC to properly display C++ STL
types. This commit adds support for configuring GDB to use these
pretty-printers in the ide-sdk, covering both the ide_none and ide_code
plugins.

The implementation locates the GCC Python helper scripts in the sysroot
and injects the necessary commands into the GDB initialization files and
IDE debug configurations. This ensures that when debugging C++
applications, STL containers and other complex types are displayed in a
readable format.

Without this:
  (gdb) print numbers
  $1 = {<std::_Vector_base<int, std::allocator<int> >> = {
    _M_impl = {<std::allocator<int>> = {<std::__new_allocator<int>> =
    {<No data fields>}, <No data fields>}, <std::_Vector_base<int,
    std::allocator<int> >::_Vector_impl_data> =
    {_M_start = 0x55555556c370, _M_finish = 0x55555556c37c,
        _M_end_of_storage = 0x55555556c37c}, <No data fields>}},
        <No data fields>}

With this:
  (gdb) print numbers
  $1 = std::vector of length 3, capacity 3 = {1, 2, 3}

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 14 +++++++++++
 scripts/lib/devtool/ide_plugins/ide_none.py |  8 +++++++
 scripts/lib/devtool/ide_sdk.py              | 26 +++++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 647a5b8cc6..c2ee9b91c6 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -290,6 +290,20 @@ class IdeVSCode(IdeBase):
             logger.warning(
                 "Cannot setup debug symbols configuration for GDB. IMAGE_GEN_DEBUGFS is not enabled.")
 
+        # Enable pretty-printing for gdb for resolving STL types with help of python scripts
+        pretty_printing_cmd = modified_recipe.gdb_pretty_print_scripts
+        if pretty_printing_cmd:
+            setup_commands += [
+                {
+                    "description": "Enable pretty-printing for gdb",
+                    "text": "python " +";".join(pretty_printing_cmd)
+                },
+                {
+                    "description": "Enable pretty-printing for gdb",
+                    "text": "-enable-pretty-printing"
+                }
+            ]
+
         launch_config['sourceFileMap'] = src_file_map
         launch_config['setupCommands'] = setup_commands
 
diff --git a/scripts/lib/devtool/ide_plugins/ide_none.py b/scripts/lib/devtool/ide_plugins/ide_none.py
index ba65f6f7da..ed96afa33c 100644
--- a/scripts/lib/devtool/ide_plugins/ide_none.py
+++ b/scripts/lib/devtool/ide_plugins/ide_none.py
@@ -102,6 +102,14 @@ class GdbCrossConfigNone(GdbCrossConfig):
                 "Cannot setup debug symbols configuration for GDB. IMAGE_GEN_DEBUGFS is not enabled.")
         # Disable debuginfod for now, the IDE configuration uses rootfs-dbg from the image workdir.
         gdbinit_lines.append('set debuginfod enabled off')
+
+        # Enable pretty-printing for gdb for resolving STL types with help of python scripts
+        pretty_printing_cmd = self.modified_recipe.gdb_pretty_print_scripts
+        if pretty_printing_cmd:
+            gdbinit_lines.append(os.linesep +"python")
+            gdbinit_lines += pretty_printing_cmd
+            gdbinit_lines.append("end" + os.linesep)
+
         gdbinit_lines.append(
             '%s %s:%d' % (remote_cmd, self.gdb_cross.host, self.gdbserver_port))
         gdbinit_lines.append('set remote exec-file ' + self.binary.binary_path)
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 78d7ed78c6..ba225f20b9 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -15,6 +15,7 @@ import stat
 import subprocess
 import sys
 import shlex
+import glob
 from argparse import RawTextHelpFormatter
 from enum import Enum
 
@@ -414,6 +415,7 @@ class RecipeModified:
         self.staging_incdir = None
         self.strip_cmd = None
         self.target_arch = None
+        self.tcoverride = None
         self.topdir = None
         self.workdir = None
         # Service management
@@ -437,6 +439,7 @@ class RecipeModified:
 
         # Populated after bitbake built all the recipes
         self._installed_binaries = None
+        self._gdb_pretty_print_scripts = None
 
     def initialize(self, config, workspace, tinfoil):
         recipe_d = parse_recipe(
@@ -488,6 +491,7 @@ class RecipeModified:
             recipe_d.getVar('STAGING_INCDIR'))
         self.strip_cmd = recipe_d.getVar('STRIP')
         self.target_arch = recipe_d.getVar('TARGET_ARCH')
+        self.tcoverride = recipe_d.getVar('TCOVERRIDE')
         self.topdir = recipe_d.getVar('TOPDIR')
         self.workdir = os.path.realpath(recipe_d.getVar('WORKDIR'))
 
@@ -632,6 +636,28 @@ class RecipeModified:
 
         return mappings
 
+    @property
+    def gdb_pretty_print_scripts(self):
+        if self._gdb_pretty_print_scripts is None:
+            if self.tcoverride == "toolchain-gcc":
+                gcc_python_helpers_pattern = os.path.join(self.recipe_sysroot, "usr", "share", "gcc-*", "python")
+                gcc_python_helpers_dirs = glob.glob(gcc_python_helpers_pattern)
+                if gcc_python_helpers_dirs:
+                    gcc_python_helpers = gcc_python_helpers_dirs[0]
+                else:
+                    logger.warning("Could not find gcc python helpers directory matching: %s", gcc_python_helpers_pattern)
+                    gcc_python_helpers = ""
+                pretty_print_scripts = [
+                    "import sys",
+                    "sys.path.insert(0, '" + gcc_python_helpers + "')",
+                    "from libstdcxx.v6.printers import register_libstdcxx_printers",
+                    "register_libstdcxx_printers(None)"
+                ]
+                self._gdb_pretty_print_scripts = pretty_print_scripts
+            else:
+                self._gdb_pretty_print_scripts = ""
+        return self._gdb_pretty_print_scripts
+
     def __init_exported_variables(self, d):
         """Find all variables with export flag set.
 
-- 
2.52.0


