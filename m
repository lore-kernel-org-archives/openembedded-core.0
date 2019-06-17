Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41F8F7D416
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 08:20:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5H8KdFI002611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 01:20:50 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 17 Jun 2019 01:20:44 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2019 16:32:13 +0800
Message-ID: <04e801ca1c0747dbf5e932a159d35968a6bf938c.1560760310.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1560760310.git.Qi.Chen@windriver.com>
References: <cover.1560760310.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pkgdata: fix test_find_path to consider multilib
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
X-List-Received-Date: Mon, 17 Jun 2019 08:20:59 -0000
Content-Type: text/plain

Fix test_find_path test case to take into consideration of multilib
being enabled. After this change, no matter multilib is enabled or
not, the test case should pass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/pkgdata.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index 833a180..2bd15eb 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -47,10 +47,11 @@ class OePkgdataUtilTests(OESelftestTestCase):
         self.assertGreater(pkgsize, 1, "Size should be greater than 1. %s" % result.output)
 
     def test_find_path(self):
-        result = runCmd('oe-pkgdata-util find-path /lib/libz.so.1')
-        self.assertEqual(result.output, 'zlib: /lib/libz.so.1')
+        base_libdir = get_bb_var('base_libdir')
+        result = runCmd('oe-pkgdata-util find-path %s/libz.so.1' % base_libdir)
+        self.assertEqual(result.output, 'zlib: %s/libz.so.1' % base_libdir)
         result = runCmd('oe-pkgdata-util find-path /usr/bin/m4')
-        self.assertEqual(result.output, 'm4: /usr/bin/m4')
+        self.assertTrue('m4: /usr/bin/m4' in result.output)
         result = runCmd('oe-pkgdata-util find-path /not/exist', ignore_status=True)
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: Unable to find any package producing path /not/exist')
-- 
1.9.1


