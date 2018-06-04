Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 217FE74BE5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 03:10:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w543A8dI012746
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Jun 2018 20:10:08 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Sun, 3 Jun 2018 20:10:07 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jun 2018 11:10:14 +0800
Message-ID: <4f4837ca4fba6532c5cfb90e90ca1a88db985ac5.1528081495.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528081495.git.Qi.Chen@windriver.com>
References: <cover.1528081495.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/14] testimage.bbclass: move codes into testimage_main
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
X-List-Received-Date: Mon, 04 Jun 2018 03:10:07 -0000
Content-Type: text/plain

testimage-auto is expected to run testimage task's codes automatically.
But in fact, it's currently missing some codes, including testimage_sanity
and create_rpm_index.

This leads to the problem of unexpected runtime failure of test_dnf_makecache.
The error message is as below.

  RESULTS - dnf.DnfRepoTest.test_dnf_makecache - Testcase 1744: ERROR

This error is caused by the fact that create_rpm_index is not executed
before running the tests.

There's no reason why such codes should not be in testimage_main, so
move them into it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/testimage.bbclass | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 14252ff..c17a7c6 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -117,13 +117,6 @@ testimage_dump_host () {
 }
 
 python do_testimage() {
-
-    testimage_sanity(d)
-
-    if (d.getVar('IMAGE_PKGTYPE') == 'rpm'
-       and ('dnf' in d.getVar('TEST_SUITES') or 'auto' in d.getVar('TEST_SUITES'))):
-        create_rpm_index(d)
-
     testimage_main(d)
 }
 
@@ -159,6 +152,12 @@ def testimage_main(d):
         """
         raise RuntimeError
 
+    testimage_sanity(d)
+
+    if (d.getVar('IMAGE_PKGTYPE') == 'rpm'
+       and ('dnf' in d.getVar('TEST_SUITES') or 'auto' in d.getVar('TEST_SUITES'))):
+        create_rpm_index(d)
+
     logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
     pn = d.getVar("PN")
 
-- 
1.9.1


