Return-Path: <roylee17@currantlabs.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id F126473D46
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 10:30:43 +0000 (UTC)
Received: by pasz6 with SMTP id z6so201274983pas.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 02:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=currantlabs_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XYT8dXt5NshcC0PtlWxin3aND53XS4+yk7WSJWZpXsY=;
	b=vp04kQE/4eVMbOTar2g8daEp6Qm90w2a+fxWZdgY0U4pKNOnUacEfnzWNAxlXbRrCv
	MaLqZ01lO5YwfpVZkL7cXUKCqocD3nF59y8BMuW2kaFkSu23de0TZeGCFsccay8mGfTo
	bAdgNiJ/F7XsydSLx6NXONGqMohokXcuobKxQkqoLHd225cPK88UgARzlIpGcAo+xaFn
	u4VlXKn9fcoYYE5ggDQzCsf+R3jR9g59R7d+B3hrxScLRG5kUbeubQQIpQf7kPsL613k
	ESduDQ+2Ik8rU54h4nCqh79yvw2OfyOUttZxo4+EiWBMTklngKRaBqSymJVietsYH0i7
	LwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XYT8dXt5NshcC0PtlWxin3aND53XS4+yk7WSJWZpXsY=;
	b=DeXkwNy0siXdKf2lPSbDq+CWaUdUNG9iYJzMttQsrD/5eeAcfmqn0rbbULz6wh2v+H
	a9Ji4DSVWEpwJ3n9qXbLwvguCQGhWv5Hhu7GnLjtRDop1eKlCZcE84GtqAztXo59tr/X
	/mcFLKvz65YfUZ2qdwANwZFduG2GSpRVIqSlipsmIWCh9scNpRL4vIcND0jS6gHnJsZl
	OBIp163HgL+/Zp2VhJG2oZzu7S6RPwIuYtkgWqRCPlzFwMgI2FXO/Fc9vmtnzSxXcguR
	d0SltH42jsE/MxO9SN+OKHgj14Y2v23rkDH68haU5VTOdK2/6X78MgKyUrxCtTG1I2DQ
	SCNg==
X-Gm-Message-State: ALoCoQkTFIioU1tUclyqUhbsbJ4vtG9EjVoHlOsxpKLMv1NF8bnx2S7i+3sDnyrlZf+IcSBAq9gu
X-Received: by 10.68.228.228 with SMTP id sl4mr38872650pbc.51.1447065043033;
	Mon, 09 Nov 2015 02:30:43 -0800 (PST)
Received: from Tzu-Jungs-iMac.local.net (c-67-169-68-81.hsd1.ca.comcast.net.
	[67.169.68.81]) by smtp.gmail.com with ESMTPSA id
	kj3sm15506461pbc.59.2015.11.09.02.30.41
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Nov 2015 02:30:41 -0800 (PST)
From: Tzu-Jung Lee <roylee17@currantlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 02:30:32 -0800
Message-Id: <1447065032-27427-1-git-send-email-roylee17@currantlabs.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <2702139.DZhhJoAPGz@peggleto-mobl.ger.corp.intel.com>
References: <2702139.DZhhJoAPGz@peggleto-mobl.ger.corp.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v3] devtool: add sync command
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
X-List-Received-Date: Mon, 09 Nov 2015 10:30:44 -0000

The sync command is similar to the extract command, except it
fetches the sync'ed and patched branch to an existing git repository.

This enables users to keep track the upstream development while
maintaining their own local git repository at the same time.

Signed-off-by: Tzu-Jung Lee <roylee17@currantlabs.com>

---
Thanks for the reminder :-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c5c647b..8efd262 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -238,7 +238,29 @@ def extract(args, config, basepath, workspace):
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
@@ -293,7 +315,7 @@ def _prep_extract_operation(config, basepath, recipename):
     return tinfoil
 
 
-def _extract_source(srctree, keep_temp, devbranch, d):
+def _extract_source(srctree, keep_temp, devbranch, sync, d):
     """Extract sources of a recipe"""
     import bb.event
     import oe.recipeutils
@@ -312,21 +334,26 @@ def _extract_source(srctree, keep_temp, devbranch, d):
 
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
@@ -430,13 +457,35 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             if haspatches:
                 bb.process.run('git checkout patches', cwd=srcsubdir)
 
-        # Move oe-local-files directory to srctree
-        if os.path.exists(os.path.join(tempdir, 'oe-local-files')):
-            logger.info('Adding local source files to srctree...')
-            shutil.move(os.path.join(tempdir, 'oe-local-files'), srcsubdir)
+        tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
+        srctree_localdir = os.path.join(srctree, 'oe-local-files')
 
+        if sync:
+            bb.process.run('git fetch file://' + srcsubdir + ' ' + devbranch + ':' + devbranch, cwd=srctree)
+
+            # Move oe-local-files directory to srctree
+            # As the oe-local-files is not part of the constructed git tree,
+            # remove them directly during the synchrounizating might surprise
+            # the users.  Instead, we move it to oe-local-files.bak and remind
+            # user in the log message.
+            if os.path.exists(srctree_localdir + '.bak'):
+                shutil.rmtree(srctree_localdir, srctree_localdir + '.bak')
+
+            if os.path.exists(srctree_localdir):
+                logger.info('Backing up current local file directory %s' % srctree_localdir)
+                shutil.move(srctree_localdir, srctree_localdir + '.bak')
+
+            if os.path.exists(tempdir_localdir):
+                logger.info('Syncing local source files to srctree...')
+                shutil.copytree(tempdir_localdir, srctree_localdir)
+        else:
+            # Move oe-local-files directory to srctree
+            if os.path.exists(tempdir_localdir):
+                logger.info('Adding local source files to srctree...')
+                shutil.move(tempdir_localdir, srcsubdir)
+
+            shutil.move(srcsubdir, srctree)
 
-        shutil.move(srcsubdir, srctree)
     finally:
         bb.logger.setLevel(origlevel)
 
@@ -544,7 +593,7 @@ def modify(args, config, basepath, workspace):
     commits = []
     srctree = os.path.abspath(args.srctree)
     if args.extract:
-        initial_rev = _extract_source(args.srctree, False, args.branch, rd)
+        initial_rev = _extract_source(args.srctree, False, args.branch, False, rd)
         if not initial_rev:
             return 1
         logger.info('Source tree extracted to %s' % srctree)
@@ -1119,6 +1168,15 @@ def register_commands(subparsers, context):
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
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index d387623..5410c9d 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -312,7 +312,7 @@ def upgrade(args, config, basepath, workspace):
 
     rf = None
     try:
-        rev1 = standard._extract_source(args.srctree, False, 'devtool-orig', rd)
+        rev1 = standard._extract_source(args.srctree, False, 'devtool-orig', False, rd)
         rev2, md5, sha256 = _extract_new_source(args.version, args.srctree, args.no_patch,
                                                 args.srcrev, args.branch, args.keep_temp,
                                                 tinfoil, rd)
-- 
2.6.3


