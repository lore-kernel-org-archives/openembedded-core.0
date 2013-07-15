Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 535186B19F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 18:17:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2013 11:19:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,670,1367996400"; d="scan'208";a="370607306"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.64])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2013 11:17:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 19:17:44 +0100
Message-Id: <35e7459620a7e5b53d24fdb93ddc560184014acf.1373912179.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373912179.git.paul.eggleton@linux.intel.com>
References: <cover.1373912179.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1373912179.git.paul.eggleton@linux.intel.com>
References: <cover.1373912179.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/insane: allow libdir QA check to be skipped using INSANE_SKIP
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
X-List-Received-Date: Mon, 15 Jul 2013 18:17:52 -0000

This path check isn't handled in the normal way where a QA check
function is called for every file (there's some minor setup that we want
to avoid doing for every file) so we need to check INSANE_SKIP
explicitly.

In the process, change the code structure a little bit so that we can
report the package that contains the errant file.

Fixes [YOCTO #4822].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/insane.bbclass | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b875ac0..75bd2e2 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -252,29 +252,39 @@ def package_qa_check_libdir(d):
     """
     import re
 
-    pkgd = d.getVar('PKGD', True)
+    pkgdest = d.getVar('PKGDEST', True)
     base_libdir = d.getVar("base_libdir",True) + os.sep
     libdir = d.getVar("libdir", True) + os.sep
     exec_prefix = d.getVar("exec_prefix", True) + os.sep
 
     messages = []
-    my_files = []
-
-    for root, dirs, files in os.walk(pkgd):
-        for file in files:
-            full_path = os.path.join(root,file)
-            my_files.append(full_path[len(pkgd):])
 
     lib_re = re.compile("^/lib.+\.so(\..+)?$")
     exec_re = re.compile("^%s.*/lib.+\.so(\..+)?$" % exec_prefix)
 
-    for file in my_files:
-        if lib_re.match(file):
-            if base_libdir not in file:
-                messages.append("Found library in wrong location: %s" % file)
-        if exec_re.match(file):
-            if libdir not in file:
-                messages.append("Found library in wrong location: %s" % file)
+    for root, dirs, files in os.walk(pkgdest):
+        if root == pkgdest:
+            # Skip subdirectories for any packages with libdir in INSANE_SKIP
+            skippackages = []
+            for package in dirs:
+                if 'libdir' in (d.getVar('INSANE_SKIP_' + package, True) or "").split():
+                    bb.note("Package %s skipping libdir QA test" % (package))
+                    skippackages.append(package)
+            for package in skippackages:
+                dirs.remove(package)
+        for file in files:
+            full_path = os.path.join(root, file)
+            rel_path = os.path.relpath(full_path, pkgdest)
+            if os.sep in rel_path:
+                package, rel_path = rel_path.split(os.sep, 1)
+                rel_path = os.sep + rel_path
+                if lib_re.match(rel_path):
+                    if base_libdir not in rel_path:
+                        messages.append("%s: found library in wrong location: %s" % (package, rel_path))
+                if exec_re.match(rel_path):
+                    if libdir not in rel_path:
+                        messages.append("%s: found library in wrong location: %s" % (package, rel_path))
+
     if messages:
         package_qa_handle_error("libdir", "\n".join(messages), d)
 
-- 
1.8.1.2


