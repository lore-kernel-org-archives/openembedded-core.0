Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D69A86023B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 07:38:55 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Sep 2013 00:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,921,1371106800"; d="scan'208";a="295770964"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Sep 2013 00:38:37 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id ACFBD6A4007;
	Tue, 17 Sep 2013 00:38:34 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2013 10:38:50 +0300
Message-Id: <1379403530-8095-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] classes/utils: which is in bb.utils not in bb
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
X-List-Received-Date: Tue, 17 Sep 2013 07:38:57 -0000

This works now because of bitbake's deprecated_imports, but those
might be removed so let's change it.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/utils.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index e873c53..f9a451a 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -293,11 +293,12 @@ END
 }
 
 def check_app_exists(app, d):
-    from bb import which, data
+    import bb.utils
+    import bb.data
 
-    app = data.expand(app, d)
-    path = data.getVar('PATH', d, 1)
-    return bool(which(path, app))
+    app = bb.data.expand(app, d)
+    path = bb.data.getVar('PATH', d, 1)
+    return bool(bb.utils.which(path, app))
 
 def explode_deps(s):
     return bb.utils.explode_deps(s)
-- 
1.8.3.1


