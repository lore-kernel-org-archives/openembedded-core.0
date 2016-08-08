Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BD65F771DF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316039"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:20 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:23:08 -0700
Message-Id: <4a01440ac6492364d910f3c7d87ab00bb1dac5b5.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 20/20] oeqa.utils.readconfig: Read self-test configuration file
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:25 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.
This library reads a configuration file located at the
oeqa/selftest/conf directory with same name as the caller
file and the conf extension.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/utils/readconfig.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/readconfig.py

diff --git a/meta/lib/oeqa/utils/readconfig.py b/meta/lib/oeqa/utils/readconfig.py
new file mode 100644
index 0000000..1534ce7
--- /dev/null
+++ b/meta/lib/oeqa/utils/readconfig.py
@@ -0,0 +1,18 @@
+import os
+import re
+import configparser
+
+
+def conffile(codefile):
+    # Get test configurations from configuration file
+    f = re.compile(r'(pyc?$)')
+    fn = os.path.basename(codefile)
+    configfile = os.path.join(os.path.dirname(codefile), 'conf',
+                              f.sub('conf', fn))
+    config = configparser.SafeConfigParser()
+    read_result = config.read(configfile)
+    if read_result == []:
+        raise configparser.Error("Failed to get test configuration from \
+\"%s\". Verify that file exists and format is correct."
+                                 % configfile)
+    return config
-- 
1.8.3.1


