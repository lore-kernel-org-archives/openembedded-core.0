Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3CBD071B13
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 10:03:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 01 Feb 2017 02:03:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,319,1477983600"; d="scan'208";a="815759747"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Feb 2017 02:03:44 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 66D076A4006;
	Wed,  1 Feb 2017 02:02:45 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 12:03:35 +0200
Message-Id: <1485943415-8260-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] sstate: Fix make_relative_symlink() for RSS
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
X-List-Received-Date: Wed, 01 Feb 2017 10:03:46 -0000

Recipe-specific sysroots broke make_relative_symlink(), which
turns absolute symlinks in sysroots into relative ones. Use the
difference between the (in-sysroot) paths to construct the relative
symlink.

This fixes links in openssl-native, fontconfig-native and bzip2-native.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

sstate is not an area I'm familiar with, please take a good look.

As far as I could see outputpath (based on state[2]) was never really
needed so I did not use it in the new version.


Thanks,
 Jussi


 meta/classes/sstate.bbclass | 35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index aeb7466..7f99cd3 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -583,32 +583,27 @@ python sstate_hardcode_path () {
 def sstate_package(ss, d):
     import oe.path
 
-    def make_relative_symlink(path, outputpath, d):
-        # Replace out absolute TMPDIR paths in symlinks with relative ones
+    def make_relative_symlink(path, workdir, d):
+        # Replace absolute sysroot paths in symlinks with relative ones
         if not os.path.islink(path):
             return
         link = os.readlink(path)
         if not os.path.isabs(link):
             return
-        if not link.startswith(tmpdir):
+        if not link.startswith(workdir):
             return
 
-        #base = os.path.relpath(link, os.path.dirname(path))
+        directory = os.path.dirname(path.rpartition(workdir)[2])
+        base_link = link.rpartition(workdir)[2]
+        rel_path = os.path.relpath(base_link,directory)
 
-        depth = outputpath.rpartition(tmpdir)[2].count('/')
-        base = link.partition(tmpdir)[2].strip()
-        while depth > 1:
-            base = "/.." + base
-            depth -= 1
-        base = "." + base
-
-        bb.debug(2, "Replacing absolute path %s with relative path %s for %s" % (link, base, outputpath))
+        bb.debug(2, "Replacing absolute path %s with relative path %s for %s" % (link, rel_path, path))
         os.remove(path)
-        os.symlink(base, path)
+        os.symlink(rel_path, path)
 
-    tmpdir = d.getVar('TMPDIR')
+    workdir = d.getVar('WORKDIR')
 
-    sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['task'])
+    sstatebuild = workdir + "/sstate-build-" +ss['task'] + "/"
     sstatepkg = d.getVar('SSTATE_PKG') + '_'+ ss['task'] + ".tgz"
     bb.utils.remove(sstatebuild, recurse=True)
     bb.utils.mkdirhier(sstatebuild)
@@ -620,18 +615,12 @@ def sstate_package(ss, d):
             continue
         srcbase = state[0].rstrip("/").rsplit('/', 1)[0]
         for walkroot, dirs, files in os.walk(state[1]):
-            for file in files:
+            for file in files + dirs:
                 srcpath = os.path.join(walkroot, file)
-                dstpath = srcpath.replace(state[1], state[2])
-                make_relative_symlink(srcpath, dstpath, d)
-            for dir in dirs:
-                srcpath = os.path.join(walkroot, dir)
-                dstpath = srcpath.replace(state[1], state[2])
-                make_relative_symlink(srcpath, dstpath, d)
+                make_relative_symlink(srcpath, workdir, d)
         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
         os.rename(state[1], sstatebuild + state[0])
 
-    workdir = d.getVar('WORKDIR')
     for plain in ss['plaindirs']:
         pdir = plain.replace(workdir, sstatebuild)
         bb.utils.mkdirhier(plain)
-- 
2.1.4


