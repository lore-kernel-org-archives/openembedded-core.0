Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UaTVj-0001pZ-MY
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 18:16:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2013 08:55:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,641,1363158000"; d="scan'208";a="334364326"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.169])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2013 08:57:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 16:57:47 +0100
Message-Id: <5599dbb21f23a890c667a171ee46b51873bbbb2d.1368115039.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1368115039.git.paul.eggleton@linux.intel.com>
References: <cover.1368115039.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1368115039.git.paul.eggleton@linux.intel.com>
References: <cover.1368115039.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] buildhistory-diff: improve bad command-line argument handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 16:16:12 -0000

* Check for existence of specified buildhistory directory and show a
  proper error message if it doesn't
* Show an error message instead of a traceback with a mangled revision
  if one of the specified git revisions is invalid
* Show usage information if --help is specified
* Write error messages to stderr

Fixes [YOCTO #4313].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/buildhistory-diff | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index 8493da4..30c2c08 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -2,7 +2,7 @@
 
 # Report significant differences in the buildhistory repository since a specific revision
 #
-# Copyright (C) 2012 Intel Corporation
+# Copyright (C) 2013 Intel Corporation
 # Author: Paul Eggleton <paul.eggleton@linux.intel.com>
 
 import sys
@@ -18,10 +18,10 @@ except ImportError:
 
 def main():
     if LooseVersion(git.__version__) < '0.3.1':
-        print("Version of GitPython is too old, please install GitPython (python-git) 0.3.1 or later in order to use this script")
+        sys.stderr.write("Version of GitPython is too old, please install GitPython (python-git) 0.3.1 or later in order to use this script\n")
         sys.exit(1)
 
-    if (len(sys.argv) < 3):
+    if len(sys.argv) < 3 or '--help' in sys.argv:
         print("Report significant differences in the buildhistory repository")
         print("Syntax: %s <buildhistory-path> <since-revision> [to-revision]" % os.path.basename(sys.argv[0]))
         print("If to-revision is not specified, it defaults to HEAD")
@@ -41,17 +41,29 @@ def main():
                 bitbakepath = os.path.abspath(os.path.join(pth, '..'))
                 break
         if not bitbakepath:
-            print("Unable to find bitbake by searching parent directory of this script or PATH")
+            sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
             sys.exit(1)
 
     sys.path[0:0] = [newpath, bitbakepath + '/lib']
     import oe.buildhistory_analysis
 
+    buildhistory_dir = sys.argv[1]
+    if not os.path.exists(buildhistory_dir):
+        sys.stderr.write('Specified buildhistory directory "%s" does not exist\n' % buildhistory_dir)
+        sys.exit(1)
+
     if len(sys.argv) > 3:
         torev = sys.argv[3]
     else:
         torev = 'HEAD'
-    changes = oe.buildhistory_analysis.process_changes(sys.argv[1], sys.argv[2], torev)
+
+    import gitdb
+    try:
+        changes = oe.buildhistory_analysis.process_changes(buildhistory_dir, sys.argv[2], torev)
+    except gitdb.exc.BadObject as e:
+        sys.stderr.write('Specified git revision "%s" is not valid\n' % e.args[0])
+        sys.exit(1)
+
     for chg in changes:
         print('%s' % chg)
 
-- 
1.8.1.2



