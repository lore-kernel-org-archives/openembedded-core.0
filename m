Return-Path: <stanley.cheong.kwan.phoong@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2FFD578275
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 03:26:43 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 20:26:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,382,1496127600"; d="scan'208";a="109914883"
Received: from phoongst-mobl2.png.intel.com ([10.221.23.181])
	by orsmga004.jf.intel.com with ESMTP; 19 Jul 2017 20:26:43 -0700
From: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jul 2017 11:26:37 +0800
Message-Id: <1500521197-6119-2-git-send-email-stanley.cheong.kwan.phoong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500521197-6119-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
References: <1500521197-6119-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
Subject: [PATCH] recipetool: create: handle git URLs specifying only a tag
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
X-List-Received-Date: Thu, 20 Jul 2017 03:26:43 -0000

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
 scripts/lib/recipetool/create.py | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index a45b90d..0619428 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -434,6 +434,18 @@ def create_recipe(args):
             # 2. User did not set 'nobranch=1' in srcuri, and
             # 3. Source revision is not '${AUTOREV}'
             fetchuri = fetchuri + ';nobranch=1'
+        # Create an empty storeTagName to ensure the checkers do not point to a null variable
+        storeTagName = ''
+        tag_re = re.compile(';tag=([^;]+)')
+        tag = tag_re.search(fetchuri)
+        if tag:
+            scheme, host, path, user, pswd, parms = bb.fetch2.decodeurl(fetchuri)
+            # Keep a copy of tag and append nobranch=1 then remove tag from URL,
+            # Will re-introduce tag argument after bitbake fetcher process is complete.
+            storeTagName = parms['tag']
+            parms.update({('nobranch', '1')})
+            del parms['tag']
+            fetchuri = bb.fetch2.encodeurl((scheme, host, path, user, pswd, parms))
         tempsrc = tempfile.mkdtemp(prefix='recipetool-')
         srctree = tempsrc
         d = bb.data.createCopy(tinfoil.config_data)
@@ -488,6 +500,17 @@ def create_recipe(args):
                 mbrch = '\n  ' + '\n  '.join(get_branch)
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
         if os.path.exists(os.path.join(srctree, '.gitmodules')) and srcuri.startswith('git://'):
             srcuri = 'gitsm://' + srcuri[6:]
             logger.info('Fetching submodules...')
@@ -628,10 +651,12 @@ def create_recipe(args):
         lines_before.append('SRC_URI[md5sum] = "%s"' % md5value)
     if sha256value:
         lines_before.append('SRC_URI[sha256sum] = "%s"' % sha256value)
+    pv_srcpv = False
     if srcuri and supports_srcrev(srcuri):
         lines_before.append('')
         lines_before.append('# Modify these as desired')
         lines_before.append('PV = "%s+git${SRCPV}"' % (realpv or '1.0'))
+        pv_srcpv = True
         if not args.autorev and srcrev == '${AUTOREV}':
             if os.path.exists(os.path.join(srctree, '.git')):
                 (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
@@ -758,7 +783,7 @@ def create_recipe(args):
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


