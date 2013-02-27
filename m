Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1UAjJU-0006F7-WC
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 16:53:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Feb 2013 07:36:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,747,1355126400"; d="scan'208";a="268559907"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2013 07:36:12 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 17:37:24 +0200
Message-Id: <1361979444-1244-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] buildhistory.bbclass: add support for SRCREV logging
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
X-List-Received-Date: Wed, 27 Feb 2013 15:53:02 -0000
X-List-Received-Date: Wed, 27 Feb 2013 15:53:02 -0000

- create "latest_srcrev" for each recipe with the following format:
${BB_FILENAME},${SRC_URI},${SRCREV},${FROM_AUTOREV}

[YOCTO #3041]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/buildhistory.bbclass | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index a20d03d..fa13ef5 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -44,6 +44,11 @@ python buildhistory_emit_pkghistory() {
             self.pr = "r0"
             self.depends = ""
             self.packages = ""
+            self.bbfile = ""
+            self.src_uri = ""
+            self.srcrev = ""
+            self.srcrev_autorev = ""
+
 
     class PackageInfo:
         def __init__(self, name):
@@ -151,6 +156,12 @@ python buildhistory_emit_pkghistory() {
     pe = d.getVar('PE', True) or "0"
     pv = d.getVar('PV', True)
     pr = d.getVar('PR', True)
+
+    bbfile = d.getVar('BB_FILENAME', True)
+    src_uri = d.getVar('SRC_URI', True)
+    srcrev = d.getVar('SRCREV', True)
+    srcrev_autorev = 'yes' if d.getVar('SRCREV', False) == 'AUTOINC' else 'no'
+
     packages = squashspaces(d.getVar('PACKAGES', True))
 
     packagelist = packages.split()
@@ -159,7 +170,7 @@ python buildhistory_emit_pkghistory() {
     else:
         # Remove files for packages that no longer exist
         for item in os.listdir(pkghistdir):
-            if item != "latest":
+            if item != "latest" and item != "latest_srcrev":
                 if item not in packagelist:
                     subdir = os.path.join(pkghistdir, item)
                     for subfile in os.listdir(subdir):
@@ -171,6 +182,10 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.pv = pv
     rcpinfo.pr = pr
     rcpinfo.depends = sortlist(squashspaces(d.getVar('DEPENDS', True) or ""))
+    rcpinfo.bbfile = bbfile
+    rcpinfo.src_uri = src_uri
+    rcpinfo.srcrev = srcrev
+    rcpinfo.srcrev_autorev = srcrev_autorev
     rcpinfo.packages = packages
     write_recipehistory(rcpinfo, d)
 
@@ -241,6 +256,12 @@ def write_recipehistory(rcpinfo, d):
         f.write("DEPENDS = %s\n" %  rcpinfo.depends)
         f.write("PACKAGES = %s\n" %  rcpinfo.packages)
 
+    if rcpinfo.srcrev:
+        srcrevfile = os.path.join(pkghistdir, "latest_srcrev")
+        with open(srcrevfile, "w") as f:
+            f.write(','.join([rcpinfo.bbfile, rcpinfo.src_uri, rcpinfo.srcrev,
+                        rcpinfo.srcrev_autorev]))
+
 
 def write_pkghistory(pkginfo, d):
     bb.debug(2, "Writing package history for package %s" % pkginfo.name)
-- 
1.7.11.7



