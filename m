Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C6090772C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 11:49:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Feb 2016 03:49:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,520,1449561600"; d="scan'208";a="897369260"
Received: from gtan23-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.53])
	by orsmga001.jf.intel.com with ESMTP; 29 Feb 2016 03:49:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 00:48:25 +1300
Message-Id: <5a4a208aecca25de2c902da035a37ba8b4ff369c.1456746435.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456746435.git.paul.eggleton@linux.intel.com>
References: <cover.1456746435.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456746435.git.paul.eggleton@linux.intel.com>
References: <cover.1456746435.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] recipetool: create: add basic support for generating linux kernel recipes
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
X-List-Received-Date: Mon, 29 Feb 2016 11:49:12 -0000

Add support for detecting a Linux kernel source tree and generating a
basic kernel recipe using meta-skeleton's linux-yocto-custom recipe as a
base.

Implements [YOCTO #8981].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_kernel.py | 99 +++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 scripts/lib/recipetool/create_kernel.py

diff --git a/scripts/lib/recipetool/create_kernel.py b/scripts/lib/recipetool/create_kernel.py
new file mode 100644
index 0000000..c6e86bd
--- /dev/null
+++ b/scripts/lib/recipetool/create_kernel.py
@@ -0,0 +1,99 @@
+# Recipe creation tool - kernel support plugin
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
+class KernelRecipeHandler(RecipeHandler):
+    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
+        import bb.process
+        if 'buildsystem' in handled:
+            return False
+
+        for tell in ['arch', 'firmware', 'Kbuild', 'Kconfig']:
+            if not os.path.exists(os.path.join(srctree, tell)):
+                return False
+
+        handled.append('buildsystem')
+        del lines_after[:]
+        del classes[:]
+        template = os.path.join(tinfoil.config_data.getVar('COREBASE', True), 'meta-skeleton', 'recipes-kernel', 'linux', 'linux-yocto-custom.bb')
+        def handle_var(varname, origvalue, op, newlines):
+            if varname in ['SRCREV', 'SRCREV_machine']:
+                while newlines[-1].startswith('#'):
+                    del newlines[-1]
+                try:
+                    stdout, _ = bb.process.run('git rev-parse HEAD', cwd=srctree, shell=True)
+                except bb.process.ExecutionError as e:
+                    stdout = None
+                if stdout:
+                    return stdout.strip(), op, 0, True
+            elif varname == 'LINUX_VERSION':
+                makefile = os.path.join(srctree, 'Makefile')
+                if os.path.exists(makefile):
+                    kversion = -1
+                    kpatchlevel = -1
+                    ksublevel = -1
+                    kextraversion = ''
+                    with open(makefile, 'r') as f:
+                        for i, line in enumerate(f):
+                            if i > 10:
+                                break
+                            if line.startswith('VERSION ='):
+                                kversion = int(line.split('=')[1].strip())
+                            elif line.startswith('PATCHLEVEL ='):
+                                kpatchlevel = int(line.split('=')[1].strip())
+                            elif line.startswith('SUBLEVEL ='):
+                                ksublevel = int(line.split('=')[1].strip())
+                            elif line.startswith('EXTRAVERSION ='):
+                                kextraversion = line.split('=')[1].strip()
+                    version = ''
+                    if kversion > -1 and kpatchlevel > -1:
+                        version = '%d.%d' % (kversion, kpatchlevel)
+                        if ksublevel > -1:
+                            version += '.%d' % ksublevel
+                        version += kextraversion
+                    if version:
+                        return version, op, 0, True
+            elif varname == 'SRC_URI':
+                while newlines[-1].startswith('#'):
+                    del newlines[-1]
+            elif varname == 'COMPATIBLE_MACHINE':
+                while newlines[-1].startswith('#'):
+                    del newlines[-1]
+                machine = tinfoil.config_data.getVar('MACHINE', True)
+                return machine, op, 0, True
+            return origvalue, op, 0, True
+        with open(template, 'r') as f:
+            varlist = ['SRCREV', 'SRCREV_machine', 'SRC_URI', 'LINUX_VERSION', 'COMPATIBLE_MACHINE']
+            (_, newlines) = bb.utils.edit_metadata(f, varlist, handle_var)
+        lines_before[:] = [line.rstrip('\n') for line in newlines]
+
+        return True
+
+def register_recipe_handlers(handlers):
+    handlers.append((KernelRecipeHandler(), 100))
-- 
2.5.0


