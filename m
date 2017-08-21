Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A70E973068
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 05:40:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 20 Aug 2017 22:40:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,407,1498546800"; d="scan'208";a="1208228218"
Received: from ssen-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.129.109])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2017 22:40:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 17:39:41 +1200
Message-Id: <17afb8a6b67fbb3b693299c46800c780ca4807ea.1503293342.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1503293342.git.paul.eggleton@linux.intel.com>
References: <cover.1503293342.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/10] recipetool: create: being able to set branch when revision is provided
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
X-List-Received-Date: Mon, 21 Aug 2017 05:40:40 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

This change is to improve the buildability of the recipe created by
recipetool and devtool.

When recipetool create is run on a git URL and a revision specified
that is not on master, and "branch=" isn't already in the URL, then
we should get the correct branch and append the branch to the URL.

If the revision was found on multiple branches and 'master' is not
in the list, we will display error to inform user to provide a
correct branch and exit.

[YOCTO #11389]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 48 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 2c3a58a..8d59e65 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -422,6 +422,7 @@ def create_recipe(args):
     source = args.source
     srcsubdir = ''
     srcrev = '${AUTOREV}'
+    srcbranch = ''
 
     if os.path.isfile(source):
         source = 'file://%s' % os.path.abspath(source)
@@ -440,6 +441,19 @@ def create_recipe(args):
             srcrev = res.group(1)
             srcuri = rev_re.sub('', srcuri)
 
+        # Check whether users provides any branch info in fetchuri.
+        # If true, we will skip all branch checking process to honor all user's input.
+        scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(fetchuri)
+        srcbranch = params.get('branch')
+        nobranch = params.get('nobranch')
+        if not srcbranch and not nobranch and srcrev != '${AUTOREV}':
+            # Append nobranch=1 in the following conditions:
+            # 1. User did not set 'branch=' in srcuri, and
+            # 2. User did not set 'nobranch=1' in srcuri, and
+            # 3. Source revision is not '${AUTOREV}'
+            params['nobranch'] = '1'
+            fetchuri = bb.fetch2.encodeurl((scheme, network, path, user, passwd, params))
+
         tmpparent = tinfoil.config_data.getVar('BASE_WORKDIR')
         bb.utils.mkdirhier(tmpparent)
         tempsrc = tempfile.mkdtemp(prefix='recipetool-', dir=tmpparent)
@@ -475,6 +489,40 @@ def create_recipe(args):
             logger.error('URL %s resulted in an empty source tree' % fetchuri)
             sys.exit(1)
 
+        # We need this checking mechanism to improve the recipe created by recipetool and devtool
+        # is able to parse and build by bitbake.
+        # If there is no input for branch name, then check for branch name with SRCREV provided.
+        if not srcbranch and not nobranch and srcrev and (srcrev != '${AUTOREV}'):
+            try:
+                cmd = 'git branch -r --contains'
+                check_branch, check_branch_err = bb.process.run('%s %s' % (cmd, srcrev), cwd=srctree)
+            except bb.process.ExecutionError as err:
+                logger.error(str(err))
+                sys.exit(1)
+            get_branch = [x.strip() for x in check_branch.splitlines()]
+            # Remove HEAD reference point and drop remote prefix
+            get_branch = [x.split('/', 1)[1] for x in get_branch if not x.startswith('origin/HEAD')]
+            if 'master' in get_branch:
+                # If it is master, we do not need to append 'branch=master' as this is default.
+                # Even with the case where get_branch has multiple objects, if 'master' is one
+                # of them, we should default take from 'master'
+                srcbranch = ''
+            elif len(get_branch) == 1:
+                # If 'master' isn't in get_branch and get_branch contains only ONE object, then store result into 'srcbranch'
+                srcbranch = get_branch[0]
+            else:
+                # If get_branch contains more than one objects, then display error and exit.
+                mbrch = '\n  ' + '\n  '.join(get_branch)
+                logger.error('Revision %s was found on multiple branches: %s\nPlease provide the correct branch in the source URL with ;branch=<branch> (and ensure you use quotes around the URL to avoid the shell interpreting the ";")' % (srcrev, mbrch))
+                sys.exit(1)
+
+        # Since we might have a value in srcbranch, we need to
+        # recontruct the srcuri to include 'branch' in params.
+        if srcbranch:
+            scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(srcuri)
+            params['branch'] = srcbranch
+            srcuri = bb.fetch2.encodeurl((scheme, network, path, user, passwd, params))
+
         if os.path.exists(os.path.join(srctree, '.gitmodules')) and srcuri.startswith('git://'):
             srcuri = 'gitsm://' + srcuri[6:]
             logger.info('Fetching submodules...')
-- 
2.9.5


