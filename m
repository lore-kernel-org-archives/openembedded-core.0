Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4598371B5F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 20:30:37 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 07 Dec 2016 12:30:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,315,1477983600"; d="scan'208";a="40172610"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2016 12:30:38 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2016 14:32:29 -0600
Message-Id: <9f77b0640b87fecbf4bb71a7a12504c7d06132af.1481142664.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 24/32] oeqa/utils: {Target, SDK, }BuildProject remove dependency of bb
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
X-List-Received-Date: Wed, 07 Dec 2016 20:30:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Don't use bitbake references inside utils modules, in order todo
that changes getVar calls for arguments in the __init__ method like
dl_dir for all the classes and testlogdir, builddatetime in
SDKBUildProject.

Also don't export proxies inside _download_archive method, a good
practice is to setup the proxies at init of the process instead of
do it in this helper module.

[YOCTO #10231]
[YOCTO #10599]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/runtime/utils/targetbuildproject.py |  6 ++---
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py        | 14 +++++-----
 meta/lib/oeqa/utils/buildproject.py               | 31 +++++------------------
 3 files changed, 17 insertions(+), 34 deletions(-)

diff --git a/meta/lib/oeqa/runtime/utils/targetbuildproject.py b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
index 138b5ef..006d4d4 100644
--- a/meta/lib/oeqa/runtime/utils/targetbuildproject.py
+++ b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
@@ -5,13 +5,13 @@ from oeqa.utils.buildproject import BuildProject
 
 class TargetBuildProject(BuildProject):
 
-    def __init__(self, target, d, uri, foldername=None):
+    def __init__(self, target, uri, foldername=None, dl_dir=None):
         self.target = target
         self.targetdir = "~/"
-        BuildProject.__init__(self, d, uri, foldername, tmpdir="/tmp")
+        BuildProject.__init__(self, uri, foldername, tmpdir="/tmp",
+                dl_dir=dl_dir)
 
     def download_archive(self):
-
         self._download_archive()
 
         (status, output) = self.target.copy_to(self.localarchive, self.targetdir)
diff --git a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
index 1aa8a69..cc34e0c 100644
--- a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
+++ b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
@@ -7,17 +7,17 @@ import subprocess
 from oeqa.utils.buildproject import BuildProject
 
 class SDKBuildProject(BuildProject):
-
-    def __init__(self, testpath, sdkenv, d, uri, foldername=None):
+    def __init__(self, testpath, sdkenv, uri, testlogdir, builddatetime,
+            foldername=None, dl_dir=None):
         self.sdkenv = sdkenv
         self.testdir = testpath
         self.targetdir = testpath
-        bb.utils.mkdirhier(testpath)
-        self.datetime = d.getVar('DATETIME', True)
-        self.testlogdir = d.getVar("TEST_LOG_DIR", True)
-        bb.utils.mkdirhier(self.testlogdir)
+        os.makedirs(testpath, exist_ok=True)
+        self.datetime = builddatetime
+        self.testlogdir = testlogdir
+        os.makedirs(self.testlogdir, exist_ok=True)
         self.logfile = os.path.join(self.testlogdir, "sdk_target_log.%s" % self.datetime)
-        BuildProject.__init__(self, d, uri, foldername, tmpdir=testpath)
+        BuildProject.__init__(self, uri, foldername, tmpdir=testpath, dl_dir=dl_dir)
 
     def download_archive(self):
 
diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/buildproject.py
index 0e1ed8a..386a927 100644
--- a/meta/lib/oeqa/utils/buildproject.py
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -6,17 +6,17 @@
 
 import os
 import re
-import bb.utils
 import subprocess
+import shutil
+
 from abc import ABCMeta, abstractmethod
 
 class BuildProject(metaclass=ABCMeta):
-
-    def __init__(self, d, uri, foldername=None, tmpdir="/tmp/"):
-        self.d = d
+    def __init__(self, uri, foldername=None, tmpdir="/tmp/", dl_dir=None):
         self.uri = uri
         self.archive = os.path.basename(uri)
         self.localarchive = os.path.join(tmpdir,self.archive)
+        self.dl_dir = dl_dir
         if foldername:
             self.fname = foldername
         else:
@@ -24,27 +24,11 @@ class BuildProject(metaclass=ABCMeta):
 
     # Download self.archive to self.localarchive
     def _download_archive(self):
-
-        dl_dir = self.d.getVar("DL_DIR", True)
-        if dl_dir and os.path.exists(os.path.join(dl_dir, self.archive)):
-            bb.utils.copyfile(os.path.join(dl_dir, self.archive), self.localarchive)
+        if self.dl_dir and os.path.exists(os.path.join(self.dl_dir, self.archive)):
+            shutil.copyfile(os.path.join(self.dl_dir, self.archive), self.localarchive)
             return
 
-        exportvars = ['HTTP_PROXY', 'http_proxy',
-                      'HTTPS_PROXY', 'https_proxy',
-                      'FTP_PROXY', 'ftp_proxy',
-                      'FTPS_PROXY', 'ftps_proxy',
-                      'NO_PROXY', 'no_proxy',
-                      'ALL_PROXY', 'all_proxy',
-                      'SOCKS5_USER', 'SOCKS5_PASSWD']
-
-        cmd = ''
-        for var in exportvars:
-            val = self.d.getVar(var, True)
-            if val:
-                cmd = 'export ' + var + '=\"%s\"; %s' % (val, cmd)
-
-        cmd = cmd + "wget -O %s %s" % (self.localarchive, self.uri)
+        cmd = "wget -O %s %s" % (self.localarchive, self.uri)
         subprocess.check_call(cmd, shell=True)
 
     # This method should provide a way to run a command in the desired environment.
@@ -66,4 +50,3 @@ class BuildProject(metaclass=ABCMeta):
     def clean(self):
         self._run('rm -rf %s' % self.targetdir)
         subprocess.call('rm -f %s' % self.localarchive, shell=True)
-        pass
-- 
2.1.4


