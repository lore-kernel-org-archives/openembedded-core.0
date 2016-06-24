Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AB06970018
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:37:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410336"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:37:52 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:21 +0300
Message-Id: <1466764661-24544-9-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 08/28] oeqa.buildperf: functionality to drop kernel caches
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
X-List-Received-Date: Fri, 24 Jun 2016 10:37:53 -0000

Add a new utility class for dropping Linux kernel caches.  It uses sudo
and tee to write to the drop_caches file. Checking if the user has the
permissions to drop caches (without a password) is done by trying to
writing an invalid value to the drop_caches file. This way, we will find
if writing (with tee) is possible but not really dropping caches, yet.

User can avoid giving the password by adding something like:
<user> ALL = NOPASSWD: /usr/bin/tee /proc/sys/vm/drop_caches
to the system sudoers file.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/__init__.py |  1 +
 meta/lib/oeqa/buildperf/base.py     | 46 +++++++++++++++++++++++++++++++++++++
 scripts/oe-build-perf-test          |  4 ++++
 3 files changed, 51 insertions(+)
 create mode 100644 meta/lib/oeqa/buildperf/base.py

diff --git a/meta/lib/oeqa/buildperf/__init__.py b/meta/lib/oeqa/buildperf/__init__.py
index c953559..bab122e 100644
--- a/meta/lib/oeqa/buildperf/__init__.py
+++ b/meta/lib/oeqa/buildperf/__init__.py
@@ -10,3 +10,4 @@
 # more details.
 #
 """Build performance tests"""
+from .base import KernelDropCaches
diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
new file mode 100644
index 0000000..3cbdfa7
--- /dev/null
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -0,0 +1,46 @@
+# Copyright (c) 2016, Intel Corporation.
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+"""Build performance test base classes and functionality"""
+from oeqa.utils.commands import runCmd
+
+
+class KernelDropCaches(object):
+    """Container of the functions for dropping kernel caches"""
+    sudo_passwd = None
+
+    @classmethod
+    def check(cls):
+        """Check permssions for dropping kernel caches"""
+        from getpass import getpass
+        from locale import getdefaultlocale
+        cmd = ['sudo', '-k', '-n', 'tee', '/proc/sys/vm/drop_caches']
+        ret = runCmd(cmd, ignore_status=True, data=b'0')
+        if ret.output.startswith('sudo:'):
+            pass_str = getpass(
+                "\nThe script requires sudo access to drop caches between "
+                "builds (echo 3 > /proc/sys/vm/drop_caches).\n"
+                "Please enter your sudo password: ")
+            cls.sudo_passwd = bytes(pass_str, getdefaultlocale()[1])
+
+    @classmethod
+    def drop(cls):
+        """Drop kernel caches"""
+        cmd = ['sudo', '-k']
+        if cls.sudo_passwd:
+            cmd.append('-S')
+            input_data = cls.sudo_passwd + b'\n'
+        else:
+            cmd.append('-n')
+            input_data = b''
+        cmd += ['tee', '/proc/sys/vm/drop_caches']
+        input_data += b'3'
+        runCmd(cmd, data=input_data)
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 9fb4310..9589dee 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -22,6 +22,7 @@ import sys
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
 import scriptpath
 scriptpath.add_oe_lib_path()
+from oeqa.buildperf import KernelDropCaches
 from oeqa.utils.commands import runCmd
 
 
@@ -71,6 +72,9 @@ def main(argv=None):
     if not pre_run_sanity_check():
         return 1
 
+    # Check our capability to drop caches and ask pass if needed
+    KernelDropCaches.check()
+
     return 0
 
 
-- 
2.6.6


