Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RcMqD-0000fg-Aa
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 20:56:14 +0100
Received: by iakh37 with SMTP id h37so3846543iak.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 11:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Bo+4W2oN5iKNzcB20/+8A+v9ypYvJZkD/e/Bvi+AtmI=;
	b=CegTQowO93isjXq0slAASO9MrG61ziAfMFqGMt5RyefR0O/I7JMUm1efHQCoilwwu6
	U3ZJX9fJ2MF8ciLPQtbPWo/hYouCAYowhSzxo7pcG96NBTwVz1JGpnIJFLUE4Ej9Sxxy
	7jBACS8F1JM9Y6hhWZSVxtUlsgH2m8T2Yyj6M=
Received: by 10.50.207.72 with SMTP id lu8mr22497244igc.23.1324237750830;
	Sun, 18 Dec 2011 11:49:10 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id
	cv10sm10929303igc.0.2011.12.18.11.49.08 (version=SSLv3 cipher=OTHER);
	Sun, 18 Dec 2011 11:49:09 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2011 23:47:29 +0400
Message-Id: <1324237652-15618-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
References: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 2/5] Move check that all installed files are shipped into insane.bbclass
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
X-List-Received-Date: Sun, 18 Dec 2011 19:56:14 -0000

Checking that all installed files are shipped is in reality a QA check.
It would benefit from mechanisms like ERROR_QA/WARNING_QA. So move it
into insane.bbclass. If some of the files are installed but should not
be shipped for some reasons, one can add them to the variable
IGNORE_UNSHIPPED_FILES.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/insane.bbclass  |   50 ++++++++++++++++++++++++++++++++++++++++-
 meta/classes/package.bbclass |   15 ------------
 2 files changed, 48 insertions(+), 17 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 5726e69..41b815c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -100,7 +100,7 @@ def package_qa_get_machine_dict():
 
 
 # Currently not being used by default "desktop"
-WARN_QA ?= "ldflags useless-rpaths rpaths"
+WARN_QA ?= "ldflags useless-rpaths rpaths unshipped"
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
 
 def package_qa_clean_path(path,d):
@@ -485,6 +485,49 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, d):
 
     return sane
 
+IGNORE_UNSHIPPED_FILES ??= ""
+
+def packages_qa_unshipped_files(d):
+    warn = (d.getVar('WARN_QA', True) or "").split()
+    err = (d.getVar('ERROR_QA', True) or "").split()
+    if not "unshipped" in warn + err:
+        return True
+
+    seen = d.getVar('IGNORE_UNSHIPPED_FILES', True).split()
+    unshipped = []
+    dvar = d.getVar('PKGD', True)
+    destvar = d.getVar('PKGDEST', True)
+    packages = d.getVar('PACKAGES', True).split()
+    for p in packages:
+        pdir = os.path.join(destvar, p)
+        for root, dirs, files in os.walk(pdir):
+            dir = root[len(pdir):]
+            if not dir:
+                dir = os.sep
+            for f in (files + dirs):
+                path = os.path.join(dir, f)
+                if path not in seen:
+                    seen.append(path)
+
+    for root, dirs, files in os.walk(dvar):
+        dir = root[len(dvar):]
+        if not dir:
+            dir = os.sep
+        for f in (files + dirs):
+            path = os.path.join(dir, f)
+            if path not in seen:
+                unshipped.append(path)
+
+    pn = d.getVar('PN', True)
+
+    if unshipped == []:
+        return True
+
+    ret = package_qa_handle_error("unshipped", "For recipe %s, the following files/directories were installed but not shipped in any package:" % pn, d)
+    for f in unshipped:
+        package_qa_handle_error("unshipped", f, d)
+    return ret
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     bb.note("DO PACKAGE QA")
@@ -522,6 +565,7 @@ python do_package_qa () {
     g = globals()
     walk_sane = True
     rdepends_sane = True
+    shipped_sane = True
     for package in packages.split():
         skip = (d.getVar('INSANE_SKIP_' + package, True) or "").split()
         if skip:
@@ -546,8 +590,10 @@ python do_package_qa () {
         if not package_qa_check_rdepends(package, pkgdest, skip, d):
             rdepends_sane = False
 
+    if not packages_qa_unshipped_files(d):
+        shipped_sane = False
 
-    if not walk_sane or not rdepends_sane:
+    if not walk_sane or not rdepends_sane or not shipped_sane:
         bb.fatal("QA run found fatal errors. Please consider fixing them.")
     bb.note("DONE with PACKAGE QA")
 }
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 39c1d4b..fbea9c6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -957,21 +957,6 @@ python populate_packages () {
 		del localdata
 	os.chdir(workdir)
 
-	unshipped = []
-	for root, dirs, files in os.walk(dvar):
-		dir = root[len(dvar):]
-		if not dir:
-			dir = os.sep
-		for f in (files + dirs):
-			path = os.path.join(dir, f)
-			if ('.' + path) not in seen:
-				unshipped.append(path)
-
-	if unshipped != []:
-		bb.warn("For recipe %s, the following files/directories were installed but not shipped in any package:" % pn)
-		for f in unshipped:
-			bb.warn("  " + f)
-
 	bb.build.exec_func("package_name_hook", d)
 
 	for pkg in package_list:
-- 
1.7.7.3



