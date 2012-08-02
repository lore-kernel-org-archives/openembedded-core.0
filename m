Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Swrnx-0002yQ-FX
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 11:34:53 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2012 02:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129551531"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.75])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2012 02:23:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 10:23:01 +0100
Message-Id: <0ccadc021a8d55497e329414e2ae8a4486e2fa65.1343899228.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/9] classes/buildhistory: remove obsolete flat package history feature
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
X-List-Received-Date: Thu, 02 Aug 2012 09:34:53 -0000

Remove the ability to set BUILDHISTORY_KEEP_VERSIONS = "1" to save the
package history as flat versioned files rather than relying on git to
keep previous versions of the package information. git has proven to
work quite well in this capacity.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |   43 +++++++------------------------------
 1 file changed, 8 insertions(+), 35 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index ddb76e8..f5494cd 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -156,7 +156,6 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.depends = sortlist(squashspaces(d.getVar('DEPENDS', True) or ""))
     rcpinfo.packages = packages
     write_recipehistory(rcpinfo, d)
-    write_latestlink(None, pe, pv, pr, d)
 
     # Apparently the version can be different on a per-package basis (see Python)
     pkgdest = d.getVar('PKGDEST', True)
@@ -199,8 +198,6 @@ python buildhistory_emit_pkghistory() {
         pkginfo.filelist = " ".join(filelist)
 
         write_pkghistory(pkginfo, d)
-
-        write_latestlink(pkg, pe, pv, pr, d)
 }
 
 
@@ -212,8 +209,8 @@ def write_recipehistory(rcpinfo, d):
     if not os.path.exists(pkghistdir):
         os.makedirs(pkghistdir)
 
-    verfile = os.path.join(pkghistdir, "%s:%s-%s" % (rcpinfo.pe, rcpinfo.pv, rcpinfo.pr))
-    f = open(verfile, "w")
+    infofile = os.path.join(pkghistdir, "latest")
+    f = open(infofile, "w")
     try:
         if rcpinfo.pe != "0":
             f.write("PE = %s\n" %  rcpinfo.pe)
@@ -226,16 +223,16 @@ def write_recipehistory(rcpinfo, d):
 
 
 def write_pkghistory(pkginfo, d):
-    bb.debug(2, "Writing package history")
+    bb.debug(2, "Writing package history for package %s" % pkginfo.name)
 
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
 
-    verpath = os.path.join(pkghistdir, pkginfo.name)
-    if not os.path.exists(verpath):
-        os.makedirs(verpath)
+    pkgpath = os.path.join(pkghistdir, pkginfo.name)
+    if not os.path.exists(pkgpath):
+        os.makedirs(pkgpath)
 
-    verfile = os.path.join(verpath, "%s:%s-%s" % (pkginfo.pe, pkginfo.pv, pkginfo.pr))
-    f = open(verfile, "w")
+    infofile = os.path.join(pkgpath, "latest")
+    f = open(infofile, "w")
     try:
         if pkginfo.pe != "0":
             f.write("PE = %s\n" %  pkginfo.pe)
@@ -250,30 +247,6 @@ def write_pkghistory(pkginfo, d):
         f.close()
 
 
-def write_latestlink(pkg, pe, pv, pr, d):
-    import shutil
-
-    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
-
-    def rm_link(path):
-        try:
-            os.unlink(path)
-        except OSError:
-            return
-
-    if pkg:
-        filedir = os.path.join(pkghistdir, pkg)
-    else:
-        filedir = pkghistdir
-    latest_file = os.path.join(filedir, "latest")
-    ver_file = os.path.join(filedir, "%s:%s-%s" % (pe, pv, pr))
-    rm_link(latest_file)
-    if d.getVar('BUILDHISTORY_KEEP_VERSIONS', True) == '1':
-        shutil.copy(ver_file, latest_file)
-    else:
-        shutil.move(ver_file, latest_file)
-
-
 buildhistory_get_image_installed() {
 	# Anything requiring the use of the packaging system should be done in here
 	# in case the packaging files are going to be removed for this image
-- 
1.7.9.5



