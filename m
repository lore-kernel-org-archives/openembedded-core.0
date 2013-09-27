Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A494C6CBAD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 15:46:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Sep 2013 08:46:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,994,1371106800"; d="scan'208";a="410461403"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.88])
	by orsmga002.jf.intel.com with ESMTP; 27 Sep 2013 08:46:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2013 16:46:06 +0100
Message-Id: <1380296766-20331-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] psplash: copy image files from workdir instead of next to recipe
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
X-List-Received-Date: Fri, 27 Sep 2013 15:46:13 -0000

During parsing this recipe builds up a list of splash image files,
however it was recording full paths to local files (i.e. the files next
to the recipe) and then in do_compile it was pointing to those instead
of the fetched files in WORKDIR. Fix it to use the fetched files which
has the added benefit of the do_compile signature not changing if the
recipe is moved around.

Fixes [YOCTO #5250].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 5122d38..1cab296 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -23,8 +23,8 @@ python __anonymous() {
     haspng = False
     for uri in splashfiles:
         fetcher = bb.fetch2.Fetch([uri], d)
-        flocal = fetcher.localpath(uri)
-        fbase = os.path.splitext(os.path.basename(flocal))[0]
+        flocal = os.path.basename(fetcher.localpath(uri))
+        fbase = os.path.splitext(flocal)[0]
         outsuffix = fetcher.ud[uri].parm.get("outsuffix")
         if not outsuffix:
             if fbase.startswith("psplash-"):
@@ -74,18 +74,19 @@ python do_compile () {
     import shutil
 
     # Build a separate executable for each splash image
+    workdir = d.getVar('WORKDIR', True)
     convertscript = "%s/make-image-header.sh" % d.getVar('S', True)
     destfile = "%s/psplash-poky-img.h" % d.getVar('S', True)
     localfiles = d.getVar('SPLASH_LOCALPATHS', True).split()
     outputfiles = d.getVar('SPLASH_INSTALL', True).split()
     for localfile, outputfile in zip(localfiles, outputfiles):
         if localfile.endswith(".png"):
-            outp = oe.utils.getstatusoutput('%s %s POKY' % (convertscript, localfile))
+            outp = oe.utils.getstatusoutput('%s %s POKY' % (convertscript, os.path.join(workdir, localfile)))
             print(outp[1])
-            fbase = os.path.splitext(os.path.basename(localfile))[0]
+            fbase = os.path.splitext(localfile)[0]
             shutil.copyfile("%s-img.h" % fbase, destfile)
         else:
-            shutil.copyfile(localfile, destfile)
+            shutil.copyfile(os.path.join(workdir, localfile), destfile)
         # For some reason just updating the header is not enough, we have to touch the .c
         # file in order to get it to rebuild
         os.utime("%s/psplash.c" % d.getVar('S', True), None)
-- 
1.8.1.2


