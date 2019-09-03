Return-Path: <henning.schild@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 6F31E7F322
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 13:43:52 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x83Dhqtv021718
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2019 15:43:52 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.169])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x83DhpL3008645;
	Tue, 3 Sep 2019 15:43:52 +0200
From: Henning Schild <henning.schild@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 15:43:46 +0200
Message-Id: <20190903134350.21512-3-henning.schild@siemens.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903134350.21512-1-henning.schild@siemens.com>
References: <20190903134350.21512-1-henning.schild@siemens.com>
MIME-Version: 1.0
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Henning Schild <henning.schild@siemens.com>
Subject: [PATCHv2 2/6] oeqa: add case for oe-git-proxy
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
X-List-Received-Date: Tue, 03 Sep 2019 13:43:53 -0000
Content-Transfer-Encoding: 8bit

From: Henning Schild <henning.schild@siemens.com>

The escaping, splitting and matching of NO_PROXY in oe-git-proxy
deserves its own testcase, add it.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 58 +++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 7770b66a26..c169885cf3 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -3,10 +3,12 @@
 #
 
 import os
+import shutil
 import unittest
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.selftest.cases.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
+from oeqa.utils import CommandError
 
 class BuildhistoryDiffTests(BuildhistoryBase):
 
@@ -63,3 +65,59 @@ class OEPybootchartguyTests(OEScriptTests):
         runCmd('%s/pybootchartgui/pybootchartgui.py  %s -o %s/charts -f pdf' % (self.scripts_dir, self.buildstats, self.tmpdir))
         self.assertTrue(os.path.exists(self.tmpdir + "/charts.pdf"))
 
+class OEGitproxyTests(OESelftestTestCase):
+
+    scripts_dir = os.path.join(get_bb_var('COREBASE'), 'scripts')
+
+    def test_oegitproxy_help(self):
+        try:
+            res = runCmd('%s/oe-git-proxy  --help' % self.scripts_dir, assert_error=False)
+            self.assertTrue(False)
+        except CommandError as e:
+            self.assertEqual(2, e.retcode)
+
+    def run_oegitproxy(self, custom_shell=None):
+        os.environ['SOCAT'] = shutil.which("echo")
+        os.environ['ALL_PROXY'] = "https://proxy.example.com:3128"
+        os.environ['NO_PROXY'] = "*.example.com,.no-proxy.org,192.168.42.0/24,127.*.*.*"
+
+        if custom_shell is None:
+            prefix = ''
+        else:
+            prefix = custom_shell + ' '
+
+        # outside, use the proxy
+        res = runCmd('%s%s/oe-git-proxy host.outside-example.com 9418' %
+                     (prefix,self.scripts_dir))
+        self.assertIn('PROXY:', res.output)
+        # match with wildcard suffix
+        res = runCmd('%s%s/oe-git-proxy host.example.com 9418' %
+                     (prefix, self.scripts_dir))
+        self.assertIn('TCP:', res.output)
+        # match just suffix
+        res = runCmd('%s%s/oe-git-proxy host.no-proxy.org 9418' %
+                     (prefix, self.scripts_dir))
+        self.assertIn('TCP:', res.output)
+        # match IP subnet
+        res = runCmd('%s%s/oe-git-proxy 192.168.42.42 9418' %
+                     (prefix, self.scripts_dir))
+        self.assertIn('TCP:', res.output)
+        # match IP wildcard
+        res = runCmd('%s%s/oe-git-proxy 127.1.2.3 9418' %
+                     (prefix, self.scripts_dir))
+        self.assertIn('TCP:', res.output)
+        
+        # test that * globbering is off
+        os.environ['NO_PROXY'] = "*"
+        res = runCmd('%s%s/oe-git-proxy host.example.com 9418' %
+                     (prefix, self.scripts_dir))
+        self.assertIn('TCP:', res.output)
+
+    def test_oegitproxy_proxy(self):
+        self.run_oegitproxy()
+
+    def test_oegitproxy_proxy_dash(self):
+        dash = shutil.which("dash")
+        if dash is None:
+            self.skipTest("No \"dash\" found on test system.")
+        self.run_oegitproxy(custom_shell=dash)
-- 
2.21.0


