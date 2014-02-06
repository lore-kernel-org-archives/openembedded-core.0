Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 58CAB6D14A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 11:03:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2014 03:03:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="470758617"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.123.186])
	by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2014 03:03:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 11:02:55 +0000
Message-Id: <1391684575-14359-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] classes/buildhistory: write out files in UTF-8 format
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
X-List-Received-Date: Thu, 06 Feb 2014 11:03:04 -0000

If the package information contained unicode characters (for example, in
the package file listing) then writing them out as ASCII would fail, so
write them out using codecs.open() instead of open() using UTF-8. This
fixes ca-certificates failing in do_packagedata when buildhistory is
enabled.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 46 +++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 6b097ea..6d1e74a 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -242,21 +242,25 @@ python buildhistory_emit_pkghistory() {
 
 
 def write_recipehistory(rcpinfo, d):
+    import codecs
+
     bb.debug(2, "Writing recipe history")
 
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
 
     infofile = os.path.join(pkghistdir, "latest")
-    with open(infofile, "w") as f:
+    with codecs.open(infofile, "w", encoding='utf8') as f:
         if rcpinfo.pe != "0":
-            f.write("PE = %s\n" %  rcpinfo.pe)
-        f.write("PV = %s\n" %  rcpinfo.pv)
-        f.write("PR = %s\n" %  rcpinfo.pr)
-        f.write("DEPENDS = %s\n" %  rcpinfo.depends)
-        f.write("PACKAGES = %s\n" %  rcpinfo.packages)
+            f.write(u"PE = %s\n" %  rcpinfo.pe)
+        f.write(u"PV = %s\n" %  rcpinfo.pv)
+        f.write(u"PR = %s\n" %  rcpinfo.pr)
+        f.write(u"DEPENDS = %s\n" %  rcpinfo.depends)
+        f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
 
 
 def write_pkghistory(pkginfo, d):
+    import codecs
+
     bb.debug(2, "Writing package history for package %s" % pkginfo.name)
 
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
@@ -266,11 +270,11 @@ def write_pkghistory(pkginfo, d):
         bb.utils.mkdirhier(pkgpath)
 
     infofile = os.path.join(pkgpath, "latest")
-    with open(infofile, "w") as f:
+    with codecs.open(infofile, "w", encoding='utf8') as f:
         if pkginfo.pe != "0":
-            f.write("PE = %s\n" %  pkginfo.pe)
-        f.write("PV = %s\n" %  pkginfo.pv)
-        f.write("PR = %s\n" %  pkginfo.pr)
+            f.write(u"PE = %s\n" %  pkginfo.pe)
+        f.write(u"PV = %s\n" %  pkginfo.pv)
+        f.write(u"PR = %s\n" %  pkginfo.pr)
 
         pkgvars = {}
         pkgvars['PKG'] = pkginfo.pkg if pkginfo.pkg != pkginfo.name else ''
@@ -280,26 +284,26 @@ def write_pkghistory(pkginfo, d):
         for pkgvar in pkgvars:
             val = pkgvars[pkgvar]
             if val:
-                f.write("%s = %s\n" % (pkgvar, val))
+                f.write(u"%s = %s\n" % (pkgvar, val))
 
-        f.write("RPROVIDES = %s\n" %  pkginfo.rprovides)
-        f.write("RDEPENDS = %s\n" %  pkginfo.rdepends)
-        f.write("RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
+        f.write(u"RPROVIDES = %s\n" %  pkginfo.rprovides)
+        f.write(u"RDEPENDS = %s\n" %  pkginfo.rdepends)
+        f.write(u"RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
         if pkginfo.rsuggests:
-            f.write("RSUGGESTS = %s\n" %  pkginfo.rsuggests)
+            f.write(u"RSUGGESTS = %s\n" %  pkginfo.rsuggests)
         if pkginfo.rreplaces:
-            f.write("RREPLACES = %s\n" %  pkginfo.rreplaces)
+            f.write(u"RREPLACES = %s\n" %  pkginfo.rreplaces)
         if pkginfo.rconflicts:
-            f.write("RCONFLICTS = %s\n" %  pkginfo.rconflicts)
-        f.write("PKGSIZE = %d\n" %  pkginfo.size)
-        f.write("FILES = %s\n" %  pkginfo.files)
-        f.write("FILELIST = %s\n" %  pkginfo.filelist)
+            f.write(u"RCONFLICTS = %s\n" %  pkginfo.rconflicts)
+        f.write(u"PKGSIZE = %d\n" %  pkginfo.size)
+        f.write(u"FILES = %s\n" %  pkginfo.files)
+        f.write(u"FILELIST = %s\n" %  pkginfo.filelist)
 
     for filevar in pkginfo.filevars:
         filevarpath = os.path.join(pkgpath, "latest.%s" % filevar)
         val = pkginfo.filevars[filevar]
         if val:
-            with open(filevarpath, "w") as f:
+            with codecs.open(filevarpath, "w", encoding='utf8') as f:
                 f.write(val)
         else:
             if os.path.exists(filevarpath):
-- 
1.8.5.3


