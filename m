Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD3677236
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 01:57:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBF1vGV2029041
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 17:57:16 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Dec 2016 17:57:15 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Dec 2016 17:57:14 -0800
Message-ID: <a62cccfa96b7dd47639251cb23aedcd9ebe9d2b9.1481767010.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1481767010.git.liezhi.yang@windriver.com>
References: <cover.1481767010.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] selftest/bbtests.py: update test_bitbake_g()
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
X-List-Received-Date: Thu, 15 Dec 2016 01:57:15 -0000
Content-Type: text/plain

Add tests:
bitbake -g world
bitbake -g world -cfetchall

I saw they were failed in the past.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index baae1e0..bec82f8 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -114,11 +114,16 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(167)
     def test_bitbake_g(self):
-        result = bitbake('-g core-image-full-cmdline')
         for f in ['pn-buildlist', 'pn-depends.dot', 'package-depends.dot', 'task-depends.dot']:
             self.addCleanup(os.remove, f)
-        self.assertTrue('NOTE: PN build list saved to \'pn-buildlist\'' in result.output, msg = "No dependency \"pn-buildlist\" file was generated for the given task target. bitbake output: %s" % result.output)
-        self.assertTrue('openssh' in ftools.read_file(os.path.join(self.builddir, 'pn-buildlist')), msg = "No \"openssh\" dependency found in pn-buildlist file.")
+        cmds = ('-g core-image-full-cmdline', '-g world', '-g world -cfetchall')
+        for cmd in cmds:
+            result = bitbake(cmd)
+            self.assertTrue('NOTE: PN build list saved to \'pn-buildlist\'' in result.output, \
+                msg = "No dependency \"pn-buildlist\" file was generated for the given task target. bitbake output: %s. Command: \"bitbake %s\"" % \
+                (result.output, cmd))
+            self.assertTrue('openssh' in ftools.read_file(os.path.join(self.builddir, 'pn-buildlist')), \
+                msg = "No \"openssh\" dependency found in pn-buildlist file. Command: %s" % cmd)
 
     @testcase(899)
     def test_image_manifest(self):
-- 
2.9.0


