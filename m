Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 841006A9C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 15:05:38 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Jul 2013 08:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,728,1367996400"; d="scan'208";a="335573330"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2013 08:05:20 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jul 2013 18:07:48 +0300
Message-Id: <603cb9d8408f91f364c6a8f3e8625ead75a2128b.1374591776.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1374591776.git.ionutx.radu@intel.com>
References: <cover.1374591776.git.ionutx.radu@intel.com>
Subject: [PATCH 1/1] useradd.bbclass: fix traceback when inheriting useradd but not setting USERADD_PARAM or GROUPADD_PARAM
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
X-List-Received-Date: Tue, 23 Jul 2013 15:05:38 -0000

Replaced bb.build.FuncFailed with bb.fatal

[YOCTO #4486]

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 meta/classes/useradd.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 3fe011d..a68b6fd 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -219,7 +219,7 @@ def update_useradd_after_parse(d):
 
     for pkg in useradd_packages.split():
         if not d.getVar('USERADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPMEMS_PARAM_%s' % pkg, True):
-            raise bb.build.FuncFailed("%s inherits useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar('FILE'), pkg))
+            bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar('FILE'), pkg))
 
 python __anonymous() {
     update_useradd_after_parse(d)
-- 
1.7.10.4


