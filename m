Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 04BA178291
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 10:31:20 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 03:31:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,383,1496127600"; d="scan'208";a="128964725"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga005.fm.intel.com with ESMTP; 20 Jul 2017 03:31:21 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jul 2017 18:31:59 +0800
Message-Id: <1500546720-145364-4-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500546720-145364-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1500546720-145364-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCHv2 3/4] recipetool: create: being able to set branch when revision is provided
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
X-List-Received-Date: Thu, 20 Jul 2017 10:31:21 -0000

When recipetool create is run on a git URL and a revision specified
that is not on master, and "branch=" isn't already in the URL, then
we should get the correct branch and append the branch to the URL.

If the revision was found on multiple branches, we will display error
to inform user to provide a correct branch and exit.

[YOCTO #11389]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/lib/recipetool/create.py | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 1015d02..cc755a1 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -423,6 +423,8 @@ def create_recipe(args):
     srcsubdir = ''
     srcrev = '${AUTOREV}'
     mirrors = args.mirrors
+    branch_re = re.compile(';branch=([^;]+)')
+    branch = ''
 
     if os.path.isfile(source):
         source = 'file://%s' % os.path.abspath(source)
@@ -440,6 +442,16 @@ def create_recipe(args):
         if res:
             srcrev = res.group(1)
             srcuri = rev_re.sub('', srcuri)
+        # Check whether branch info is provided
+        branch = branch_re.search(srcuri)
+        nobranch_re = re.compile(';nobranch=1')
+        nobranch = nobranch_re.search(srcuri)
+        if not branch and not nobranch and srcrev != '${AUTOREV}':
+            # Append nobranch=1 in the following conditions:
+            # 1. User did not set 'branch=' in srcuri, and
+            # 2. User did not set 'nobranch=1' in srcuri, and
+            # 3. Source revision is not '${AUTOREV}'
+            fetchuri = fetchuri + ';nobranch=1'
         tempsrc = tempfile.mkdtemp(prefix='recipetool-')
         srctree = tempsrc
         d = bb.data.createCopy(tinfoil.config_data)
@@ -474,6 +486,26 @@ def create_recipe(args):
                     if '<html' in f.read(100).lower():
                         logger.error('Fetching "%s" returned a single HTML page - check the URL is correct and functional' % fetchuri)
                         sys.exit(1)
+        # Check for branch info with SRCREV provided
+        if not branch and not nobranch and srcrev and (srcrev != '${AUTOREV}'):
+            cmd = 'git branch -r --contains'
+            try:
+                # Command to check branch using commit hash
+                check_branch, check_branch_err = bb.process.run('%s %s' % (cmd, srcrev), cwd=srctree)
+            except bb.process.ExecutionError as err:
+                logger.error(str(err))
+                sys.exit(1)
+            get_branch = [x.strip() for x in check_branch.splitlines()]
+            # Remove HEAD reference point and drop remote prefix
+            get_branch = [x.split('/', 1)[1] for x in get_branch if not x.startswith('origin/HEAD')]
+            if len(get_branch) == 1:
+                # If get_branch contains only ONE object, then store result into 'branch'
+                branch = get_branch[0]
+            else:
+                # If get_branch contains more than one objects, then display error and exit.
+                mbrch = '\n  ' + '\n  '.join(get_branch)
+                logger.error('Revision %s was found on multiple branches: %s\nPlease provide the correct branch in the source URL with ;branch=<branch> (and ensure you use quotes around the URL to avoid the shell interpreting the ";")' % (srcrev, mbrch))
+                sys.exit(1)
         if os.path.exists(os.path.join(srctree, '.gitmodules')) and srcuri.startswith('git://'):
             srcuri = 'gitsm://' + srcuri[6:]
             logger.info('Fetching submodules...')
@@ -603,6 +635,11 @@ def create_recipe(args):
 
     if not srcuri:
         lines_before.append('# No information for SRC_URI yet (only an external source tree was specified)')
+    # Check if users has provide a branch
+    append_branch = branch_re.search(srcuri)
+    if branch and not append_branch:
+        # Append the correct branch into SRC_URI
+        srcuri += (';branch=%s' % str(branch))
     lines_before.append('SRC_URI = "%s"' % srcuri)
     (md5value, sha256value) = checksums
     if md5value:
-- 
2.7.4


