Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7115660777
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 02:24:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0A2Olxa023762
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jan 2017 18:24:47 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 9 Jan 2017 18:24:46 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2017 10:24:53 +0800
Message-ID: <8354950a3dd39d7b49935d1ccd27431755fef44b.1484014927.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1484014927.git.Qi.Chen@windriver.com>
References: <cover.1484014927.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] selftest/bbtests.py: fix path assumption for LICENSE_DIRECTORY
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
X-List-Received-Date: Tue, 10 Jan 2017 02:24:47 -0000
Content-Type: text/plain

Fix path assumption for LICENSE_DIRECTORY, otherwise, the test case
may fail even if the functionality it tests works well.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 08cc401..c4e50cb 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -235,8 +235,9 @@ INHERIT_remove = \"report-error\"
         self.addCleanup(ftools.remove_from_file, conf ,data)
         result = bitbake('readline', ignore_status=True)
         self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
-        self.assertFalse(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv3')))
-        self.assertTrue(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv2')))
+        lic_dir = get_bb_var('LICENSE_DIRECTORY')
+        self.assertFalse(os.path.isfile(os.path.join(lic_dir, 'readline/generic_GPLv3')))
+        self.assertTrue(os.path.isfile(os.path.join(lic_dir, 'readline/generic_GPLv2')))
 
     @testcase(1422)
     def test_setscene_only(self):
-- 
1.9.1


