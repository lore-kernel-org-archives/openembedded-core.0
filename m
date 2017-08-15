Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA13784D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 08:24:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2017 01:24:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="1162711505"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga001.jf.intel.com with ESMTP; 15 Aug 2017 01:24:10 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Aug 2017 16:24:23 +0800
Message-Id: <1502785464-89944-3-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502785464-89944-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1502785464-89944-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 2/3] recipetool: create: handle git URLs specifying only a tag
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
X-List-Received-Date: Tue, 15 Aug 2017 08:24:09 -0000

From: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>

If a git URL is passed to recipetool create with a tag=, recipetool
should handle it assuming that the tag is valid.

[YOCTO #11393]

Signed-off-by: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
---
 scripts/lib/recipetool/create.py | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index d2e6fc0..52c10e5 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -423,6 +423,7 @@ def create_recipe(args):
     srcsubdir = ''
     srcrev = '${AUTOREV}'
     srcbranch = ''
+    storeTagName = ''
 
     if os.path.isfile(source):
         source = 'file://%s' % os.path.abspath(source)
@@ -446,13 +447,21 @@ def create_recipe(args):
         scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(fetchuri)
         srcbranch = params.get('branch')
         nobranch = params.get('nobranch')
+        tag = params.get('tag')
         if not srcbranch and not nobranch and srcrev != '${AUTOREV}':
             # Append nobranch=1 in the following conditions:
             # 1. User did not set 'branch=' in srcuri, and
             # 2. User did not set 'nobranch=1' in srcuri, and
             # 3. Source revision is not '${AUTOREV}'
             params['nobranch'] = '1'
-            fetchuri = bb.fetch2.encodeurl((scheme, network, path, user, passwd, params))
+        if tag:
+            # Keep a copy of tag and append nobranch=1 then remove tag from URL.
+            # Bitbake fetcher unable to fetch when {AUTOREV} and tag is set at the same time.
+            # We will re-introduce tag argument after bitbake fetcher process is complete.
+            storeTagName = params['tag']
+            params['nobranch'] = '1'
+            del params['tag']
+        fetchuri = bb.fetch2.encodeurl((scheme, network, path, user, passwd, params))
 
         tmpparent = tinfoil.config_data.getVar('BASE_WORKDIR')
         bb.utils.mkdirhier(tmpparent)
@@ -523,6 +532,18 @@ def create_recipe(args):
             params['branch'] = srcbranch
             srcuri = bb.fetch2.encodeurl((scheme, network, path, user, passwd, params))
 
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
-- 
2.7.4


