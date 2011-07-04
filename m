Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QdmTq-0005uH-6f
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 18:58:42 +0200
Received: by rex (Postfix, from userid 1000)
	id 3B6BD30C06; Mon,  4 Jul 2011 17:46:33 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2011 17:46:28 +0100
Message-Id: <ed0b80958463e49f2398dda989f007fee09522bb.1309797628.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <d9a975fe45667bec7ec11697106d5975ffe9b835.1309797628.git.richard.purdie@linuxfoundation.org>
References: <d9a975fe45667bec7ec11697106d5975ffe9b835.1309797628.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
References: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/8] insane.bbclass: Allow INSANE_SKIP to work on a per test basis
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
X-List-Received-Date: Mon, 04 Jul 2011 16:58:42 -0000

From: Richard  Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard  Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass |   37 ++++++++++++++++++++-----------------
 1 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a6f9c1e..3572ce7 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -383,7 +383,7 @@ def package_qa_check_staged(path,d):
     return sane
 
 # Walk over all files in a directory and call func
-def package_qa_walk(path, warnfuncs, errorfuncs, package, d):
+def package_qa_walk(path, warnfuncs, errorfuncs, skip, package, d):
     import oe.qa
 
     #if this will throw an exception, then fix the dict above
@@ -414,7 +414,7 @@ def package_qa_walk(path, warnfuncs, errorfuncs, package, d):
 
     return len(errors) == 0
 
-def package_qa_check_rdepends(pkg, pkgdest, d):
+def package_qa_check_rdepends(pkg, pkgdest, skip, d):
     sane = True
     if not "-dbg" in pkg and not "task-" in pkg and not "-image" in pkg:
         # Copied from package_ipk.bbclass
@@ -439,7 +439,7 @@ def package_qa_check_rdepends(pkg, pkgdest, d):
 
         # Now do the sanity check!!!
         for rdepend in rdepends:
-            if "-dbg" in rdepend:
+            if "-dbg" in rdepend and "debug-deps" not in skip:
                 error_msg = "%s rdepends on %s" % (pkgname,rdepend)
                 sane = package_qa_handle_error("debug-deps", error_msg, d)
 
@@ -480,27 +480,30 @@ python do_package_qa () {
     testmatrix = d.getVarFlags("QAPATHTEST")
 
     g = globals()
-    warnchecks = []
-    for w in (d.getVar("WARN_QA", True) or "").split():
-        if w in testmatrix and testmatrix[w] in g:
-            warnchecks.append(g[testmatrix[w]])
-    errorchecks = []
-    for e in (d.getVar("ERROR_QA", True) or "").split():
-        if e in testmatrix and testmatrix[e] in g:
-            errorchecks.append(g[testmatrix[e]])
-
     walk_sane = True
     rdepends_sane = True
     for package in packages.split():
-        if bb.data.getVar('INSANE_SKIP_' + package, d, True):
-            bb.note("Package: %s (skipped)" % package)
-            continue
+        skip = (bb.data.getVar('INSANE_SKIP_' + package, d, True) or "").split()
+        if skip:
+            bb.note("Package %s skipping QA tests: %s" % (package, str(skip)))
+        warnchecks = []
+        for w in (d.getVar("WARN_QA", True) or "").split():
+            if w in skip:
+               continue
+            if w in testmatrix and testmatrix[w] in g:
+                warnchecks.append(g[testmatrix[w]])
+        errorchecks = []
+        for e in (d.getVar("ERROR_QA", True) or "").split():
+            if e in skip:
+               continue
+            if e in testmatrix and testmatrix[e] in g:
+                errorchecks.append(g[testmatrix[e]])
 
         bb.note("Checking Package: %s" % package)
         path = "%s/%s" % (pkgdest, package)
-        if not package_qa_walk(path, warnchecks, errorchecks, package, d):
+        if not package_qa_walk(path, warnchecks, errorchecks, skip, package, d):
             walk_sane  = False
-        if not package_qa_check_rdepends(package, pkgdest, d):
+        if not package_qa_check_rdepends(package, pkgdest, skip, d):
             rdepends_sane = False
 
 
-- 
1.7.4.1



