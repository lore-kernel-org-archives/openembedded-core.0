Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 73B5B6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 01:59:24 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 17:59:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,397,1505804400"; 
   d="scan'208";a="1962882"
Received: from rebeccas.png.intel.com ([172.30.199.129])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2017 17:59:20 -0800
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Nov 2017 10:01:13 +0800
Message-Id: <1510711273-102914-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] recipetool: create: fix conflict between SRCREV and tag
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
X-List-Received-Date: Wed, 15 Nov 2017 01:59:24 -0000

If you specify 'tag=' for a git URL and passed to recipetool create, you
will get into Bitbake expansion error shown below:

----- snip -----
$ devtool add --version 2.4.2 mbedtls "git://github.com/ARMmbed/mbedtls;tag=mbedtls-2.4.2"
...
bb.data_smart.ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fetcher failure: Conflicting revisions (abeccb9dbd7e19ae91ac50e1edd3803111c5f9b6 from SRCREV and mbedtls-2.4.2 from the url) found, please specify one valid value
----- snip -----

Assuming the tag is valid, we should get the tag commit hash and
drop the usage of 'tag=' from SRC_URI. By using a commit hash
corresponding to the tag will prevent bitbake from accessing
remote repository in order to expand SRCPV.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/lib/recipetool/create.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 54e7e85..2fc9e0a 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -480,7 +480,6 @@ def create_recipe(args):
         if tag:
             # Keep a copy of tag and append nobranch=1 then remove tag from URL.
             # Bitbake fetcher unable to fetch when {AUTOREV} and tag is set at the same time.
-            # We will re-introduce tag argument after bitbake fetcher process is complete.
             storeTagName = params['tag']
             params['nobranch'] = '1'
             del params['tag']
@@ -552,13 +551,11 @@ def create_recipe(args):
 
         # Since we might have a value in srcbranch, we need to
         # recontruct the srcuri to include 'branch' in params.
+        scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(srcuri)
         if srcbranch:
-            scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(srcuri)
             params['branch'] = srcbranch
-            srcuri = bb.fetch2.encodeurl((scheme, network, path, user, passwd, params))
 
         if storeTagName and scheme in ['git', 'gitsm']:
-            # Re-introduced tag variable from storeTagName
             # Check srcrev using tag and check validity of the tag
             cmd = ('git rev-parse --verify %s' % (storeTagName))
             try:
@@ -568,6 +565,9 @@ def create_recipe(args):
                 logger.error(str(err))
                 logger.error("Possibly wrong tag name is provided")
                 sys.exit(1)
+            # Drop tag from srcuri as it will have conflicts with SRCREV during recipe parse.
+            del params['tag']
+        srcuri = bb.fetch2.encodeurl((scheme, network, path, user, passwd, params))
 
         if os.path.exists(os.path.join(srctree, '.gitmodules')) and srcuri.startswith('git://'):
             srcuri = 'gitsm://' + srcuri[6:]
-- 
2.7.4


