Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8FA731A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 15:17:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6BFHgjv009051
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 08:17:42 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Jul 2016 08:17:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jul 2016 08:17:36 -0700
Message-ID: <0632cd77ad082911f6bf1df236e525421ede5953.1468249600.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1468249600.git.liezhi.yang@windriver.com>
References: <cover.1468249600.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] packagefeed-stability.bbclass: copy all packages of a recipe
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
X-List-Received-Date: Mon, 11 Jul 2016 15:17:42 -0000
Content-Type: text/plain

A recipes can generate several rpms such as a.rpm, a-dev.rpm, a-dbg.rpm,
when update one of them in the repo, we'd better update all of them,
otherwise, there might be a-dev.r0.1.rpm and a-dbg.r0.3.rpm in the repo,
which looks strange.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/packagefeed-stability.bbclass | 103 ++++++++++-------------------
 1 file changed, 35 insertions(+), 68 deletions(-)

diff --git a/meta/classes/packagefeed-stability.bbclass b/meta/classes/packagefeed-stability.bbclass
index 808a18f..ac0a1cf 100644
--- a/meta/classes/packagefeed-stability.bbclass
+++ b/meta/classes/packagefeed-stability.bbclass
@@ -133,8 +133,10 @@ def package_compare_impl(pkgtype, d):
 
     pkgwritetask = 'package_write_%s' % pkgtype
     files = []
-    copypkgs = []
+    docopy = False
     manifest, _ = oe.sstatesig.sstate_get_manifest_filename(pkgwritetask, d)
+    # Copy recipe's all packages if one of the packages are different to make
+    # they have the same PR.
     with open(manifest, 'r') as f:
         for line in f:
             if line.startswith(prepath):
@@ -164,88 +166,53 @@ def package_compare_impl(pkgtype, d):
                         bb.warn('Unable to map %s back to package' % pkgbasename)
                         destpathspec = destpath
 
-                    oldfiles = glob.glob(destpathspec)
                     oldfile = None
-                    docopy = True
-                    if oldfiles:
-                        oldfile = oldfiles[-1]
-                        result = subprocess.call(['pkg-diff.sh', oldfile, srcpath])
-                        if result == 0:
-                            docopy = False
-
-                    files.append((pkgname, pkgbasename, srcpath, oldfile, destpath))
-                    bb.debug(2, '%s: package %s %s' % (pn, files[-1], docopy))
-                    if docopy:
-                        copypkgs.append(pkgname)
-
-    # Ensure that dependencies on specific versions (such as -dev on the
-    # main package) are copied in lock-step
-    changed = True
-    while changed:
-        rpkgdict = {x[0]: x[1] for x in rpkglist}
-        changed = False
-        for pkgname, pkgbasename, srcpath, oldfile, destpath in files:
-            rdeps = rdepends.get(pkgname, None)
-            if not rdeps:
-                continue
-            rdepvers = bb.utils.explode_dep_versions2(rdeps)
-            for rdep, versions in rdepvers.items():
-                dep = rpkgdict.get(rdep, None)
-                for version in versions:
-                    if version and version.startswith('= '):
-                        if dep in copypkgs and not pkgname in copypkgs:
-                            bb.debug(2, '%s: copying %s because it has a fixed version dependency on %s and that package is going to be copied' % (pn, pkgname, dep))
-                            changed = True
-                            copypkgs.append(pkgname)
-                        elif pkgname in copypkgs and not dep in copypkgs:
-                            bb.debug(2, '%s: copying %s because %s has a fixed version dependency on it and that package is going to be copied' % (pn, dep, pkgname))
-                            changed = True
-                            copypkgs.append(dep)
-
-    # Read in old manifest so we can delete any packages we aren't going to replace or preserve
-    pcmanifest = os.path.join(prepath, d.expand('pkg-compare-manifest-${MULTIMACH_TARGET_SYS}-${PN}'))
-    try:
-        with open(pcmanifest, 'r') as f:
-            knownfiles = [x[3] for x in files if x[3]]
-            for line in f:
-                fn = line.rstrip()
-                if fn:
-                    if fn in knownfiles:
-                        knownfiles.remove(fn)
-                    else:
+                    if not docopy:
+                        oldfiles = glob.glob(destpathspec)
+                        if oldfiles:
+                            oldfile = oldfiles[-1]
+                            result = subprocess.call(['pkg-diff.sh', oldfile, srcpath])
+                            if result != 0:
+                                docopy = True
+                                bb.note("%s and %s are different, will copy packages" % (oldfile, srcpath))
+                        else:
+                            docopy = True
+                            bb.note("No old packages found for %s, will copy packages" % pkgname)
+
+                    files.append((pkgname, pkgbasename, srcpath, destpath))
+
+    # Remove all the old files and copy again if docopy
+    if docopy:
+        bb.note('Copying packages for recipe %s' % pn)
+        pcmanifest = os.path.join(prepath, d.expand('pkg-compare-manifest-${MULTIMACH_TARGET_SYS}-${PN}'))
+        try:
+            with open(pcmanifest, 'r') as f:
+                for line in f:
+                    fn = line.rstrip()
+                    if fn:
                         try:
                             os.remove(fn)
-                            bb.warn('Removed old package %s' % fn)
+                            bb.note('Removed old package %s' % fn)
                         except OSError as e:
                             if e.errno == errno.ENOENT:
                                 pass
-    except IOError as e:
-        if e.errno == errno.ENOENT:
-            pass
+        except IOError as e:
+            if e.errno == errno.ENOENT:
+                pass
 
-    # Create new manifest
-    with open(pcmanifest, 'w') as f:
-        for pkgname, pkgbasename, srcpath, oldfile, destpath in files:
-            if pkgname in copypkgs:
-                bb.warn('Copying %s' % pkgbasename)
+        # Create new manifest
+        with open(pcmanifest, 'w') as f:
+            for pkgname, pkgbasename, srcpath, destpath in files:
                 destdir = os.path.dirname(destpath)
                 bb.utils.mkdirhier(destdir)
-                if oldfile:
-                    try:
-                        os.remove(oldfile)
-                    except OSError as e:
-                        if e.errno == errno.ENOENT:
-                            pass
                 if (os.stat(srcpath).st_dev == os.stat(destdir).st_dev):
                     # Use a hard link to save space
                     os.link(srcpath, destpath)
                 else:
                     shutil.copyfile(srcpath, destpath)
                 f.write('%s\n' % destpath)
-            else:
-                bb.warn('Not copying %s' % pkgbasename)
-                f.write('%s\n' % oldfile)
-
+    else:
+        bb.note('Not copying packages for %s' % pn)
 
 do_cleanall_append() {
     import errno
-- 
2.9.0


