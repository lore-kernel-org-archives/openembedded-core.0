Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0A0947DE7F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 16:58:37 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b203so4151216wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 09:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4qpPsIuj1cC4DUqvwmIIHa/xe2173qTN7KPv21qf6qM=;
	b=GQLTWz6XRC0QCzYd/VwH015Y/QHWebQpZrMZAX4GEwnciCwNyll3RwPGB5TO/CtDyz
	nsBkpY2Y5WRDyBIHqfezQpOiIm4TYViYUkieDD0CHjF6vITj8CFPlMU4YWkndkcqERMR
	zDGQBcRegI/o4z3+hTDOd+zxFS+Q4866+8KpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4qpPsIuj1cC4DUqvwmIIHa/xe2173qTN7KPv21qf6qM=;
	b=QDZYBrpuJyNsQr28VrWfp/uJDOYsUNrLLlr1prdRTOuGtO9oULDMrmcqKCBuSR0uZQ
	KiOKrTiqCaf0bvaBhQq0rX4GKuJHtBAFNzpKuDZaiMtBT25HJFAw64LlRjlDzbWNvGbw
	66wyU11iF5HjxEagPEUwyrwarBrImeL2bjMZ6VWknxvhcFc4Nya28ntkbuYw2rHaDBYm
	Hj+tTSlywGcaNINhy4TWAL2euePgzI88ai++v3HFPs6y5kEZUkT9H0TkNWrMXB+avL34
	n5gV/vc3EKjn0vDFJmSn2As67CL4GSrhFkLGrtcvRzvM1dMD+a39ktwtHU6wtQmIPwe/
	iK3Q==
X-Gm-Message-State: APjAAAWwp46hTXEQPUb8OKga6dW+nmhhVpUp3PlLsS84SZjQr53gcaLc
	0D0MOr9Pd8bw+YQO//EBS7Wu65J2ZGU=
X-Google-Smtp-Source: APXvYqzZQy7x4JAZFqhVij93KG89tAbgZ9yXS/QYCzPzdUWNErX2HzrEQItZJFMbH6RcsrMg22klUA==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr3746562wmc.15.1557421118513; 
	Thu, 09 May 2019 09:58:38 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a125sm4588609wmc.47.2019.05.09.09.58.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 09:58:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2019 17:58:36 +0100
Message-Id: <20190509165836.14877-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/selftest: Automate manual pybootchart tests
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
X-List-Received-Date: Thu, 09 May 2019 16:58:39 -0000
Content-Transfer-Encoding: 8bit

Automate the current manual pybootchart tests. This includes a check
for the cairo dependency, skipping the test if appropriate.

Based on original patch from Armin Kuster <akuster808@gmail.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/manual/oe-core.json         | 26 -----------------
 meta/lib/oeqa/selftest/cases/oescripts.py | 34 +++++++++++++++++++++++
 2 files changed, 34 insertions(+), 26 deletions(-)

diff --git a/meta/lib/oeqa/manual/oe-core.json b/meta/lib/oeqa/manual/oe-core.json
index d893d849fb3..3ee0aa95f93 100644
--- a/meta/lib/oeqa/manual/oe-core.json
+++ b/meta/lib/oeqa/manual/oe-core.json
@@ -1,30 +1,4 @@
 [
-  {
-    "test": {
-      "@alias": "oe-core.scripts.Use_scripts/pybootchartgui/pybootchartgui.py_to_generate_build_profiles",
-      "author": [
-        {
-          "email": "alexandru.c.georgescu@intel.com",
-          "name": "alexandru.c.georgescu@intel.com"
-        }
-      ],
-      "execution": {
-        "1": {
-          "action": "Run a build for a recipe (e.g. core-image-minimal)",
-          "expected_results": ""
-        },
-        "2": {
-          "action": "Run the profiling script, ../scripts/pybootchartgui/pybootchartgui.py  tmp/buildstats/    \n\n",
-          "expected_results": ""
-        },
-        "3": {
-          "action": "Verify the results ",
-          "expected_results": "The scripts generates svg files with the profiling results . "
-        }
-      },
-      "summary": "Use_scripts/pybootchartgui/pybootchartgui.py_to_generate_build_profiles"
-    }
-  },
   {
     "test": {
       "@alias": "oe-core.scripts.Crosstap_script_check",
diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 56b35b59eb8..217afe3775b 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -2,6 +2,7 @@
 # SPDX-License-Identifier: MIT
 #
 
+import os
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.selftest.cases.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
@@ -28,3 +29,36 @@ class BuildhistoryDiffTests(BuildhistoryBase):
                 self.fail('Unexpected line:\n%s\nExpected line endings:\n  %s' % (line, '\n  '.join(expected_endlines)))
         if expected_endlines:
             self.fail('Missing expected line endings:\n  %s' % '\n  '.join(expected_endlines))
+
+class OEScriptTests(OESelftestTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        super(OEScriptTests, cls).setUpClass()
+        try:
+            import cairo
+        except ImportError:
+            cls.skipTest('Python module cairo is not present')
+        bitbake("core-image-minimal -c rootfs -f")
+        cls.tmpdir = get_bb_var('TMPDIR')
+        cls.buildstats = cls.tmpdir + "/buildstats/" + sorted(os.listdir(cls.tmpdir + "/buildstats"))[-1]
+
+    scripts_dir = os.path.join(get_bb_var('COREBASE'), 'scripts')
+
+class OEPybootchartguyTests(OEScriptTests):
+
+    def test_pybootchartguy_help(self):
+        runCmd('%s/pybootchartgui/pybootchartgui.py  --help' % self.scripts_dir)
+
+    def test_pybootchartguy_to_generate_build_png_output(self):
+        runCmd('%s/pybootchartgui/pybootchartgui.py  %s -o %s/charts -f png' % (self.scripts_dir, self.buildstats, self.tmpdir))
+        self.assertTrue(os.path.exists(self.tmpdir + "/charts.png"))
+
+    def test_pybootchartguy_to_generate_build_svg_output(self):
+        runCmd('%s/pybootchartgui/pybootchartgui.py  %s -o %s/charts -f svg' % (self.scripts_dir, self.buildstats, self.tmpdir))
+        self.assertTrue(os.path.exists(self.tmpdir + "/charts.svg"))
+
+    def test_pybootchartguy_to_generate_build_pdf_output(self):
+        runCmd('%s/pybootchartgui/pybootchartgui.py  %s -o %s/charts -f pdf' % (self.scripts_dir, self.buildstats, self.tmpdir))
+        self.assertTrue(os.path.exists(self.tmpdir + "/charts.pdf"))
+
-- 
2.20.1


