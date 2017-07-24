Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D62027837E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 08:24:25 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 24 Jul 2017 01:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,406,1496127600"; d="scan'208";a="996343412"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga003.jf.intel.com with ESMTP; 24 Jul 2017 01:24:26 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jul 2017 16:25:03 +0800
Message-Id: <1500884703-154582-4-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500884703-154582-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1500884703-154582-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCHv3 3/3] recipetool: create: handle git URLs specifying only a tag
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
X-List-Received-Date: Mon, 24 Jul 2017 08:24:26 -0000

From: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>

If a git URL is passed to recipetool create with a tag=, recipetool
should handle it assuming that the tag is valid. Also, during the
creation of recipe, it seems that the automation for replacing
${PV} at the SRCURI for tag, (e.g mbed-tls-${PV}) is causing some
issue due to PV assuming it's a git source. A fix is implemented in
this patch as a workaround for this issue. This fix will be submitted
in a separate patch as a separate issue.

[YOCTO #11393]

Signed-off-by: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
---
 scripts/lib/recipetool/create.py | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 5f60fc3..25ccee1 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -425,6 +425,7 @@ def create_recipe(args):
     mirrors = args.mirrors
     branch_re = re.compile(';branch=([^;]+)')
     branch = ''
+    pv_srcpv = False
 
     if os.path.isfile(source):
         source = 'file://%s' % os.path.abspath(source)
@@ -464,6 +465,19 @@ def create_recipe(args):
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
@@ -520,6 +534,18 @@ def create_recipe(args):
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
@@ -642,9 +668,11 @@ def create_recipe(args):
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
@@ -652,6 +680,7 @@ def create_recipe(args):
         lines_before.append('')
         lines_before.append('# Modify these as desired')
         lines_before.append('PV = "%s+git${SRCPV}"' % (realpv or '1.0'))
+        pv_srcpv = True
         if not args.autorev and srcrev == '${AUTOREV}':
             if os.path.exists(os.path.join(srctree, '.git')):
                 (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
@@ -778,7 +807,7 @@ def create_recipe(args):
                 skipblank = True
                 continue
         elif line.startswith('SRC_URI = '):
-            if realpv:
+            if realpv and not pv_srcpv:
                 line = line.replace(realpv, '${PV}')
         elif line.startswith('PV = '):
             if realpv:
-- 
2.7.4


