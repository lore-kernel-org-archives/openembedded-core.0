Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 76D147724C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567438"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:45 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:09:53 -0600
Message-Id: <5df26fc5920949a165c9dac97caa42f62562e840.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 22/55] oeqa/utils: Move targetbuild to buildproject module
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:45 -0000
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
 meta/lib/oeqa/runtime/utils/__init__.py           |  0
 meta/lib/oeqa/runtime/utils/targetbuildproject.py | 33 +++++++++++
 meta/lib/oeqa/sdk/utils/__init__.py               |  0
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py        | 45 +++++++++++++++
 meta/lib/oeqa/utils/buildproject.py               | 69 +++++++++++++++++++++++
 5 files changed, 147 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/utils/__init__.py
 create mode 100644 meta/lib/oeqa/runtime/utils/targetbuildproject.py
 create mode 100644 meta/lib/oeqa/sdk/utils/__init__.py
 create mode 100644 meta/lib/oeqa/sdk/utils/sdkbuildproject.py
 create mode 100644 meta/lib/oeqa/utils/buildproject.py

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
index 0000000..1eebd3a
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
+        self.datetime = d.getVar('DATETIME')
+        self.testlogdir = d.getVar("TEST_LOG_DIR")
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
diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/buildproject.py
new file mode 100644
index 0000000..1ed9624
--- /dev/null
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -0,0 +1,69 @@
+# Copyright (C) 2013-2016 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+# Provides a class for automating build tests for projects
+
+import os
+import re
+import bb.utils
+import subprocess
+from abc import ABCMeta, abstractmethod
+
+class BuildProject(metaclass=ABCMeta):
+
+    def __init__(self, d, uri, foldername=None, tmpdir="/tmp/"):
+        self.d = d
+        self.uri = uri
+        self.archive = os.path.basename(uri)
+        self.localarchive = os.path.join(tmpdir,self.archive)
+        if foldername:
+            self.fname = foldername
+        else:
+            self.fname = re.sub(r'\.tar\.bz2$|\.tar\.gz$|\.tar\.xz$', '', self.archive)
+
+    # Download self.archive to self.localarchive
+    def _download_archive(self):
+
+        dl_dir = self.d.getVar("DL_DIR")
+        if dl_dir and os.path.exists(os.path.join(dl_dir, self.archive)):
+            bb.utils.copyfile(os.path.join(dl_dir, self.archive), self.localarchive)
+            return
+
+        exportvars = ['HTTP_PROXY', 'http_proxy',
+                      'HTTPS_PROXY', 'https_proxy',
+                      'FTP_PROXY', 'ftp_proxy',
+                      'FTPS_PROXY', 'ftps_proxy',
+                      'NO_PROXY', 'no_proxy',
+                      'ALL_PROXY', 'all_proxy',
+                      'SOCKS5_USER', 'SOCKS5_PASSWD']
+
+        cmd = ''
+        for var in exportvars:
+            val = self.d.getVar(var)
+            if val:
+                cmd = 'export ' + var + '=\"%s\"; %s' % (val, cmd)
+
+        cmd = cmd + "wget -O %s %s" % (self.localarchive, self.uri)
+        subprocess.check_call(cmd, shell=True)
+
+    # This method should provide a way to run a command in the desired environment.
+    @abstractmethod
+    def _run(self, cmd):
+        pass
+
+    # The timeout parameter of target.run is set to 0 to make the ssh command
+    # run with no timeout.
+    def run_configure(self, configure_args='', extra_cmds=''):
+        return self._run('cd %s; %s ./configure %s' % (self.targetdir, extra_cmds, configure_args))
+
+    def run_make(self, make_args=''):
+        return self._run('cd %s; make %s' % (self.targetdir, make_args))
+
+    def run_install(self, install_args=''):
+        return self._run('cd %s; make install %s' % (self.targetdir, install_args))
+
+    def clean(self):
+        self._run('rm -rf %s' % self.targetdir)
+        subprocess.call('rm -f %s' % self.localarchive, shell=True)
+        pass
-- 
2.1.4


