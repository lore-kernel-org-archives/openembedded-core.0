Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7296612D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 04:49:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 08 Mar 2016 20:49:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,310,1455004800"; d="scan'208";a="929876815"
Received: from mlim-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.143.14])
	by orsmga002.jf.intel.com with ESMTP; 08 Mar 2016 20:49:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:48:54 +1300
Message-Id: <7a5993c4416f7e28eed9a9d5ddbe3b5ee4b1afc7.1457498464.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457498464.git.paul.eggleton@linux.intel.com>
References: <cover.1457498464.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457498464.git.paul.eggleton@linux.intel.com>
References: <cover.1457498464.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 7/8] recipetool: create: support creation of additional files by plugins
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
X-List-Received-Date: Wed, 09 Mar 2016 04:49:52 -0000

Allow plugins to create additional files to go alongside the recipe. The
plugins don't know what the output filename is going to be, so they need
to put the files in a temporary location and add them to an "extrafiles"
dict within extravalues where the destination filename is the key and
the temporary path is the value.

devtool add was also extended to ensure these files get moved in and
preserved upon reset if they've been edited by the user.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py  |  6 +++++-
 scripts/lib/recipetool/create.py | 11 +++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 5f83a91..b344001 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -189,6 +189,9 @@ def add(args, config, basepath, workspace):
                     raise DevtoolError('Couldn\'t find source tree created by recipetool')
             bb.utils.mkdirhier(recipedir)
             shutil.move(recipes[0], recipefile)
+            # Move any additional files created by recipetool
+            for fn in os.listdir(tempdir):
+                shutil.move(os.path.join(tempdir, fn), recipedir)
         else:
             raise DevtoolError('Command \'%s\' did not create any recipe file:\n%s' % (e.command, e.stdout))
         attic_recipe = os.path.join(config.workspace_path, 'attic', recipename, os.path.basename(recipefile))
@@ -199,7 +202,8 @@ def add(args, config, basepath, workspace):
             shutil.rmtree(tmpsrcdir)
         shutil.rmtree(tempdir)
 
-    _add_md5(config, recipename, recipefile)
+    for fn in os.listdir(recipedir):
+        _add_md5(config, recipename, os.path.join(recipedir, fn))
 
     if args.fetch and not args.no_git:
         setup_git_repo(srctree, args.version, 'devtool')
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 1d48e36..1649e40 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -560,6 +560,8 @@ def create_recipe(args):
     for handler in handlers:
         handler.process(srctree_use, classes, lines_before, lines_after, handled, extravalues)
 
+    extrafiles = extravalues.pop('extrafiles', {})
+
     if not realpv:
         realpv = extravalues.get('PV', None)
         if realpv:
@@ -601,6 +603,15 @@ def create_recipe(args):
                 logger.error('Output file %s already exists' % outfile)
                 sys.exit(1)
 
+    # Move any extra files the plugins created to a directory next to the recipe
+    if outfile == '-':
+        extraoutdir = pn
+    else:
+        extraoutdir = os.path.join(os.path.dirname(outfile), pn)
+    bb.utils.mkdirhier(extraoutdir)
+    for destfn, extrafile in extrafiles.iteritems():
+        shutil.move(extrafile, os.path.join(extraoutdir, destfn))
+
     lines = lines_before
     lines_before = []
     skipblank = True
-- 
2.5.0


