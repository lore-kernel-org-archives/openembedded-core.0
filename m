Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 43C8360720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 01:45:57 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2016 17:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,616,1473145200"; d="scan'208";a="189697370"
Received: from yspay-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.149])
	by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2016 17:45:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 14:45:17 +1300
Message-Id: <05a1357f6b653bb1449ce32651bc9636c1571a4b.1478742229.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1478742229.git.paul.eggleton@linux.intel.com>
References: <cover.1478742229.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1478742229.git.paul.eggleton@linux.intel.com>
References: <cover.1478742229.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/7] devtool: update-recipe: fix handling of compressed local patches
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
X-List-Received-Date: Thu, 10 Nov 2016 01:45:57 -0000

It is possible to use gzip or bzip2 to compress patches and still refer
to them in compressed form in the SRC_URI value within a recipe. If you
run "devtool modify" on such a recipe, make changes to the commit for
the patch and then run devtool update-recipe, we need to correctly
associate the commit back to the compressed patch file and re-compress
the patch, neither of which we were doing previously.

Additionally, add an oe-selftest test to ensure this doesn't regress in
future.

Fixes [YOCTO #8278].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-test/devtool/devtool-test-patch-gz.bb  |  16 ++++++
 .../devtool/devtool-test-patch-gz/readme.patch.gz  | Bin 0 -> 449 bytes
 meta/classes/patch.bbclass                         |   9 ++--
 meta/lib/oe/recipeutils.py                         |   6 +--
 meta/lib/oeqa/selftest/devtool.py                  |  24 +++++++++
 scripts/lib/devtool/standard.py                    |  55 ++++++++++++++-------
 6 files changed, 85 insertions(+), 25 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-patch-gz/readme.patch.gz

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb b/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
new file mode 100644
index 0000000..719a5f1
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
@@ -0,0 +1,16 @@
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "libxres libxext virtual/libx11 ncurses"
+
+SRC_URI = "http://downloads.yoctoproject.org/releases/xrestop/xrestop-0.4.tar.gz \
+           file://readme.patch.gz \
+           "
+
+S = "${WORKDIR}/xrestop-0.4"
+
+SRC_URI[md5sum] = "d8a54596cbaf037e62b80c4585a3ca9b"
+SRC_URI[sha256sum] = "67c2fc94a7ecedbaae0d1837e82e93d1d98f4a6d759828860e552119af3ce257"
+
+inherit autotools pkgconfig
+
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-patch-gz/readme.patch.gz b/meta-selftest/recipes-test/devtool/devtool-test-patch-gz/readme.patch.gz
new file mode 100644
index 0000000000000000000000000000000000000000..4752492ccd661e2c360d8fe2ca4dcef61dea89ce
GIT binary patch
literal 449
zcmV;y0Y3g8iwFpRQ6X3W19D|yWNl?GaA9;~XaJQ_O>5jR5WVYHyjxnlc4f!1V^fNk
zWJ7aE3E3?KLJs~Id)3;KYs+B+{qddME-gJ44dTsc=FQC0?PLdJlx8wZ;!344qp+#@
zPUA$yDr(w9R#{f3l}d1L4Yo8QOd(}{GDK2_;+AQ0Jd{h1P1p70IPv4iZa`<Z=(Sl6
zfi{l%pti#&aZ@_Vv0G?`D}1r9%oHX}orfw9FX4rkQi|<TeWTjtcz#&#u0OwE-83kT
zb$gn?lmutN4kjv_frR)v&W`cmZ(Zq@ImewT$8oabq`4oS9nDUg?nQ{L?hG})ZCk&3
z``_Vx-xqk?tZ(i&_=yOfClI35J)z#0rlV%XQEg_LoVI3u=e-xA(QOOg@3cet;apsu
zfzYO*1JWwKl4%(Pm5OSmDuhxdaeVCer$%_5_qVPn;D@WDUMq#75O{i|d1puH8EafP
zJ6^C*-;YAs9<7})SfibtSOq-cy4PeJc+OW=bfVcVQ%zXrvZDZk&z<A&k45v_N$Dd$
r=-|lAyjdVT;qCU^jP0L~(dLx?d(410fQSMWC?S3U{t;{<bpikYONih}

literal 0
HcmV?d00001

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 1f6927b..2c1f58c 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -10,13 +10,13 @@ PATCH_GIT_USER_EMAIL ?= "oe.patch@oe"
 
 inherit terminal
 
-def src_patches(d, all = False ):
+def src_patches(d, all=False, expand=True):
     workdir = d.getVar('WORKDIR', True)
     fetch = bb.fetch2.Fetch([], d)
     patches = []
     sources = []
     for url in fetch.urls:
-        local = patch_path(url, fetch, workdir)
+        local = patch_path(url, fetch, workdir, expand)
         if not local:
             if all:
                 local = fetch.localpath(url)
@@ -55,13 +55,14 @@ def src_patches(d, all = False ):
 
     return patches
 
-def patch_path(url, fetch, workdir):
+def patch_path(url, fetch, workdir, expand=True):
     """Return the local path of a patch, or None if this isn't a patch"""
 
     local = fetch.localpath(url)
     base, ext = os.path.splitext(os.path.basename(local))
     if ext in ('.gz', '.bz2', '.Z'):
-        local = os.path.join(workdir, base)
+        if expand:
+            local = os.path.join(workdir, base)
         ext = os.path.splitext(base)[1]
 
     urldata = fetch.ud[url]
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 6caae5f..ab4177a 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -397,7 +397,7 @@ def get_recipe_local_files(d, patches=False):
     for uri in uris:
         if fetch.ud[uri].type == 'file':
             if (not patches and
-                    bb.utils.exec_flat_python_func('patch_path', uri, fetch, '')):
+                    bb.utils.exec_flat_python_func('patch_path', uri, fetch, '', expand=False)):
                 continue
             # Skip files that are referenced by absolute path
             fname = fetch.ud[uri].basepath
@@ -418,7 +418,7 @@ def get_recipe_patches(d):
     patchfiles = []
     # Execute src_patches() defined in patch.bbclass - this works since that class
     # is inherited globally
-    patches = bb.utils.exec_flat_python_func('src_patches', d)
+    patches = bb.utils.exec_flat_python_func('src_patches', d, expand=False)
     for patch in patches:
         _, _, local, _, _, parm = bb.fetch.decodeurl(patch)
         patchfiles.append(local)
@@ -437,7 +437,7 @@ def get_recipe_patched_files(d):
     import oe.patch
     # Execute src_patches() defined in patch.bbclass - this works since that class
     # is inherited globally
-    patches = bb.utils.exec_flat_python_func('src_patches', d)
+    patches = bb.utils.exec_flat_python_func('src_patches', d, expand=False)
     patchedfiles = {}
     for patch in patches:
         _, _, patchfile, _, _, parm = bb.fetch.decodeurl(patch)
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index f6226c1..92dc5e5 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -948,6 +948,30 @@ class DevtoolTests(DevtoolBase):
         expected_status = [(' M', '.*/%s/file2$' % testrecipe)]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
+    def test_devtool_update_recipe_local_patch_gz(self):
+        # First, modify the recipe
+        testrecipe = 'devtool-test-patch-gz'
+        recipefile = get_bb_var('FILE', testrecipe)
+        src_uri = get_bb_var('SRC_URI', testrecipe)
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        # (don't bother with cleaning the recipe on teardown, we won't be building it)
+        result = runCmd('devtool modify %s' % testrecipe)
+        # Modify one file
+        srctree = os.path.join(self.workspacedir, 'sources', testrecipe)
+        runCmd('echo "Another line" >> README', cwd=srctree)
+        runCmd('git commit -a --amend --no-edit', cwd=srctree)
+        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        result = runCmd('devtool update-recipe %s' % testrecipe)
+        expected_status = [(' M', '.*/%s/readme.patch.gz$' % testrecipe)]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        patch_gz = os.path.join(os.path.dirname(recipefile), testrecipe, 'readme.patch.gz')
+        result = runCmd('file %s' % patch_gz)
+        if 'gzip compressed data' not in result.output:
+            self.fail('New patch file is not gzipped - file reports:\n%s' % result.output)
+
     @testcase(1163)
     def test_devtool_extract(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1511641..af0d467 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1128,7 +1128,7 @@ def _remove_source_files(append, files, destpath):
                     raise
 
 
-def _export_patches(srctree, rd, start_rev, destdir):
+def _export_patches(srctree, rd, start_rev, destdir, changed_revs=None):
     """Export patches from srctree to given location.
        Returns three-tuple of dicts:
          1. updated - patches that already exist in SRCURI
@@ -1157,18 +1157,44 @@ def _export_patches(srctree, rd, start_rev, destdir):
         # revision This does assume that people are using unique shortlog
         # values, but they ought to be anyway...
         new_basename = seqpatch_re.match(new_patch).group(2)
-        found = False
+        match_name = None
         for old_patch in existing_patches:
             old_basename = seqpatch_re.match(old_patch).group(2)
-            if new_basename == old_basename:
-                updated[new_patch] = existing_patches.pop(old_patch)
-                found = True
-                # Rename patch files
-                if new_patch != old_patch:
-                    os.rename(os.path.join(destdir, new_patch),
-                              os.path.join(destdir, old_patch))
+            old_basename_splitext = os.path.splitext(old_basename)
+            if old_basename.endswith(('.gz', '.bz2', '.Z')) and old_basename_splitext[0] == new_basename:
+                old_patch_noext = os.path.splitext(old_patch)[0]
+                match_name = old_patch_noext
                 break
-        if not found:
+            elif new_basename == old_basename:
+                match_name = old_patch
+                break
+        if match_name:
+            # Rename patch files
+            if new_patch != match_name:
+                os.rename(os.path.join(destdir, new_patch),
+                          os.path.join(destdir, match_name))
+            # Need to pop it off the list now before checking changed_revs
+            oldpath = existing_patches.pop(old_patch)
+            if changed_revs is not None:
+                # Avoid updating patches that have not actually changed
+                with open(os.path.join(destdir, match_name), 'r') as f:
+                    firstlineitems = f.readline().split()
+                    # Looking for "From <hash>" line
+                    if len(firstlineitems) > 1 and len(firstlineitems[1]) == 40:
+                        if not firstlineitems[1] in changed_revs:
+                            continue
+            # Recompress if necessary
+            if oldpath.endswith(('.gz', '.Z')):
+                bb.process.run(['gzip', match_name], cwd=destdir)
+                if oldpath.endswith('.gz'):
+                    match_name += '.gz'
+                else:
+                    match_name += '.Z'
+            elif oldpath.endswith('.bz2'):
+                bb.process.run(['bzip2', match_name], cwd=destdir)
+                match_name += '.bz2'
+            updated[match_name] = oldpath
+        else:
             added[new_patch] = None
     return (updated, added, existing_patches)
 
@@ -1415,7 +1441,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
         # Get updated patches from source tree
         patches_dir = tempfile.mkdtemp(dir=tempdir)
         upd_p, new_p, del_p = _export_patches(srctree, rd, update_rev,
-                                              patches_dir)
+                                              patches_dir, changed_revs)
         updatefiles = False
         updaterecipe = False
         destpath = None
@@ -1453,13 +1479,6 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                 updatefiles = True
             for basepath, path in upd_p.items():
                 patchfn = os.path.join(patches_dir, basepath)
-                if changed_revs is not None:
-                    # Avoid updating patches that have not actually changed
-                    with open(patchfn, 'r') as f:
-                        firstlineitems = f.readline().split()
-                        if len(firstlineitems) > 1 and len(firstlineitems[1]) == 40:
-                            if not firstlineitems[1] in changed_revs:
-                                continue
                 logger.info('Updating patch %s' % basepath)
                 _move_file(patchfn, path)
                 updatefiles = True
-- 
2.5.5


