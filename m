Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A3E07E08B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 03:19:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8P3IiX9010238
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 20:18:54 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 24 Sep 2019 20:18:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Sep 2019 11:18:34 +0800
Message-ID: <565277564fa368ad227fa80f4fcda53f84b687fd.1569381485.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569381485.git.liezhi.yang@windriver.com>
References: <cover.1569381485.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/1] cases/bbtests.py: test_bitbake_g(): Check base-files rather than busybox
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
X-List-Received-Date: Wed, 25 Sep 2019 03:19:03 -0000
Content-Type: text/plain

It checked whether busybox is in task-depends.dot after run "bitbake -g
core-image-minimal", but busybox is not a must for core-image-minimal since it
is configurable:

VIRTUAL-RUNTIME_base-utils = ""
VIRTUAL-RUNTIME_base-utils-syslog = ""
VIRTUAL-RUNTIME_base-utils-hwclock  =  ""
VIRTUAL-RUNTIME_login_manager = "shadow"
VIRTUAL-RUNTIME_syslog = ""

So the case may fail when busybox is not present, check
base-files which is more reliable.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 8e59baf..9461c7e 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -118,11 +118,12 @@ class BitbakeTests(OESelftestTestCase):
             self.assertIn(task, result.output, msg="Couldn't find %s task.")
 
     def test_bitbake_g(self):
-        result = bitbake('-g core-image-minimal')
+        recipe = 'base-files'
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


