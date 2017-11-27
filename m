Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9E02178235
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 12:07:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2017 04:07:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,464,1505804400"; d="scan'208";a="12423569"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2017 04:07:18 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 14:07:00 +0200
Message-Id: <99bd139bade71e82652d3aa18fc44eecffbea1b2.1511784130.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
References: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
References: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v8 16/16] oeqa: add selftest for python pgo
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
X-List-Received-Date: Mon, 27 Nov 2017 12:07:24 -0000

Check that we're able to run python profile task on qemu and that python
builds when pgo is enabled.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/python.py | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/python.py

diff --git a/meta/lib/oeqa/selftest/cases/python.py b/meta/lib/oeqa/selftest/cases/python.py
new file mode 100644
index 0000000000..3a7edd1b88
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/python.py
@@ -0,0 +1,28 @@
+import os
+import shutil
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_vars, runCmd
+
+
+class PythonTests(OESelftestTestCase):
+
+    def test_python_pgo(self):
+        bbvars = get_bb_vars(['TMPDIR', 'MACHINE'])
+        profile_dir = os.path.join(bbvars['TMPDIR'], 'oeqa', bbvars['MACHINE'], 'python3-pgo-data')
+
+        self.write_config("""
+PYTHON3_PROFILE_OPT = "1"
+PYTHON3_PROFILE_TASK = "-m test.regrtest test_abc"
+PYTHON3_PROFILE_DIR = "{}"
+""".format(profile_dir))
+
+        profile_file = os.path.join(profile_dir, 'Objects', 'object.gcda')
+
+        bitbake('python-pgo-image -cprofile')
+
+        # Check that profile task generated a file
+        self.assertTrue(os.path.isfile(profile_file))
+
+        # Check that python builds with pgo enabled
+        bitbake('python3')
-- 
2.13.6


