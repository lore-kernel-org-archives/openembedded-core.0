Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 934EB77D6D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 04:57:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 06 Apr 2017 21:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,162,1488873600"; d="scan'208";a="1132406952"
Received: from anatara2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2017 21:57:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 16:57:23 +1200
Message-Id: <584e81b4bfec3d3694d52b6bba7ad9f6e2aa7e8e.1491540566.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1491540566.git.paul.eggleton@linux.intel.com>
References: <cover.1491540566.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/6] classes/buildhistory: save output file signatures for sstate tasks
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
X-List-Received-Date: Fri, 07 Apr 2017 04:57:40 -0000

Save a file per task listing sha256sums for each file staged, i.e.
the output of the task. Some caveats:

1) This only covers sstate tasks since it uses SSTATEPOSTUNPACKFUNCS,
   however those are generally the most interesting in terms of output
   anyway.
2) The signature is taken before applying any relocations, so any
   relocated files will actually have different signatures, but that's
   churn that you probably won't want to see here.
3) At the moment if you run the same build twice without sstate you will
   very likely see changes in the output for certain tasks due to things
   like timestamps being present in the binary output. Fixing that is
   a general Linux ecosystem problem - see this page for our efforts to
   resolve it on our side:
     https://wiki.yoctoproject.org/wiki/Reproducible_Builds

NOTE: you need to set your BUILDHISTORY_FEATURES value to include
"task" to enable collection of these signatures as it is is disabled by
default.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 0cafad5..748091d 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -47,6 +47,11 @@ sstate_install[vardepsexclude] += "buildhistory_emit_pkghistory"
 # then the value added to SSTATEPOSTINSTFUNCS:
 SSTATEPOSTINSTFUNCS[vardepvalueexclude] .= "| buildhistory_emit_pkghistory"
 
+# Similarly for our function that gets the output signatures
+SSTATEPOSTUNPACKFUNCS_append = " buildhistory_emit_outputsigs"
+sstate_installpkgdir[vardepsexclude] += "buildhistory_emit_outputsigs"
+SSTATEPOSTUNPACKFUNCS[vardepvalueexclude] .= "| buildhistory_emit_outputsigs"
+
 # All items excepts those listed here will be removed from a recipe's
 # build history directory by buildhistory_emit_pkghistory(). This is
 # necessary because some of these items (package directories, files that
@@ -292,6 +297,29 @@ python buildhistory_emit_pkghistory() {
     bb.build.exec_func("buildhistory_list_pkg_files", d)
 }
 
+python buildhistory_emit_outputsigs() {
+    if not "task" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
+        return
+
+    taskoutdir = os.path.join(d.getVar('BUILDHISTORY_DIR'), 'task', 'output')
+    bb.utils.mkdirhier(taskoutdir)
+    currenttask = d.getVar('BB_CURRENTTASK')
+    pn = d.getVar('PN')
+    taskfile = os.path.join(taskoutdir, '%s.%s' % (pn, currenttask))
+
+    cwd = os.getcwd()
+    filesigs = {}
+    for root, _, files in os.walk(cwd):
+        for fname in files:
+            if fname == 'fixmepath':
+                continue
+            fullpath = os.path.join(root, fname)
+            filesigs[os.path.relpath(fullpath, cwd)] = bb.utils.sha256_file(fullpath)
+    with open(taskfile, 'w') as f:
+        for fpath, fsig in sorted(filesigs.items(), key=lambda item: item[0]):
+            f.write('%s %s\n' % (fpath, fsig))
+}
+
 
 def write_recipehistory(rcpinfo, d):
     bb.debug(2, "Writing recipe history")
-- 
2.9.3


