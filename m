Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 805BF719A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:45:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2017 12:45:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="817761519"
Received: from mmurr6x-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.252.199.82])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2017 12:45:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2017 09:45:43 +1300
Message-Id: <785518d6e6f7190350fb858867684d2f70d4671a.1486413875.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1486413875.git.paul.eggleton@linux.intel.com>
References: <cover.1486413875.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] devtool: improve parse failure handling
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
X-List-Received-Date: Mon, 06 Feb 2017 20:45:51 -0000

With the move to tinfoil2, the behaviour when parsing failed has changed
a bit - exceptions are now raised, so handle these appropriately.
Specifically when if parsing the recipe created when running devtool add
fails, rename it to .bb.parsefailed so that the user can run bitbake
afterwards without parsing being interrupted.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/create-pull-request     |  1 +
 scripts/lib/devtool/__init__.py |  7 ++++++-
 scripts/lib/devtool/standard.py | 11 ++++++++++-
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index e82858b..7c6b96d 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -183,6 +183,7 @@ if [ -n "$WEB_URL" ]; then
 		git push $REMOTE $L_BRANCH:$BRANCH
 		echo ""
 	fi
+	echo $WEB_URL
 	wget --no-check-certificate -q $WEB_URL -O /dev/null
 	if [ $? -ne 0 ]; then
 		echo "WARNING: Branch '$BRANCH' was not found on the contrib git tree."
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index fd2f042..91111e1 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -135,7 +135,12 @@ def parse_recipe(config, tinfoil, pn, appends, filter_workspace=True):
                             not path.startswith(config.workspace_path)]
     else:
         append_files = None
-    return tinfoil.parse_recipe_file(recipefile, appends, append_files)
+    try:
+        rd = tinfoil.parse_recipe_file(recipefile, appends, append_files)
+    except Exception as e:
+        logger.error(str(e))
+        return None
+    return rd
 
 def check_workspace_recipe(workspace, pn, checksrc=True, bbclassextend=False):
     """
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 30b247f..5bd498c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -224,8 +224,17 @@ def add(args, config, basepath, workspace):
 
     tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
     try:
-        rd = tinfoil.parse_recipe_file(recipefile, False)
+        try:
+            rd = tinfoil.parse_recipe_file(recipefile, False)
+        except Exception as e:
+            logger.error(str(e))
+            rd = None
         if not rd:
+            # Parsing failed. We just created this recipe and we shouldn't
+            # leave it in the workdir or it'll prevent bitbake from starting
+            movefn = '%s.parsefailed' % recipefile
+            logger.error('Parsing newly created recipe failed, moving recipe to %s for reference. If this looks to be caused by the recipe itself, please report this error.' % movefn)
+            shutil.move(recipefile, movefn)
             return 1
 
         if args.fetchuri and not args.no_git:
-- 
2.9.3


