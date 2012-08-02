Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Swrnz-0002yQ-2Q
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 11:34:55 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2012 02:23:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129551539"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.75])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2012 02:23:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 10:23:04 +0100
Message-Id: <3aeeede796fff86e7fa1d49e8845f484a9a26b4d.1343899228.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] classes/buildhistory: save preinst/postinst/prerm/postrm
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Write the value of these package script variables into the packageinfo
so that any changes to them can be tracked (in separate files since they
are multi-line).

Inspired by an earlier patch from Andreas Müller <schnitzeltony@googlemail.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass    |   24 ++++++++++------
 meta/lib/oe/buildhistory_analysis.py |   50 +++++++++++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 9 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 510a6df..200d031 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -57,6 +57,8 @@ python buildhistory_emit_pkghistory() {
             self.rrecommends = ""
             self.files = ""
             self.filelist = ""
+            # Variables that need to be written to their own separate file
+            self.filevars = dict.fromkeys(['pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm'])
 
     # Should check PACKAGES here to see if anything removed
 
@@ -167,6 +169,8 @@ python buildhistory_emit_pkghistory() {
         pkginfo.rdepends = sortpkglist(squashspaces(getpkgvar(pkg, 'RDEPENDS') or ""))
         pkginfo.rrecommends = sortpkglist(squashspaces(getpkgvar(pkg, 'RRECOMMENDS') or ""))
         pkginfo.files = squashspaces(getpkgvar(pkg, 'FILES') or "")
+        for filevar in pkginfo.filevars:
+            pkginfo.filevars[filevar] = getpkgvar(pkg, filevar)
 
         # Gather information about packaged files
         pkgdestpkg = os.path.join(pkgdest, pkg)
@@ -191,16 +195,13 @@ def write_recipehistory(rcpinfo, d):
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
 
     infofile = os.path.join(pkghistdir, "latest")
-    f = open(infofile, "w")
-    try:
+    with open(infofile, "w") as f:
         if rcpinfo.pe != "0":
             f.write("PE = %s\n" %  rcpinfo.pe)
         f.write("PV = %s\n" %  rcpinfo.pv)
         f.write("PR = %s\n" %  rcpinfo.pr)
         f.write("DEPENDS = %s\n" %  rcpinfo.depends)
         f.write("PACKAGES = %s\n" %  rcpinfo.packages)
-    finally:
-        f.close()
 
 
 def write_pkghistory(pkginfo, d):
@@ -213,8 +214,7 @@ def write_pkghistory(pkginfo, d):
         os.makedirs(pkgpath)
 
     infofile = os.path.join(pkgpath, "latest")
-    f = open(infofile, "w")
-    try:
+    with open(infofile, "w") as f:
         if pkginfo.pe != "0":
             f.write("PE = %s\n" %  pkginfo.pe)
         f.write("PV = %s\n" %  pkginfo.pv)
@@ -224,8 +224,16 @@ def write_pkghistory(pkginfo, d):
         f.write("PKGSIZE = %d\n" %  pkginfo.size)
         f.write("FILES = %s\n" %  pkginfo.files)
         f.write("FILELIST = %s\n" %  pkginfo.filelist)
-    finally:
-        f.close()
+
+    for filevar in pkginfo.filevars:
+        filevarpath = os.path.join(pkgpath, "latest.%s" % filevar)
+        val = pkginfo.filevars[filevar]
+        if val:
+            with open(filevarpath, "w") as f:
+                f.write(val)
+        else:
+            if os.path.exists(filevarpath):
+                os.unlink(filevarpath)
 
 
 buildhistory_get_image_installed() {
diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 29dc4a9..6c6a085 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -90,6 +90,18 @@ class ChangeRecord:
             else:
                 percentchg = 100
             out = '%s changed from %s to %s (%s%d%%)' % (self.fieldname, self.oldvalue or "''", self.newvalue or "''", '+' if percentchg > 0 else '', percentchg)
+        elif self.fieldname in ['pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm']:
+            if self.oldvalue and self.newvalue:
+                out = '%s changed:\n  ' % self.fieldname
+            elif self.newvalue:
+                out = '%s added:\n  ' % self.fieldname
+            elif self.oldvalue:
+                out = '%s cleared:\n  ' % self.fieldname
+            alines = self.oldvalue.splitlines()
+            blines = self.newvalue.splitlines()
+            diff = difflib.unified_diff(alines, blines, self.fieldname, self.fieldname, lineterm='')
+            out += '\n  '.join(list(diff)[2:])
+            out += '\n  --'
         elif self.fieldname in img_monitor_files:
             if outer:
                 prefix = 'Changes to %s ' % self.path
@@ -330,7 +342,12 @@ def process_changes(repopath, revision1, revision2 = 'HEAD', report_all = False)
     for d in diff.iter_change_type('M'):
         path = os.path.dirname(d.a_blob.path)
         if path.startswith('packages/'):
-            changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all))
+            filename = os.path.basename(d.a_blob.path)
+            if filename == 'latest':
+                changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all))
+            elif filename.startswith('latest.'):
+                chg = ChangeRecord(path, filename, d.a_blob.data_stream.read(), d.b_blob.data_stream.read(), True)
+                changes.append(chg)
         elif path.startswith('images/'):
             filename = os.path.basename(d.a_blob.path)
             if filename in img_monitor_files:
@@ -356,6 +373,37 @@ def process_changes(repopath, revision1, revision2 = 'HEAD', report_all = False)
             elif filename == 'image-info.txt':
                 changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all))
 
+    # Look for added preinst/postinst/prerm/postrm
+    # (without reporting newly added recipes)
+    addedpkgs = []
+    addedchanges = []
+    for d in diff.iter_change_type('A'):
+        path = os.path.dirname(d.b_blob.path)
+        if path.startswith('packages/'):
+            filename = os.path.basename(d.b_blob.path)
+            if filename == 'latest':
+                addedpkgs.append(path)
+            elif filename.startswith('latest.'):
+                chg = ChangeRecord(path, filename[7:], '', d.b_blob.data_stream.read(), True)
+                addedchanges.append(chg)
+    for chg in addedchanges:
+        found = False
+        for pkg in addedpkgs:
+            if chg.path.startswith(pkg):
+                found = True
+                break
+        if not found:
+            changes.append(chg)
+
+    # Look for cleared preinst/postinst/prerm/postrm
+    for d in diff.iter_change_type('D'):
+        path = os.path.dirname(d.a_blob.path)
+        if path.startswith('packages/'):
+            filename = os.path.basename(d.a_blob.path)
+            if filename != 'latest' and filename.startswith('latest.'):
+                chg = ChangeRecord(path, filename[7:], d.a_blob.data_stream.read(), '', True)
+                changes.append(chg)
+
     # Link related changes
     for chg in changes:
         if chg.monitored:
-- 
1.7.9.5



