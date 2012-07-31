Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sw0A6-0004FO-5z
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 02:18:10 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2012 17:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175049402"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.49])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2012 17:06:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 01:06:24 +0100
Message-Id: <c3c9b868ca9073e19415493a3fd5ff84470cfd34.1343693147.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/7] combo-layer: improve patch list handling and output
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
X-List-Received-Date: Tue, 31 Jul 2012 00:18:10 -0000

* Ignore blank lines in patch list
* Don't fail in interactive mode if patch list is deleted
* Show patch counter
* Show relative path for patches
* Print headings before applying patch list for each component

Also change to using a "with" block to read the patch list so it gets
closed properly when we're finished.

Fixes [YOCTO #2455].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |   67 ++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 22 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 4025b72..40e63b9 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -263,7 +263,7 @@ def action_update(conf, args):
         repo_patch_dir = os.path.join(os.getcwd(), patch_dir, name)
 
         # Step 2: generate the patch list and store to patch dir
-        logger.info("generating patches for %s" % name)
+        logger.info("Generating patches from %s..." % name)
         if dest_dir != ".":
             prefix = "--src-prefix=a/%s/ --dst-prefix=b/%s/" % (dest_dir, dest_dir)
         else:
@@ -337,27 +337,50 @@ def apply_patchlist(conf, repos):
         repo = conf.repos[name]
         lastrev = repo["last_revision"]
         prevrev = lastrev
-        for line in open(repo['patchlist']):
-            patchfile = line.split()[0]
-            lastrev = line.split()[1]
-            if os.path.getsize(patchfile) == 0:
-                logger.info("(skipping %s - no changes)", lastrev)
-            else:
-                cmd = "git am --keep-cr -s -p1 %s" % patchfile
-                logger.info("Apply %s" % patchfile )
-                try:
-                    runcmd(cmd)
-                except subprocess.CalledProcessError:
-                    logger.info('running "git am --abort" to cleanup repo')
-                    runcmd("git am --abort")
-                    logger.error('"%s" failed' % cmd)
-                    logger.info("please manually apply patch %s" % patchfile)
-                    logger.info("Note: if you exit and continue applying without manually applying the patch, it will be skipped")
-                    if not drop_to_shell():
-                        if prevrev != repo['last_revision']:
-                            conf.update(name, "last_revision", prevrev)
-                        sys.exit(0)
-            prevrev = lastrev
+
+        # Get non-blank lines from patch list file
+        patchlist = []
+        if os.path.exists(repo['patchlist']) or not conf.interactive:
+            # Note: we want this to fail here if the file doesn't exist and we're not in
+            # interactive mode since the file should exist in this case
+            with open(repo['patchlist']) as f:
+                for line in f:
+                    line = line.rstrip()
+                    if line:
+                        patchlist.append(line)
+
+        if patchlist:
+            logger.info("Applying patches from %s..." % name)
+            linecount = len(patchlist)
+            i = 1
+            for line in patchlist:
+                patchfile = line.split()[0]
+                lastrev = line.split()[1]
+                patchdisp = os.path.relpath(patchfile)
+                if os.path.getsize(patchfile) == 0:
+                    logger.info("(skipping %d/%d %s - no changes)" % (i, linecount, patchdisp))
+                else:
+                    cmd = "git am --keep-cr -s -p1 %s" % patchfile
+                    logger.info("Applying %d/%d: %s" % (i, linecount, patchdisp))
+                    try:
+                        runcmd(cmd)
+                    except subprocess.CalledProcessError:
+                        logger.info('Running "git am --abort" to cleanup repo')
+                        runcmd("git am --abort")
+                        logger.error('"%s" failed' % cmd)
+                        logger.info("Please manually apply patch %s" % patchdisp)
+                        logger.info("Note: if you exit and continue applying without manually applying the patch, it will be skipped")
+                        if not drop_to_shell():
+                            if prevrev != repo['last_revision']:
+                                conf.update(name, "last_revision", prevrev)
+                            sys.exit(0)
+                prevrev = lastrev
+                i += 1
+        else:
+            logger.info("No patches to apply from %s" % name)
+            ldir = conf.repos[name]['local_repo_dir']
+            lastrev = runcmd("git rev-parse HEAD", ldir).strip()
+
         if lastrev != repo['last_revision']:
             conf.update(name, "last_revision", lastrev)
 
-- 
1.7.9.5



