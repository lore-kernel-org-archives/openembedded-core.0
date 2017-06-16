Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C43B3784B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:21:23 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 06:21:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="275101114"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2017 06:21:24 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id C07A7580399
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 06:21:23 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 16:19:27 +0300
Message-Id: <1f95bca594c60e29c5b9ca140ddbed58be7c4cf2.1497618833.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497618833.git.ed.bartosh@linux.intel.com>
References: <cover.1497618833.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/4] runner.py: move runtool API to misc.py
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
X-List-Received-Date: Fri, 16 Jun 2017 13:21:24 -0000

Moved remaining API to misc.py.
Removed runner.py.

Now misc.py is ready to be moved to the scripts/lib/wic and
utils directory can be removed.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/misc.py   | 39 ++++++++++++++++++++++++++++---
 scripts/lib/wic/utils/runner.py | 52 -----------------------------------------
 2 files changed, 36 insertions(+), 55 deletions(-)
 delete mode 100644 scripts/lib/wic/utils/runner.py

diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index 4609984..e1df824 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -29,12 +29,12 @@
 import logging
 import os
 import re
+import subprocess
 
 from collections import defaultdict
 from distutils import spawn
 
 from wic import WicError
-from wic.utils import runner
 
 logger = logging.getLogger('wic')
 
@@ -59,6 +59,39 @@ NATIVE_RECIPES = {"bmaptool": "bmap-tools",
                   "syslinux": "syslinux"
                  }
 
+def runtool(cmdln_or_args):
+    """ wrapper for most of the subprocess calls
+    input:
+        cmdln_or_args: can be both args and cmdln str (shell=True)
+    return:
+        rc, output
+    """
+    if isinstance(cmdln_or_args, list):
+        cmd = cmdln_or_args[0]
+        shell = False
+    else:
+        import shlex
+        cmd = shlex.split(cmdln_or_args)[0]
+        shell = True
+
+    sout = subprocess.PIPE
+    serr = subprocess.STDOUT
+
+    try:
+        process = subprocess.Popen(cmdln_or_args, stdout=sout,
+                                   stderr=serr, shell=shell)
+        sout, serr = process.communicate()
+        # combine stdout and stderr, filter None out and decode
+        out = ''.join([out.decode('utf-8') for out in [sout, serr] if out])
+    except OSError as err:
+        if err.errno == 2:
+            # [Errno 2] No such file or directory
+            raise WicError('Cannot run command: %s, lost dependency?' % cmd)
+        else:
+            raise # relay
+
+    return process.returncode, out
+
 def _exec_cmd(cmd_and_args, as_shell=False):
     """
     Execute command, catching stderr, stdout
@@ -70,9 +103,9 @@ def _exec_cmd(cmd_and_args, as_shell=False):
     logger.debug(args)
 
     if as_shell:
-        ret, out = runner.runtool(cmd_and_args)
+        ret, out = runtool(cmd_and_args)
     else:
-        ret, out = runner.runtool(args)
+        ret, out = runtool(args)
     out = out.strip()
     if ret != 0:
         raise WicError("_exec_cmd: %s returned '%s' instead of 0\noutput: %s" % \
diff --git a/scripts/lib/wic/utils/runner.py b/scripts/lib/wic/utils/runner.py
deleted file mode 100644
index 4aa00fb..0000000
--- a/scripts/lib/wic/utils/runner.py
+++ /dev/null
@@ -1,52 +0,0 @@
-#!/usr/bin/env python -tt
-#
-# Copyright (c) 2011 Intel, Inc.
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by the Free
-# Software Foundation; version 2 of the License
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc., 59
-# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
-import subprocess
-
-from wic import WicError
-
-def runtool(cmdln_or_args):
-    """ wrapper for most of the subprocess calls
-    input:
-        cmdln_or_args: can be both args and cmdln str (shell=True)
-    return:
-        rc, output
-    """
-    if isinstance(cmdln_or_args, list):
-        cmd = cmdln_or_args[0]
-        shell = False
-    else:
-        import shlex
-        cmd = shlex.split(cmdln_or_args)[0]
-        shell = True
-
-    sout = subprocess.PIPE
-    serr = subprocess.STDOUT
-
-    try:
-        process = subprocess.Popen(cmdln_or_args, stdout=sout,
-                                   stderr=serr, shell=shell)
-        sout, serr = process.communicate()
-        # combine stdout and stderr, filter None out and decode
-        out = ''.join([out.decode('utf-8') for out in [sout, serr] if out])
-    except OSError as err:
-        if err.errno == 2:
-            # [Errno 2] No such file or directory
-            raise WicError('Cannot run command: %s, lost dependency?' % cmd)
-        else:
-            raise # relay
-
-    return process.returncode, out
-- 
2.1.4


