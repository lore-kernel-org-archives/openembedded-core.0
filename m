Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4E1E96C1BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 08:15:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8O8FYub015352
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 01:15:34 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 24 Sep 2019 01:15:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Sep 2019 16:15:17 +0800
Message-ID: <ba0e10441f900a47a504fbbc28579d5b2f6fc841.1569312737.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569312737.git.liezhi.yang@windriver.com>
References: <cover.1569312737.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cases/bbtests.py: test_bitbake_g(): Check core-image-minimal itself
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
X-List-Received-Date: Tue, 24 Sep 2019 08:15:33 -0000
Content-Type: text/plain

It checked whether busybox is in pn-buildlist and task-depends.dot after run
"bitbake -g core-image-minimal", but busybox is not a must for
core-image-minimal, so the case may fail when busybox is not present, this case
is used for checking "bitbake -g", so check core-image-minimal itself is more
reliable.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 8e59baf..4103396 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -118,11 +118,12 @@ class BitbakeTests(OESelftestTestCase):
             self.assertIn(task, result.output, msg="Couldn't find %s task.")
 
     def test_bitbake_g(self):
-        result = bitbake('-g core-image-minimal')
+        recipe = 'core-image-minimal'
+        result = bitbake('-g %s' % recipe)
         for f in ['pn-buildlist', 'task-depends.dot']:
             self.addCleanup(os.remove, f)
         self.assertTrue('Task dependencies saved to \'task-depends.dot\'' in result.output, msg = "No task dependency \"task-depends.dot\" file was generated for the given task target. bitbake output: %s" % result.output)
-        self.assertTrue('busybox' in ftools.read_file(os.path.join(self.builddir, 'task-depends.dot')), msg = "No \"busybox\" dependency found in task-depends.dot file.")
+        self.assertTrue(recipe in ftools.read_file(os.path.join(self.builddir, 'task-depends.dot')), msg = "No \"%s\" dependency found in task-depends.dot file." % recipe)
 
     def test_image_manifest(self):
         bitbake('core-image-minimal')
-- 
2.7.4


