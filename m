Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1F571708C0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 08:53:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Aug 2014 01:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,831,1400050800"; d="scan'208";a="582373391"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2014 01:53:57 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 2D6276A4007;
	Sat,  9 Aug 2014 01:53:18 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 13:59:08 +0300
Message-Id: <1407581949-12085-4-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1407581949-12085-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1407581949-12085-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 3/4] oeqa/utils/targetbuild.py: add support for sdk tests
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
X-List-Received-Date: Sat, 09 Aug 2014 08:54:00 -0000

- Create new abstract class BuildProject that provides basic functionality for a project/package building class
        * contains abstract method _run() that needs to be implemented by all extending classes.
- The old TargetBuildProject class now extends the abstract BuildProjct class
- Introducing new SDKBuildProject that extends the abstract BuildProjct class

NOTE: Original patch made by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/utils/targetbuild.py | 94 ++++++++++++++++++++++++++++++++------
 1 file changed, 79 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 3229676..eeb08ba 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -6,23 +6,25 @@
 
 import os
 import re
+import bb.utils
 import subprocess
+from abc import ABCMeta, abstractmethod
 
+class BuildProject():
 
-class TargetBuildProject():
+    __metaclass__ = ABCMeta
 
-    def __init__(self, target, d, uri, foldername=None):
-        self.target = target
+    def __init__(self, d, uri, foldername=None, tmpdir="/tmp/"):
         self.d = d
         self.uri = uri
-        self.targetdir = "~/"
         self.archive = os.path.basename(uri)
-        self.localarchive = "/tmp/" + self.archive
+        self.localarchive = os.path.join(tmpdir,self.archive)
         self.fname = re.sub(r'.tar.bz2|tar.gz$', '', self.archive)
         if foldername:
             self.fname = foldername
 
-    def download_archive(self):
+    # Download self.archive to self.localarchive
+    def _download_archive(self):
 
         exportvars = ['HTTP_PROXY', 'http_proxy',
                       'HTTPS_PROXY', 'https_proxy',
@@ -41,6 +43,38 @@ class TargetBuildProject():
         cmd = cmd + "wget -O %s %s" % (self.localarchive, self.uri)
         subprocess.check_call(cmd, shell=True)
 
+    # This method should provide a way to run a command in the desired environment.
+    @abstractmethod
+    def _run(self, cmd):
+        pass
+
+    # The timeout parameter of target.run is set to 0 to make the ssh command
+    # run with no timeout.
+    def run_configure(self, configure_args=''):
+        return self._run('cd %s; ./configure %s' % (self.targetdir, configure_args))
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
         (status, output) = self.target.copy_to(self.localarchive, self.targetdir)
         if status != 0:
             raise Exception("Failed to copy archive to target, output: %s" % output)
@@ -54,15 +88,45 @@ class TargetBuildProject():
 
     # The timeout parameter of target.run is set to 0 to make the ssh command
     # run with no timeout.
-    def run_configure(self):
-        return self.target.run('cd %s; ./configure' % self.targetdir, 0)[0]
+    def _run(self, cmd):
+        return self.target.run(cmd, 0)[0]
 
-    def run_make(self):
-        return self.target.run('cd %s; make' % self.targetdir, 0)[0]
 
-    def run_install(self):
-        return self.target.run('cd %s; make install' % self.targetdir, 0)[0]
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
+        self.targetdir = self.targetdir + self.fname
+
+    def run_configure(self, configure_args=''):
+        return super(SDKBuildProject, self).run_configure(configure_args=(configure_args or '$CONFIGURE_FLAGS'))
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
+        self.log("Running source %s; " % self.sdkenv + cmd)
+        return subprocess.call("source %s; " % self.sdkenv + cmd, shell=True)
 
-    def clean(self):
-        self.target.run('rm -rf %s' % self.targetdir)
-        subprocess.call('rm -f %s' % self.localarchive, shell=True)
-- 
1.8.3.2


