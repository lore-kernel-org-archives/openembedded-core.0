Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 89B5F77292
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 11:49:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Feb 2016 03:49:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,520,1449561600"; d="scan'208";a="897369248"
Received: from gtan23-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.53])
	by orsmga001.jf.intel.com with ESMTP; 29 Feb 2016 03:49:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 00:48:24 +1300
Message-Id: <e5702928e31f59c89e9fa6c7909d5312aa551da8.1456746435.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456746435.git.paul.eggleton@linux.intel.com>
References: <cover.1456746435.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456746435.git.paul.eggleton@linux.intel.com>
References: <cover.1456746435.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] recipetool: create: add support for out-of-tree kernel modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Feb 2016 11:49:09 -0000

Detect kernel modules by looking for #include <linux/module.h>, and
handle the various styles of Makefile that appear to be used. I was able
to use this code to successfully build a number of external kernel
modules I found.

Implements [YOCTO #8982].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_kmod.py | 152 ++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 scripts/lib/recipetool/create_kmod.py

diff --git a/scripts/lib/recipetool/create_kmod.py b/scripts/lib/recipetool/create_kmod.py
new file mode 100644
index 0000000..fe39edb
--- /dev/null
+++ b/scripts/lib/recipetool/create_kmod.py
@@ -0,0 +1,152 @@
+# Recipe creation tool - kernel module support plugin
+#
+# Copyright (C) 2016 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+import re
+import logging
+from recipetool.create import RecipeHandler, read_pkgconfig_provides, validate_pv
+
+logger = logging.getLogger('recipetool')
+
+tinfoil = None
+
+def tinfoil_init(instance):
+    global tinfoil
+    tinfoil = instance
+
+
+class KernelModuleRecipeHandler(RecipeHandler):
+    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
+        import bb.process
+        if 'buildsystem' in handled:
+            return False
+
+        module_inc_re = re.compile(r'^#include\s+<linux/module.h>$')
+        makefiles = []
+        is_module = False
+
+        makefiles = []
+
+        files = RecipeHandler.checkfiles(srctree, ['*.c', '*.h'], recursive=True)
+        if files:
+            for cfile in files:
+                # Look in same dir or parent for Makefile
+                for makefile in [os.path.join(os.path.dirname(cfile), 'Makefile'), os.path.join(os.path.dirname(os.path.dirname(cfile)), 'Makefile')]:
+                    if makefile in makefiles:
+                        break
+                    else:
+                        if os.path.exists(makefile):
+                            makefiles.append(makefile)
+                            break
+                else:
+                    continue
+                with open(cfile, 'r') as f:
+                    for line in f:
+                        if module_inc_re.match(line.strip()):
+                            is_module = True
+                            break
+                if is_module:
+                    break
+
+        if is_module:
+            classes.append('module')
+            handled.append('buildsystem')
+            # module.bbclass and the classes it inherits do most of the hard
+            # work, but we need to tweak it slightly depending on what the
+            # Makefile does (and there is a range of those)
+            # Check the makefile for the appropriate install target
+            install_lines = []
+            compile_lines = []
+            in_install = False
+            in_compile = False
+            install_target = None
+            with open(makefile, 'r') as f:
+                for line in f:
+                    if line.startswith('install:'):
+                        if not install_lines:
+                            in_install = True
+                            install_target = 'install'
+                    elif line.startswith('modules_install:'):
+                        install_lines = []
+                        in_install = True
+                        install_target = 'modules_install'
+                    elif line.startswith('modules:'):
+                        compile_lines = []
+                        in_compile = True
+                    elif line.startswith(('all:', 'default:')):
+                        if not compile_lines:
+                            in_compile = True
+                    elif line:
+                        if line[0] == '\t':
+                            if in_install:
+                                install_lines.append(line)
+                            elif in_compile:
+                                compile_lines.append(line)
+                        elif ':' in line:
+                            in_install = False
+                            in_compile = False
+
+            def check_target(lines, install):
+                kdirpath = ''
+                manual_install = False
+                for line in lines:
+                    splitline = line.split()
+                    if splitline[0] in ['make', 'gmake', '$(MAKE)']:
+                        if '-C' in splitline:
+                            idx = splitline.index('-C') + 1
+                            if idx < len(splitline):
+                                kdirpath = splitline[idx]
+                                break
+                    elif install and splitline[0] == 'install':
+                        if '.ko' in line:
+                            manual_install = True
+                return kdirpath, manual_install
+
+            kdirpath = None
+            manual_install = False
+            if install_lines:
+                kdirpath, manual_install = check_target(install_lines, install=True)
+            if compile_lines and not kdirpath:
+                kdirpath, _ = check_target(compile_lines, install=False)
+
+            if manual_install or not install_lines:
+                lines_after.append('EXTRA_OEMAKE_append_task-install = " -C ${STAGING_KERNEL_DIR} M=${S}"')
+            elif install_target and install_target != 'modules_install':
+                lines_after.append('MODULES_INSTALL_TARGET = "install"')
+
+            warnmsg = None
+            kdirvar = None
+            if kdirpath:
+                res = re.match(r'\$\(([^$)]+)\)', kdirpath)
+                if res:
+                    kdirvar = res.group(1)
+                    if kdirvar != 'KERNEL_SRC':
+                        lines_after.append('EXTRA_OEMAKE += "%s=${STAGING_KERNEL_DIR}"' % kdirvar)
+                elif kdirpath.startswith('/lib/'):
+                    warnmsg = 'Kernel path in install makefile is hardcoded - you will need to patch the makefile'
+            if not kdirvar and not warnmsg:
+                warnmsg = 'Unable to find means of passing kernel path into install makefile - if kernel path is hardcoded you will need to patch the makefile'
+            if warnmsg:
+                warnmsg += '. Note that the variable KERNEL_SRC will be passed in as the kernel source path.'
+                logger.warn(warnmsg)
+                lines_after.append('# %s' % warnmsg)
+
+            return True
+
+        return False
+
+def register_recipe_handlers(handlers):
+    handlers.append((KernelModuleRecipeHandler(), 15))
-- 
2.5.0


