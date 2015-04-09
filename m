Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1FB46606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 12:54:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Apr 2015 05:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,549,1422950400"; d="scan'208";a="478873949"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Apr 2015 05:54:44 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 40EC0340001;
	Thu,  9 Apr 2015 05:54:21 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 15:54:35 +0300
Message-Id: <1428584075-9823-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: Use __file__ instead of sys.argv[0]
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
X-List-Received-Date: Thu, 09 Apr 2015 12:54:44 -0000

Using __file__ makes the code work independently of the way
it's loaded. In some cases wic can be imported by another
program without executing it. sys.argv[0] would not contain
path to the wic in such a cases.

This is an enabler for unit testing with nose framework.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/wic b/scripts/wic
index dcf1a55..fd4a678 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -38,7 +38,7 @@ import optparse
 import logging
 
 # External modules
-scripts_path = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])))
+scripts_path = os.path.abspath(os.path.dirname(__file__))
 lib_path = scripts_path + '/lib'
 bitbake_path = os.path.join(scripts_path, '../bitbake/lib')
 sys.path = sys.path + [lib_path, bitbake_path]
-- 
2.1.4


