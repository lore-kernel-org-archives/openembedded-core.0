Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8840373163
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 04:44:43 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2016 21:44:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,599,1455004800"; d="scan'208";a="99608786"
Received: from hschan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.140.99])
	by fmsmga004.fm.intel.com with ESMTP; 08 May 2016 21:44:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 16:43:27 +1200
Message-Id: <85ffd927c7834f4111ae1740b8aad5a9c444b7aa.1462768634.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462768634.git.paul.eggleton@linux.intel.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1462768634.git.paul.eggleton@linux.intel.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [RFC PATCH 1/6] classes/kernel-check: add a class to check kernel config options
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
X-List-Received-Date: Mon, 09 May 2016 04:44:45 -0000

Some user-space software has specific requirements about the kernel
configuration options selected. This class allows a recipe to explicitly
state the kernel configuration options it needs (through a
REQUIRED_KERNEL_OPTIONS variable). This is a space separated list, where
each item is one of:
  (a) an option name (e.g. CONFIG_FHANDLE, in which case CONFIG_FHANDLE
      must be set to y or m to match)
  (b) optionname=value (e.g. CONFIG_FHANDLE=y, in which case
      CONFIG_FHANDLE must be set to y). If the specified value is n,
      it will also match if the option is not present.
  (c) optionname1|optionname2|... (e.g.
      CONFIG_EXT2_FS|CONFIG_EXT4_USE_FOR_EXT23, meaning that either
      CONFIG_EXT2_FS or CONFIG_EXT4_USE_FOR_EXT23 must be set to y or
      m to match).

Inheriting the class will also add a dependency from do_configure on
virtual/kernel:do_shared_workdir so that the kernel config is there to
check. If one or more items are not matched, then a warning will be
printed at do_configure time. (This is a warning rather than an error
in case you are using linux-dummy with an externally built kernel).

A separate function is also provided should you wish to check a config
option from python code - but note you must only call this in a place
where you can guarantee that the kernel config has been written to the
sysroot (i.e. from a task that has virtual/kernel:do_shared_workdir in
its depends varflag value).

Fixes [YOCTO #5574].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/kernel-check.bbclass | 97 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 meta/classes/kernel-check.bbclass

diff --git a/meta/classes/kernel-check.bbclass b/meta/classes/kernel-check.bbclass
new file mode 100644
index 0000000..d202f4e
--- /dev/null
+++ b/meta/classes/kernel-check.bbclass
@@ -0,0 +1,97 @@
+# Provides a means of checking within a recipe if particular kernel
+# config options are enabled
+#
+# Copyright (C) 2016 Intel Corporation
+#
+# Example usage (within a recipe):
+#
+# inherit kernel-check
+# REQUIRED_KERNEL_OPTIONS = "CONFIG_CGROUPS CONFIG_NAMESPACES"
+#
+# If one or more of the options aren't in the built kernel configuration
+# you will get a warning at do_configure time.
+#
+# You can also use the check_kernel_config_options() function to do
+# explicit checks yourself (and perform a different action).
+
+def check_kernel_config_options(options, d):
+    """
+    A function you can use to do explicit checks for kernel config
+    options from python code
+    """
+
+    if isinstance(options, basestring):
+        required = options.split()
+    else:
+        required = options[:]
+    missing = []
+    diffvalue = []
+    if required:
+        with open(d.expand('${STAGING_KERNEL_BUILDDIR}/.config'), 'r') as f:
+            for line in f:
+                if line.startswith('#'):
+                    continue
+                linesplit = line.rstrip().split('=', 1)
+                if len(linesplit) < 2:
+                    continue
+                linevalue = linesplit[1]
+                for req in required:
+                    found = False
+                    if '|' in req:
+                        for reqitem in req.split('|'):
+                            if reqitem == linesplit[0]:
+                                if linevalue in ['y', 'm']:
+                                    found = True
+                                    break
+                    else:
+                        reqsplit = req.split('=', 1)
+                        # Can check for CONFIG_OPTION or CONFIG_OPTION=value
+                        if len(reqsplit) > 1:
+                            reqvalue = reqsplit[1]
+                        else:
+                            reqvalue = None
+                        if reqsplit[0] == linesplit[0]:
+                            if reqvalue is None:
+                                if linevalue not in ['y', 'm']:
+                                    diffvalue.append((reqsplit[0], 'y or m', linevalue))
+                            elif reqvalue.strip("'\"") != linevalue.strip("'\""):
+                                diffvalue.append((reqsplit[0], reqvalue, linevalue))
+                            found = True
+
+                    if found:
+                        required.remove(req)
+                        break
+
+        for req in required:
+            reqsplit = req.split('=', 1)
+            if len(reqsplit) > 1:
+                if reqsplit[1] == 'n':
+                    continue
+                missing.append('%s=%s' % reqsplit)
+            else:
+                missing.append('%s' % req)
+
+    return missing, diffvalue
+
+
+python check_kernel_config() {
+    pn = d.getVar('PN', True)
+    required = d.getVar('REQUIRED_KERNEL_OPTIONS', True) or ''
+    if ' | ' in required:
+        bb.error('Invalid REQUIRED_KERNEL_OPTIONS value - cannot have spaces around |')
+    if ' = ' in required:
+        bb.error('Invalid REQUIRED_KERNEL_OPTIONS value - cannot have spaces around =')
+    missing, diffvalue = check_kernel_config_options(required, d)
+    if missing or diffvalue:
+        reqstr = '\n  '.join(missing + ['%s=%s (actual value %s)' % item for item in diffvalue])
+        # Just warn here for cases like linux-dummy where we don't actually
+        # know the final config
+        bb.warn('The kernel you are building against is missing the following required configuration options:\n  %s' % reqstr)
+}
+
+python() {
+    if d.getVar('REQUIRED_KERNEL_OPTIONS', True):
+        d.appendVar('DEPENDS', ' virtual/kernel')
+        d.appendVarFlag('do_configure', 'prefuncs', ' check_kernel_config')
+        d.appendVarFlag('do_configure', 'depends', ' virtual/kernel:do_shared_workdir')
+}
-- 
2.5.5


