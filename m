Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E13997290D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:42:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Dec 2014 03:42:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,606,1413270000"; d="scan'208";a="640244365"
Received: from khamid-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.31.61])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2014 03:42:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Dec 2014 11:41:44 +0000
Message-Id: <03233c1d9f59750c911ce997fa60611b1e16594e.1418984743.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/15] classes/package: move read_shlib_providers() to a common unit
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
X-List-Received-Date: Fri, 19 Dec 2014 11:42:09 -0000

This allows us to use this function elsewhere in the code.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass | 24 +-----------------------
 meta/lib/oe/package.py       | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 89cce40..692fbac 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1389,32 +1389,11 @@ python package_do_shlibs() {
 
     pkgdest = d.getVar('PKGDEST', True)
 
-    shlibs_dirs = d.getVar('SHLIBSDIRS', True).split()
     shlibswork_dir = d.getVar('SHLIBSWORKDIR', True)
 
     # Take shared lock since we're only reading, not writing
     lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
 
-    def read_shlib_providers():
-        list_re = re.compile('^(.*)\.list$')
-        # Go from least to most specific since the last one found wins
-        for dir in reversed(shlibs_dirs):
-            bb.debug(2, "Reading shlib providers in %s" % (dir))
-            if not os.path.exists(dir):
-                continue
-            for file in os.listdir(dir):
-                m = list_re.match(file)
-                if m:
-                    dep_pkg = m.group(1)
-                    fd = open(os.path.join(dir, file))
-                    lines = fd.readlines()
-                    fd.close()
-                    for l in lines:
-                        s = l.strip().split(":")
-                        if s[0] not in shlib_provider:
-                            shlib_provider[s[0]] = {}
-                        shlib_provider[s[0]][s[1]] = (dep_pkg, s[2])
-
     def linux_so(file, needed, sonames, renames, pkgver):
         needs_ldconfig = False
         ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
@@ -1511,8 +1490,7 @@ python package_do_shlibs() {
         use_ldconfig = False
 
     needed = {}
-    shlib_provider = {}
-    read_shlib_providers()
+    shlib_provider = oe.package.read_shlib_providers(d)
 
     for pkg in packages.split():
         private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True) or d.getVar('PRIVATE_LIBS', True) or ""
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index f8b5322..ea6feaa 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -97,3 +97,29 @@ def filedeprunner(arg):
         raise e
 
     return (pkg, provides, requires)
+
+
+def read_shlib_providers(d):
+    import re
+
+    shlib_provider = {}
+    shlibs_dirs = d.getVar('SHLIBSDIRS', True).split()
+    list_re = re.compile('^(.*)\.list$')
+    # Go from least to most specific since the last one found wins
+    for dir in reversed(shlibs_dirs):
+        bb.debug(2, "Reading shlib providers in %s" % (dir))
+        if not os.path.exists(dir):
+            continue
+        for file in os.listdir(dir):
+            m = list_re.match(file)
+            if m:
+                dep_pkg = m.group(1)
+                fd = open(os.path.join(dir, file))
+                lines = fd.readlines()
+                fd.close()
+                for l in lines:
+                    s = l.strip().split(":")
+                    if s[0] not in shlib_provider:
+                        shlib_provider[s[0]] = {}
+                    shlib_provider[s[0]][s[1]] = (dep_pkg, s[2])
+    return shlib_provider
-- 
1.9.3


