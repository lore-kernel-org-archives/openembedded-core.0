Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8O0-0008Qo-DM
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103310"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:40:02 -0700
Message-Id: <657d7f24e656970895cb92a614067dd185b0c523.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 18/23] cleanup-workdir: replace commands with subprocess
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Jun 2012 05:50:57 -0000

From: Kang Kai <kai.kang@windriver.com>

Use modules subprocess to run command instead of module commands.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 scripts/cleanup-workdir |   22 ++++++++++++----------
 1 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index 3739a00..1e9c56d 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -19,7 +19,7 @@ import os
 import sys
 import optparse
 import re
-import commands
+import subprocess
 import shutil
 
 pkg_cur_dirs = []
@@ -39,6 +39,14 @@ def parse_version(verstr):
     else:
         return epoch + '_' + elems[1]
 
+def run_command(cmd):
+    pipe = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
+    output = pipe.communicate()[0]
+    if pipe.returncode != 0:
+        print "Execute command '%s' failed." % cmd
+        sys.exit(1)
+    return output
+
 def main():
     global parser
     parser = optparse.OptionParser(
@@ -49,7 +57,7 @@ This script must be ran under BUILDDIR after source file \"oe-init-build-env\"."
 
     options, args = parser.parse_args(sys.argv)
 
-    builddir = commands.getoutput('echo $BUILDDIR')
+    builddir = run_command('echo $BUILDDIR').strip()
     if len(builddir) == 0:
         err_quit("Please source file \"oe-init-build-env\" first.\n")
 
@@ -58,10 +66,7 @@ This script must be ran under BUILDDIR after source file \"oe-init-build-env\"."
 
     print 'Updating bitbake caches...'
     cmd = "bitbake -s"
-    (ret, output) = commands.getstatusoutput(cmd)
-    if ret != 0:
-        print "Execute 'bitbake -s' failed. Can't get packages' versions."
-        return 1
+    output = run_command(cmd)
 
     output = output.split('\n')
     index = 0
@@ -83,10 +88,7 @@ This script must be ran under BUILDDIR after source file \"oe-init-build-env\"."
         pkg_cur_dirs.append(elems[0] + '-' + version)
 
     cmd = "bitbake -e | grep ^TMPDIR"
-    (ret, output) = commands.getstatusoutput(cmd)
-    if ret != 0:
-        print "Execute 'bitbke -e' failed. Can't get TMPDIR."
-        return 1
+    output = run_command(cmd)
 
     tmpdir = output.split('"')[1]
     workdir = os.path.join(tmpdir, 'work')
-- 
1.7.7.6



