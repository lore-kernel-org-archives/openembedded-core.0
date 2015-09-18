Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6476973D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 16:35:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 18 Sep 2015 09:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,553,1437462000"; d="scan'208";a="771978287"
Received: from yctb04.ostc.intel.com (HELO yctb04.otcr.jf.intel.com)
	([10.23.219.53])
	by orsmga001.jf.intel.com with ESMTP; 18 Sep 2015 09:35:12 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 08:34:05 +0000
Message-Id: <1442565245-16632-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <6871706.tbebiTIoD4@peggleto-mobl.ger.corp.intel.com>
References: <6871706.tbebiTIoD4@peggleto-mobl.ger.corp.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH V2] selftest/buildoptions: pexpect not a builtin module
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
X-List-Received-Date: Fri, 18 Sep 2015 16:35:26 -0000

put the import of pexpect around a try statement so it can tell you
why it failed to import when in a system that has the module unreachable

the message that outputs is:

"No module named pexpect, import failed"
"Please install pexpect (python-pexpect)"

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 483803b..1fa4802 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -3,7 +3,14 @@ import os
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
+    sys.stderr.write("Please install pexpect (python-pexpect)\n")
+    raise e
 
 from oeqa.selftest.base import oeSelfTest
 from oeqa.selftest.buildhistory import BuildhistoryBase
-- 
2.5.1


