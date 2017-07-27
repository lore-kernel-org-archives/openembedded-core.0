Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0E10D780A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 08:40:10 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jul 2017 01:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,419,1496127600"; d="scan'208";a="112512166"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga004.jf.intel.com with ESMTP; 27 Jul 2017 01:40:10 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Jul 2017 16:40:55 +0800
Message-Id: <1501144856-17637-4-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501144856-17637-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1501144856-17637-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCHv4 3/4] recipetool: create: handle git URLs specifying only a tag
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
X-List-Received-Date: Thu, 27 Jul 2017 08:40:10 -0000

From: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>

If a git URL is passed to recipetool create with a tag=, recipetool
should handle it assuming that the tag is valid.

[YOCTO #11393]

Signed-off-by: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
---
 scripts/lib/recipetool/create.py | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 4016a54..f0bea66 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -455,6 +455,19 @@ def create_recipe(args):
             # 3. Source revision is not '${AUTOREV}'
             srcuri = srcuri + ';nobranch=1'
 
+        # Create an empty storeTagName to ensure the checkers do not point to a null variable
+        storeTagName = ''
+        tag_re = re.compile(';tag=([^;]+)')
+        tag = tag_re.search(srcuri)
+        if tag:
+            scheme, host, path, user, pswd, parms = bb.fetch2.decodeurl(srcuri)
+            # Keep a copy of tag and append nobranch=1 then remove tag from URL,
+            # Will re-introduce tag argument after bitbake fetcher process is complete.
+            storeTagName = parms['tag']
+            parms.update({('nobranch', '1')})
+            del parms['tag']
+            srcuri = bb.fetch2.encodeurl((scheme, host, path, user, pswd, parms))
+
         tmpparent = tinfoil.config_data.getVar('BASE_WORKDIR')
         bb.utils.mkdirhier(tmpparent)
         tempsrc = tempfile.mkdtemp(prefix='recipetool-', dir=tmpparent)
@@ -511,6 +524,18 @@ def create_recipe(args):
                 logger.error('Revision %s was found on multiple branches: %s\nPlease provide the correct branch in the source URL with ;branch=<branch> (and ensure you use quotes around the URL to avoid the shell interpreting the ";")' % (srcrev, mbrch))
                 sys.exit(1)
 
+        if storeTagName:
+            # Re-introduced tag variable from storeTagName
+            # Check srcrev using tag and check validity of the tag
+            try:
+                cmd = ('git rev-list -n 1 %s' % (storeTagName))
+                check_tag, check_tag_err = bb.process.run('%s' % cmd, cwd=srctree)
+                srcrev = check_tag.split()[0]
+            except bb.process.ExecutionError as err:
+                logger.error(str(err))
+                logger.error("Possibly wrong tag name is provided")
+                sys.exit(1)
+
         if os.path.exists(os.path.join(srctree, '.gitmodules')) and srcuri.startswith('git://'):
             srcuri = 'gitsm://' + srcuri[6:]
             logger.info('Fetching submodules...')
@@ -633,9 +658,11 @@ def create_recipe(args):
         lines_before.append('# No information for SRC_URI yet (only an external source tree was specified)')
     # Check if users has provide a branch
     append_branch = branch_re.search(srcuri)
-    if branch and not append_branch:
-        # Append the correct branch into SRC_URI
-        srcuri = srcuri_copy + (';branch=%s' % str(branch))
+    if (branch and not append_branch) or storeTagName:
+        srcuri = srcuri_copy
+        if branch:
+            # Append the correct branch into SRC_URI
+            srcuri = srcuri + (';branch=%s' % str(branch))
     lines_before.append('SRC_URI = "%s"' % srcuri)
     for key, value in sorted(checksums.items()):
         lines_before.append('SRC_URI[%s] = "%s"' % (key, value))
-- 
2.7.4


