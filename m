Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4B15E7197B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 17:38:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 May 2017 10:38:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,280,1491289200"; d="scan'208";a="1163666544"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2017 10:38:01 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 May 2017 10:37:35 -0700
Message-Id: <20170502173735.11700-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] scripts/oe-selftest: avoid deprecated imp.reload function
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
X-List-Received-Date: Tue, 02 May 2017 17:38:01 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

As explained in [1], the module function imp.reload has been deprecated for
importlib.reload, so use the latter instead.

[1] https://docs.python.org/3/library/imp.html#imp.reload

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/oe-selftest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 52366b1c8de..bbc161e649b 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -35,7 +35,7 @@ import time as t
 import re
 import fnmatch
 import collections
-import imp
+import importlib
 
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
 import scriptpath
@@ -497,7 +497,7 @@ def main():
     bbpath = get_bb_var('BBPATH').split(':')
     layer_libdirs = [p for p in (os.path.join(l, 'lib') for l in bbpath) if os.path.exists(p)]
     sys.path.extend(layer_libdirs)
-    imp.reload(oeqa.selftest)
+    importlib.reload(oeqa.selftest)
 
     # act like bitbake and enforce en_US.UTF-8 locale
     os.environ["LC_ALL"] = "en_US.UTF-8"
-- 
2.12.0


