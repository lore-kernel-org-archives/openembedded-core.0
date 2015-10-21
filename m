Return-Path: <roy@currantlabs.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1BA2375E80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 23:06:05 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so70388845pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 16:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C0MvegXDU4Nb3FZWpILEViV1qK6faM/FwDWX2Qluk8A=;
	b=Jld/b509siCsoJSsSz93gBv2mUCnv/RKGceRgKKuK+Y1DLWo6mYwGU8CC6c11Wxv6Z
	b2RJ8M8HRXM/hZ58KHTjrnpcsjQv3jGRnbDqodyn+oi1deSwWpXc8FtTkPipqwG/4JJJ
	iY+mx8CtzG6lvCC+/Vu41KZucoull5YAKHfZFTqX5YkcMrHVu5Rfx0zjoc5VWrepAXlW
	si6/SI8p4z5HBO9RaAxv4fpSSEBOoclTH3AkT2SDPtWky746c9Ji5pC5Qe5DOE0LSDRF
	3sh+6c8780FyZ/8DNcippaNQJKoUtBL9HT6i5MNeJarSpA1gzStQotSXox7DnG++ZW//
	Udhg==
X-Gm-Message-State: ALoCoQkAa3WDmC8QV+pwyb1/me+45cyPXNlAAA2uwKConjtbBn4WW4GOw1DivqNbEq/C+uoAQwuu
X-Received: by 10.66.120.237 with SMTP id lf13mr13230963pab.25.1445468765993; 
	Wed, 21 Oct 2015 16:06:05 -0700 (PDT)
Received: from localhost.localdomain (c-67-169-68-81.hsd1.ca.comcast.net.
	[67.169.68.81]) by smtp.gmail.com with ESMTPSA id
	yh3sm10990411pbb.82.2015.10.21.16.06.05
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 21 Oct 2015 16:06:05 -0700 (PDT)
From: Tzu-Jung Lee <roy@currantlabs.com>
X-Google-Original-From: Tzu-Jung Lee <roylee17@currantlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Oct 2015 23:06:45 +0000
Message-Id: <1445468805-22100-1-git-send-email-roylee17@currantlabs.com>
X-Mailer: git-send-email 2.6.2
Cc: Tzu-Jung Lee <roylee17@currantlabs.com>
Subject: [meta-oe][PATCH] devtool: add sync command
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
X-List-Received-Date: Wed, 21 Oct 2015 23:06:06 -0000

The sync command is similar to the extract command, except it
fetches the sync'ed and patched branch to an existing git repository.

This enables users to keep track the upstream development while
maintaining their own local git repository at the same time.

Signed-off-by: Tzu-Jung Lee <roylee17@currantlabs.com>
---
 scripts/lib/devtool/standard.py | 73 +++++++++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 17 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 5d7e903..2c6b7b3 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -234,7 +234,29 @@ def extract(args, config, basepath, workspace):
         return 1
 
     srctree = os.path.abspath(args.srctree)
-    initial_rev = _extract_source(srctree, args.keep_temp, args.branch, rd)
+    initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, rd)
+    logger.info('Source tree extracted to %s' % srctree)
+
+    if initial_rev:
+        return 0
+    else:
+        return 1
+
+def sync(args, config, basepath, workspace):
+    """Entry point for the devtool 'sync' subcommand"""
+    import bb
+
+    tinfoil = _prep_extract_operation(config, basepath, args.recipename)
+    if not tinfoil:
+        # Error already shown
+        return 1
+
+    rd = parse_recipe(config, tinfoil, args.recipename, True)
+    if not rd:
+        return 1
+
+    srctree = os.path.abspath(args.srctree)
+    initial_rev = _extract_source(srctree, args.keep_temp, args.branch, True, rd)
     logger.info('Source tree extracted to %s' % srctree)
 
     if initial_rev:
@@ -289,7 +311,7 @@ def _prep_extract_operation(config, basepath, recipename):
     return tinfoil
 
 
-def _extract_source(srctree, keep_temp, devbranch, d):
+def _extract_source(srctree, keep_temp, devbranch, sync, d):
     """Extract sources of a recipe"""
     import bb.event
     import oe.recipeutils
@@ -308,21 +330,26 @@ def _extract_source(srctree, keep_temp, devbranch, d):
 
     _check_compatible_recipe(pn, d)
 
-    if os.path.exists(srctree):
-        if not os.path.isdir(srctree):
-            raise DevtoolError("output path %s exists and is not a directory" %
-                               srctree)
-        elif os.listdir(srctree):
-            raise DevtoolError("output path %s already exists and is "
-                               "non-empty" % srctree)
+    if sync:
+        if not os.path.exists(srctree):
+                raise DevtoolError("output path %s does not exist" % srctree)
+    else:
+        if os.path.exists(srctree):
+            if not os.path.isdir(srctree):
+                raise DevtoolError("output path %s exists and is not a directory" %
+                                   srctree)
+            elif os.listdir(srctree):
+                raise DevtoolError("output path %s already exists and is "
+                                   "non-empty" % srctree)
 
-    if 'noexec' in (d.getVarFlags('do_unpack', False) or []):
-        raise DevtoolError("The %s recipe has do_unpack disabled, unable to "
-                           "extract source" % pn)
+        if 'noexec' in (d.getVarFlags('do_unpack', False) or []):
+            raise DevtoolError("The %s recipe has do_unpack disabled, unable to "
+                               "extract source" % pn)
 
-    # Prepare for shutil.move later on
-    bb.utils.mkdirhier(srctree)
-    os.rmdir(srctree)
+    if not sync:
+        # Prepare for shutil.move later on
+        bb.utils.mkdirhier(srctree)
+        os.rmdir(srctree)
 
     # We don't want notes to be printed, they are too verbose
     origlevel = bb.logger.getEffectiveLevel()
@@ -431,8 +458,11 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             logger.info('Adding local source files to srctree...')
             shutil.move(os.path.join(tempdir, 'oe-local-files'), srcsubdir)
 
+        if sync:
+            bb.process.run('git fetch file://' + srcsubdir + ' ' + devbranch + ':' + devbranch, cwd=srctree)
+        else:
+            shutil.move(srcsubdir, srctree)
 
-        shutil.move(srcsubdir, srctree)
     finally:
         bb.logger.setLevel(origlevel)
 
@@ -532,7 +562,7 @@ def modify(args, config, basepath, workspace):
     commits = []
     srctree = os.path.abspath(args.srctree)
     if args.extract:
-        initial_rev = _extract_source(args.srctree, False, args.branch, rd)
+        initial_rev = _extract_source(args.srctree, False, args.branch, False, rd)
         if not initial_rev:
             return 1
         logger.info('Source tree extracted to %s' % srctree)
@@ -1107,6 +1137,15 @@ def register_commands(subparsers, context):
     parser_extract.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_extract.set_defaults(func=extract)
 
+    parser_sync = subparsers.add_parser('sync', help='Synchronize the source for an existing recipe',
+                                       description='Synchronize the source for an existing recipe',
+                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+    parser_sync.add_argument('recipename', help='Name for recipe to sync the source for')
+    parser_sync.add_argument('srctree', help='Path to where to sync the source tree')
+    parser_sync.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout')
+    parser_sync.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
+    parser_sync.set_defaults(func=sync)
+
     parser_update_recipe = subparsers.add_parser('update-recipe', help='Apply changes from external source tree to recipe',
                                        description='Applies changes from external source tree to a recipe (updating/adding/removing patches as necessary, or by updating SRCREV)')
     parser_update_recipe.add_argument('recipename', help='Name of recipe to update')
-- 
2.6.2


