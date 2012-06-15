Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SfPg5-00013H-TH
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 08:06:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5F5tvhL000756
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Jun 2012 22:55:58 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Thu, 14 Jun 2012 22:55:57 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jun 2012 13:56:08 +0800
Message-ID: <f0c36f7c173653bec6ddba5ca0ba06e1576cc22d.1339739522.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339739522.git.kai.kang@windriver.com>
References: <cover.1339739522.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/4] cleanup-workdir: replace commands with subprocess
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
X-List-Received-Date: Fri, 15 Jun 2012 06:06:38 -0000
Content-Type: text/plain

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
1.7.5.4



