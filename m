Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 40FC276D96
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 04:39:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 17 Sep 2015 21:39:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,550,1437462000"; d="scan'208";a="807119331"
Received: from yctb04.ostc.intel.com (HELO yctb04.otcr.jf.intel.com)
	([10.23.219.53])
	by orsmga002.jf.intel.com with ESMTP; 17 Sep 2015 21:39:21 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 20:38:31 +0000
Message-Id: <1442522311-15326-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.5.1
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] selftest/buildoptions: pexpect not a builtin module
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
X-List-Received-Date: Fri, 18 Sep 2015 04:39:23 -0000

put the import of pexpect around a try statement so it can tell you
why it failed to import when in a system that has the module unreachable

the message that outputs is:

"No module named pexpect, import failed"

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 483803b..9a3c9a1 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -3,7 +3,13 @@ import os
 import logging
 import re
 import glob as g
-import pexpect as p
+
+try:
+    import pexpect as p
+except  ImportError as e:
+    import sys
+    sys.stderr.write("{}, import failed\n".format(e))
+    raise e
 
 from oeqa.selftest.base import oeSelfTest
 from oeqa.selftest.buildhistory import BuildhistoryBase
-- 
2.5.1


