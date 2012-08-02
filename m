Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Swrnz-0002yR-Ba
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 11:34:55 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2012 02:23:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129551544"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.75])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2012 02:23:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 10:23:05 +0100
Message-Id: <2c1ac146a0dc83bb0c7546a56d5c4d11d38294e7.1343899228.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/9] classes/buildhistory: record PKG/PKGE/PKGV/PKGR
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
X-List-Received-Date: Thu, 02 Aug 2012 09:34:55 -0000

Save PKG (the actual output package name, which is often different due
to debian renaming), and PKGE/PKGV/PKGR (which may be manipulated in
certain special cases e.g. gitpkgv.bbclass in meta-oe, the
external-sourcery-toolchain recipe, etc.) Note that these are only
written when they are different from the normal package name in the
case of PKG, or PE/PV/PR for the other variables.

Also, use PKGE/PKGV/PKGR instead of PE/PV/PR when comparing package
versions since these actually represent the version that the package
manager sees.

Implements [YOCTO #2787].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass    |   66 +++++++++++++++++++++++++---------
 meta/lib/oe/buildhistory_analysis.py |   22 +++++++++++-
 2 files changed, 71 insertions(+), 17 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 200d031..76648c9 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -51,6 +51,11 @@ python buildhistory_emit_pkghistory() {
             self.pe = "0"
             self.pv = "0"
             self.pr = "r0"
+            # pkg/pkge/pkgv/pkgr should be empty because we want to be able to default them
+            self.pkg = ""
+            self.pkge = ""
+            self.pkgv = ""
+            self.pkgr = ""
             self.size = 0
             self.depends = ""
             self.rdepends = ""
@@ -72,8 +77,7 @@ python buildhistory_emit_pkghistory() {
 
     def readPackageInfo(pkg, histfile):
         pkginfo = PackageInfo(pkg)
-        f = open(histfile, "r")
-        try:
+        with open(histfile, "r") as f:
             for line in f:
                 lns = line.split('=')
                 name = lns[0].strip()
@@ -84,6 +88,14 @@ python buildhistory_emit_pkghistory() {
                     pkginfo.pv = value
                 elif name == "PR":
                     pkginfo.pr = value
+                elif name == "PKG":
+                    pkginfo.pkg = value
+                elif name == "PKGE":
+                    pkginfo.pkge = value
+                elif name == "PKGV":
+                    pkginfo.pkgv = value
+                elif name == "PKGR":
+                    pkginfo.pkgr = value
                 elif name == "RDEPENDS":
                     pkginfo.rdepends = value
                 elif name == "RRECOMMENDS":
@@ -94,8 +106,15 @@ python buildhistory_emit_pkghistory() {
                     pkginfo.files = value
                 elif name == "FILELIST":
                     pkginfo.filelist = value
-        finally:
-            f.close()
+        # Apply defaults
+        if not pkginfo.pkg:
+            pkginfo.pkg = pkginfo.name
+        if not pkginfo.pkge:
+            pkginfo.pkge = pkginfo.pe
+        if not pkginfo.pkgv:
+            pkginfo.pkgv = pkginfo.pv
+        if not pkginfo.pkgr:
+            pkginfo.pkgr = pkginfo.pr
         return pkginfo
 
     def getlastpkgversion(pkg):
@@ -143,29 +162,33 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.packages = packages
     write_recipehistory(rcpinfo, d)
 
-    # Apparently the version can be different on a per-package basis (see Python)
     pkgdest = d.getVar('PKGDEST', True)
     for pkg in packagelist:
-        pe = getpkgvar(pkg, 'PE') or "0"
-        pv = getpkgvar(pkg, 'PV')
-        pr = getpkgvar(pkg, 'PR')
+        pkge = getpkgvar(pkg, 'PKGE') or "0"
+        pkgv = getpkgvar(pkg, 'PKGV')
+        pkgr = getpkgvar(pkg, 'PKGR')
         #
         # Find out what the last version was
         # Make sure the version did not decrease
         #
         lastversion = getlastpkgversion(pkg)
         if lastversion:
-            last_pe = lastversion.pe
-            last_pv = lastversion.pv
-            last_pr = lastversion.pr
-            r = bb.utils.vercmp((pe, pv, pr), (last_pe, last_pv, last_pr))
+            last_pkge = lastversion.pkge
+            last_pkgv = lastversion.pkgv
+            last_pkgr = lastversion.pkgr
+            r = bb.utils.vercmp((pkge, pkgv, pkgr), (last_pkge, last_pkgv, last_pkgr))
             if r < 0:
-                bb.error("Package version for package %s went backwards which would break package feeds from (%s:%s-%s to %s:%s-%s)" % (pkg, last_pe, last_pv, last_pr, pe, pv, pr))
+                bb.error("Package version for package %s went backwards which would break package feeds from (%s:%s-%s to %s:%s-%s)" % (pkg, last_pkge, last_pkgv, last_pkgr, pkge, pkgv, pkgr))
 
         pkginfo = PackageInfo(pkg)
-        pkginfo.pe = pe
-        pkginfo.pv = pv
-        pkginfo.pr = pr
+        # Apparently the version can be different on a per-package basis (see Python)
+        pkginfo.pe = getpkgvar(pkg, 'PE') or "0"
+        pkginfo.pv = getpkgvar(pkg, 'PV')
+        pkginfo.pr = getpkgvar(pkg, 'PR')
+        pkginfo.pkg = getpkgvar(pkg, 'PKG') or pkg
+        pkginfo.pkge = pkge
+        pkginfo.pkgv = pkgv
+        pkginfo.pkgr = pkgr
         pkginfo.rdepends = sortpkglist(squashspaces(getpkgvar(pkg, 'RDEPENDS') or ""))
         pkginfo.rrecommends = sortpkglist(squashspaces(getpkgvar(pkg, 'RRECOMMENDS') or ""))
         pkginfo.files = squashspaces(getpkgvar(pkg, 'FILES') or "")
@@ -219,6 +242,17 @@ def write_pkghistory(pkginfo, d):
             f.write("PE = %s\n" %  pkginfo.pe)
         f.write("PV = %s\n" %  pkginfo.pv)
         f.write("PR = %s\n" %  pkginfo.pr)
+
+        pkgvars = {}
+        pkgvars['PKG'] = pkginfo.pkg if pkginfo.pkg != pkginfo.name else ''
+        pkgvars['PKGE'] = pkginfo.pkge if pkginfo.pkge != pkginfo.pe else ''
+        pkgvars['PKGV'] = pkginfo.pkgv if pkginfo.pkgv != pkginfo.pv else ''
+        pkgvars['PKGR'] = pkginfo.pkgr if pkginfo.pkgr != pkginfo.pr else ''
+        for pkgvar in pkgvars:
+            val = pkgvars[pkgvar]
+            if val:
+                f.write("%s = %s\n" % (pkgvar, val))
+
         f.write("RDEPENDS = %s\n" %  pkginfo.rdepends)
         f.write("RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
         f.write("PKGSIZE = %d\n" %  pkginfo.size)
diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 6c6a085..55bd7b7 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -19,9 +19,10 @@ import bb.utils
 # How to display fields
 list_fields = ['DEPENDS', 'RDEPENDS', 'RRECOMMENDS', 'FILES', 'FILELIST', 'USER_CLASSES', 'IMAGE_CLASSES', 'IMAGE_FEATURES', 'IMAGE_LINGUAS', 'IMAGE_INSTALL', 'BAD_RECOMMENDATIONS']
 list_order_fields = ['PACKAGES']
+defaultval_fields = ['PKG', 'PKGE', 'PKGV', 'PKGR']
 numeric_fields = ['PKGSIZE', 'IMAGESIZE']
 # Fields to monitor
-monitor_fields = ['RDEPENDS', 'RRECOMMENDS', 'PACKAGES', 'FILELIST', 'PKGSIZE', 'IMAGESIZE']
+monitor_fields = ['RDEPENDS', 'RRECOMMENDS', 'PACKAGES', 'FILELIST', 'PKGSIZE', 'IMAGESIZE', 'PKG', 'PKGE', 'PKGV', 'PKGR']
 # Percentage change to alert for numeric fields
 monitor_numeric_threshold = 20
 # Image files to monitor (note that image-info.txt is handled separately)
@@ -90,6 +91,10 @@ class ChangeRecord:
             else:
                 percentchg = 100
             out = '%s changed from %s to %s (%s%d%%)' % (self.fieldname, self.oldvalue or "''", self.newvalue or "''", '+' if percentchg > 0 else '', percentchg)
+        elif self.fieldname in defaultval_fields:
+            out = '%s changed from %s to %s' % (self.fieldname, self.oldvalue, self.newvalue)
+            if self.fieldname == 'PKG' and '[default]' in self.newvalue:
+                out += ' - may indicate debian renaming failure'
         elif self.fieldname in ['pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm']:
             if self.oldvalue and self.newvalue:
                 out = '%s changed:\n  ' % self.fieldname
@@ -299,6 +304,14 @@ def compare_dict_blobs(path, ablob, bblob, report_all):
     adict = blob_to_dict(ablob)
     bdict = blob_to_dict(bblob)
 
+    defaultvals = {}
+    defaultvals['PKG'] = os.path.basename(path)
+    defaultvals['PKGE'] = adict.get('PE', '0')
+    defaultvals['PKGV'] = adict.get('PV', '')
+    defaultvals['PKGR'] = adict.get('PR', '')
+    for key in defaultvals:
+        defaultvals[key] = '%s [default]' % defaultvals[key]
+
     changes = []
     keys = list(set(adict.keys()) | set(bdict.keys()))
     for key in keys:
@@ -327,6 +340,13 @@ def compare_dict_blobs(path, ablob, bblob, report_all):
                 blist.sort()
                 if ' '.join(alist) == ' '.join(blist):
                     continue
+
+            if key in defaultval_fields:
+                if not astr:
+                    astr = defaultvals[key]
+                elif not bstr:
+                    bstr = defaultvals[key]
+
             chg = ChangeRecord(path, key, astr, bstr, key in monitor_fields)
             changes.append(chg)
     return changes
-- 
1.7.9.5



