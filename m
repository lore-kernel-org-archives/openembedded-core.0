Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7775271C09
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 16:20:05 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP; 08 Dec 2016 08:19:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="40496547"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2016 08:18:59 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 10:20:49 -0600
Message-Id: <f9f48f4a41d8107dde2bbd424207cdcf551c968f.1481213961.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481213961.git.anibal.limon@linux.intel.com>
References: <cover.1481213961.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 21/30] oeqa/utils: Move targetbuild to buildproject module
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
X-List-Received-Date: Thu, 08 Dec 2016 16:20:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new buildproject module will contain only BuildProject class
a helper class for build source code.

The remaining classes TargetBuildProject and SDKBuildProject was
move to runtime and sdk respectively.

[YOCTO #10599]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/runtime/utils/__init__.py            |  0
 meta/lib/oeqa/runtime/utils/targetbuildproject.py  | 33 +++++++++++
 meta/lib/oeqa/sdk/utils/__init__.py                |  0
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py         | 45 ++++++++++++++
 .../oeqa/utils/{targetbuild.py => buildproject.py} | 68 +---------------------
 5 files changed, 79 insertions(+), 67 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/utils/__init__.py
 create mode 100644 meta/lib/oeqa/runtime/utils/targetbuildproject.py
 create mode 100644 meta/lib/oeqa/sdk/utils/__init__.py
 create mode 100644 meta/lib/oeqa/sdk/utils/sdkbuildproject.py
 rename meta/lib/oeqa/utils/{targetbuild.py => buildproject.py} (48%)

diff --git a/meta/lib/oeqa/runtime/utils/__init__.py b/meta/lib/oeqa/runtime/utils/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta/lib/oeqa/runtime/utils/targetbuildproject.py b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
new file mode 100644
index 0000000..138b5ef
--- /dev/null
+++ b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
@@ -0,0 +1,33 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.utils.buildproject import BuildProject
+
+class TargetBuildProject(BuildProject):
+
+    def __init__(self, target, d, uri, foldername=None):
+        self.target = target
+        self.targetdir = "~/"
+        BuildProject.__init__(self, d, uri, foldername, tmpdir="/tmp")
+
+    def download_archive(self):
+
+        self._download_archive()
+
+        (status, output) = self.target.copy_to(self.localarchive, self.targetdir)
+        if status != 0:
+            raise Exception("Failed to copy archive to target, output: %s" % output)
+
+        (status, output) = self.target.run('tar xf %s%s -C %s' % (self.targetdir, self.archive, self.targetdir))
+        if status != 0:
+            raise Exception("Failed to extract archive, output: %s" % output)
+
+        #Change targetdir to project folder
+        self.targetdir = self.targetdir + self.fname
+
+    # The timeout parameter of target.run is set to 0 to make the ssh command
+    # run with no timeout.
+    def _run(self, cmd):
+        return self.target.run(cmd, 0)[0]
+
+
diff --git a/meta/lib/oeqa/sdk/utils/__init__.py b/meta/lib/oeqa/sdk/utils/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
new file mode 100644
index 0000000..1aa8a69
--- /dev/null
+++ b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
@@ -0,0 +1,45 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+import subprocess
+
+from oeqa.utils.buildproject import BuildProject
+
+class SDKBuildProject(BuildProject):
+
+    def __init__(self, testpath, sdkenv, d, uri, foldername=None):
+        self.sdkenv = sdkenv
+        self.testdir = testpath
+        self.targetdir = testpath
+        bb.utils.mkdirhier(testpath)
+        self.datetime = d.getVar('DATETIME', True)
+        self.testlogdir = d.getVar("TEST_LOG_DIR", True)
+        bb.utils.mkdirhier(self.testlogdir)
+        self.logfile = os.path.join(self.testlogdir, "sdk_target_log.%s" % self.datetime)
+        BuildProject.__init__(self, d, uri, foldername, tmpdir=testpath)
+
+    def download_archive(self):
+
+        self._download_archive()
+
+        cmd = 'tar xf %s%s -C %s' % (self.targetdir, self.archive, self.targetdir)
+        subprocess.check_call(cmd, shell=True)
+
+        #Change targetdir to project folder
+        self.targetdir = os.path.join(self.targetdir, self.fname)
+
+    def run_configure(self, configure_args='', extra_cmds=' gnu-configize; '):
+        return super(SDKBuildProject, self).run_configure(configure_args=(configure_args or '$CONFIGURE_FLAGS'), extra_cmds=extra_cmds)
+
+    def run_install(self, install_args=''):
+        return super(SDKBuildProject, self).run_install(install_args=(install_args or "DESTDIR=%s/../install" % self.targetdir))
+
+    def log(self, msg):
+        if self.logfile:
+            with open(self.logfile, "a") as f:
+               f.write("%s\n" % msg)
+
+    def _run(self, cmd):
+        self.log("Running . %s; " % self.sdkenv + cmd)
+        return subprocess.call(". %s; " % self.sdkenv + cmd, shell=True)
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/buildproject.py
similarity index 48%
rename from meta/lib/oeqa/utils/targetbuild.py
rename to meta/lib/oeqa/utils/buildproject.py
index 59593f5..0e1ed8a 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -1,4 +1,4 @@
-# Copyright (C) 2013 Intel Corporation
+# Copyright (C) 2013-2016 Intel Corporation
 #
 # Released under the MIT license (see COPYING.MIT)
 
@@ -67,69 +67,3 @@ class BuildProject(metaclass=ABCMeta):
         self._run('rm -rf %s' % self.targetdir)
         subprocess.call('rm -f %s' % self.localarchive, shell=True)
         pass
-
-class TargetBuildProject(BuildProject):
-
-    def __init__(self, target, d, uri, foldername=None):
-        self.target = target
-        self.targetdir = "~/"
-        BuildProject.__init__(self, d, uri, foldername, tmpdir="/tmp")
-
-    def download_archive(self):
-
-        self._download_archive()
-
-        (status, output) = self.target.copy_to(self.localarchive, self.targetdir)
-        if status != 0:
-            raise Exception("Failed to copy archive to target, output: %s" % output)
-
-        (status, output) = self.target.run('tar xf %s%s -C %s' % (self.targetdir, self.archive, self.targetdir))
-        if status != 0:
-            raise Exception("Failed to extract archive, output: %s" % output)
-
-        #Change targetdir to project folder
-        self.targetdir = self.targetdir + self.fname
-
-    # The timeout parameter of target.run is set to 0 to make the ssh command
-    # run with no timeout.
-    def _run(self, cmd):
-        return self.target.run(cmd, 0)[0]
-
-
-class SDKBuildProject(BuildProject):
-
-    def __init__(self, testpath, sdkenv, d, uri, foldername=None):
-        self.sdkenv = sdkenv
-        self.testdir = testpath
-        self.targetdir = testpath
-        bb.utils.mkdirhier(testpath)
-        self.datetime = d.getVar('DATETIME', True)
-        self.testlogdir = d.getVar("TEST_LOG_DIR", True)
-        bb.utils.mkdirhier(self.testlogdir)
-        self.logfile = os.path.join(self.testlogdir, "sdk_target_log.%s" % self.datetime)
-        BuildProject.__init__(self, d, uri, foldername, tmpdir=testpath)
-
-    def download_archive(self):
-
-        self._download_archive()
-
-        cmd = 'tar xf %s%s -C %s' % (self.targetdir, self.archive, self.targetdir)
-        subprocess.check_call(cmd, shell=True)
-
-        #Change targetdir to project folder
-        self.targetdir = os.path.join(self.targetdir, self.fname)
-
-    def run_configure(self, configure_args='', extra_cmds=' gnu-configize; '):
-        return super(SDKBuildProject, self).run_configure(configure_args=(configure_args or '$CONFIGURE_FLAGS'), extra_cmds=extra_cmds)
-
-    def run_install(self, install_args=''):
-        return super(SDKBuildProject, self).run_install(install_args=(install_args or "DESTDIR=%s/../install" % self.targetdir))
-
-    def log(self, msg):
-        if self.logfile:
-            with open(self.logfile, "a") as f:
-               f.write("%s\n" % msg)
-
-    def _run(self, cmd):
-        self.log("Running . %s; " % self.sdkenv + cmd)
-        return subprocess.call(". %s; " % self.sdkenv + cmd, shell=True)
-- 
2.1.4


