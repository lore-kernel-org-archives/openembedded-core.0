Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 48B8378279
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 05:40:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 20 Aug 2017 22:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,407,1498546800"; d="scan'208";a="1208228243"
Received: from ssen-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.129.109])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2017 22:40:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 17:39:42 +1200
Message-Id: <b92ec20b20072b75f6b68071b94236fc8f576b78.1503293342.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1503293342.git.paul.eggleton@linux.intel.com>
References: <cover.1503293342.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/10] recipetool: create: handle git URLs specifying only a tag
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
X-List-Received-Date: Mon, 21 Aug 2017 05:40:45 -0000

From: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>

If a git URL is passed to recipetool create with a tag=, recipetool
should handle it assuming that the tag is valid.

[YOCTO #11393]

Signed-off-by: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 8d59e65..e48e418 100644
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
+            cmd = ('git rev-parse --verify %s' % (storeTagName))
+            try:
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
2.9.5


