Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 29FD16B8B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 18:13:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2014 11:13:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,895,1392192000"; d="scan'208";a="536721470"
Received: from bidesilv-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.159])
	by fmsmga001.fm.intel.com with ESMTP; 23 May 2014 11:13:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 May 2014 19:12:56 +0100
Message-Id: <d950571d0b7e7e3f2b0aada67a067be5871458d1.1400868743.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1400868743.git.paul.eggleton@linux.intel.com>
References: <cover.1400868743.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1400868743.git.paul.eggleton@linux.intel.com>
References: <cover.1400868743.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] scripts: consolidate code to find bitbake path
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
X-List-Received-Date: Fri, 23 May 2014 18:13:06 -0000

Several of these scripts were using duplicated code (and slightly
different methods) to find the path to bitbake and add its lib
subdirectory to the Python import path. Add some common code to do this
and change the scripts to use it.

Fixes [YOCTO #5076].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/bitbake-whatchanged                 | 18 ++++++-------
 scripts/buildhistory-diff                   | 28 +++++++++----------
 scripts/contrib/list-packageconfig-flags.py | 29 ++++++++------------
 scripts/lib/scriptpath.py                   | 42 +++++++++++++++++++++++++++++
 4 files changed, 74 insertions(+), 43 deletions(-)
 create mode 100644 scripts/lib/scriptpath.py

diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
index e4497e0..55cfe4b 100755
--- a/scripts/bitbake-whatchanged
+++ b/scripts/bitbake-whatchanged
@@ -27,17 +27,17 @@ import warnings
 import subprocess
 from optparse import OptionParser
 
-# Figure out where is the bitbake/lib/bb since we need bb.siggen and bb.process
-p = subprocess.Popen("bash -c 'echo $(dirname $(which bitbake-diffsigs | grep -v \'^alias\'))/../lib'",
-        shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+scripts_path = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])))
+lib_path = scripts_path + '/lib'
+sys.path = sys.path + [lib_path]
 
-err = p.stderr.read()
-if err:
-    print("ERROR: Failed to locate bitbake-diffsigs:", file=sys.stderr)
-    print(err, file=sys.stderr)
-    sys.exit(1)
+import scriptpath
 
-sys.path.insert(0, p.stdout.read().rstrip('\n'))
+# Figure out where is the bitbake/lib/bb since we need bb.siggen and bb.process
+bitbakepath = scriptpath.add_bitbake_lib_path()
+if not bitbakepath:
+    sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
+    sys.exit(1)
 
 import bb.siggen
 import bb.process
diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index ad50414..dfebcdd 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -50,24 +50,20 @@ def main():
         parser.print_help()
         sys.exit(1)
 
+    scripts_path = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])))
+    lib_path = scripts_path + '/lib'
+    sys.path = sys.path + [lib_path]
+
+    import scriptpath
+
     # Set path to OE lib dir so we can import the buildhistory_analysis module
-    basepath = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])) + '/..')
-    newpath = basepath + '/meta/lib'
+    scriptpath.add_oe_lib_path()
     # Set path to bitbake lib dir so the buildhistory_analysis module can load bb.utils
-    if os.path.exists(basepath + '/bitbake/lib/bb'):
-        bitbakepath = basepath + '/bitbake'
-    else:
-        # look for bitbake/bin dir in PATH
-        bitbakepath = None
-        for pth in os.environ['PATH'].split(':'):
-            if os.path.exists(os.path.join(pth, '../lib/bb')):
-                bitbakepath = os.path.abspath(os.path.join(pth, '..'))
-                break
-        if not bitbakepath:
-            sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
-            sys.exit(1)
-
-    sys.path[0:0] = [newpath, bitbakepath + '/lib']
+    bitbakepath = scriptpath.add_bitbake_lib_path()
+    if not bitbakepath:
+        sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
+        sys.exit(1)
+
     import oe.buildhistory_analysis
 
     fromrev = 'build-minus-1'
diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index 371033a..615f91f 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -23,26 +23,19 @@ import sys
 import getopt
 import os
 
-def search_bitbakepath():
-    bitbakepath = ""
-
-    # Search path to bitbake lib dir in order to load bb modules
-    if os.path.exists(os.path.join(os.path.dirname(sys.argv[0]), '../../bitbake/lib/bb')):
-        bitbakepath = os.path.join(os.path.dirname(sys.argv[0]), '../../bitbake/lib')
-        bitbakepath = os.path.abspath(bitbakepath)
-    else:
-        # Look for bitbake/bin dir in PATH
-        for pth in os.environ['PATH'].split(':'):
-            if os.path.exists(os.path.join(pth, '../lib/bb')):
-                bitbakepath = os.path.abspath(os.path.join(pth, '../lib'))
-                break
-        if not bitbakepath:
-            sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
-            sys.exit(1)
-    return bitbakepath
+
+scripts_path = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])))
+lib_path = os.path.abspath(scripts_path + '/../lib')
+sys.path = sys.path + [lib_path]
+
+import scriptpath
 
 # For importing the following modules
-sys.path.insert(0, search_bitbakepath())
+bitbakepath = scriptpath.add_bitbake_lib_path()
+if not bitbakepath:
+    sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
+    sys.exit(1)
+
 import bb.cache
 import bb.cooker
 import bb.providers
diff --git a/scripts/lib/scriptpath.py b/scripts/lib/scriptpath.py
new file mode 100644
index 0000000..d00317e
--- /dev/null
+++ b/scripts/lib/scriptpath.py
@@ -0,0 +1,42 @@
+# Path utility functions for OE python scripts
+#
+# Copyright (C) 2012-2014 Intel Corporation
+# Copyright (C) 2011 Mentor Graphics Corporation
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
+import sys
+import os
+import os.path
+
+def add_oe_lib_path():
+    basepath = os.path.abspath(os.path.dirname(__file__) + '/../..')
+    newpath = basepath + '/meta/lib'
+    sys.path.insert(0, newpath)
+
+def add_bitbake_lib_path():
+    basepath = os.path.abspath(os.path.dirname(__file__) + '/../..')
+    bitbakepath = None
+    if os.path.exists(basepath + '/bitbake/lib/bb'):
+        bitbakepath = basepath + '/bitbake'
+    else:
+        # look for bitbake/bin dir in PATH
+        for pth in os.environ['PATH'].split(':'):
+            if os.path.exists(os.path.join(pth, '../lib/bb')):
+                bitbakepath = os.path.abspath(os.path.join(pth, '..'))
+                break
+
+    if bitbakepath:
+        sys.path.insert(0, bitbakepath + '/lib')
+    return bitbakepath
-- 
1.9.0


