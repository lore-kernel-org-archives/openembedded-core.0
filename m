Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 461C774A37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 08:31:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4V8UipL007674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 01:31:05 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 May 2018 01:31:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2018 16:32:49 +0800
Message-ID: <ef03ce55fecb5d3cb64dc58ac25423b0cceeee24.1527755434.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1527755434.git.Qi.Chen@windriver.com>
References: <cover.1527755434.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/14] testimage.bbclass: fix behavior of empty TEST_SUITES
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
X-List-Received-Date: Thu, 31 May 2018 08:31:14 -0000
Content-Type: text/plain

The current behaviour of TEST_SUITES is very confusing.

setting: TEST_SUITES = ""
result:  Execute all test cases.

setting: TEST_SUITES = "some_case_not_exist"
result:  Error out with 'Empty test suite' message.

The expected behaviour of TEST_SUITES should be:
1. when 'auto' is in it, execute as many test cases as possible
2. when no valid test case is specified, error out and give user message

The first one is implemented by a previous patch.
The second one is fixed in this patch.

Also add debug message to show test cases to be executed. This is
for easier debugging.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/testimage.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index bb688b0..d97da67 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -260,10 +260,16 @@ def testimage_main(d):
     # Load tests before starting the target
     test_paths = get_runtime_paths(d)
     test_modules = d.getVar('TEST_SUITES').split()
+    if not test_modules:
+        bb.fatal('Empty test suite, please verify TEST_SUITES variable')
+
     tc.loadTests(test_paths, modules=test_modules)
 
-    if not getSuiteCases(tc.suites):
+    suitecases = getSuiteCases(tc.suites)
+    if not suitecases:
         bb.fatal('Empty test suite, please verify TEST_SUITES variable')
+    else:
+        bb.debug(2, 'test suites:\n\t%s' % '\n\t'.join([str(c) for c in suitecases]))
 
     package_extraction(d, tc.suites)
 
-- 
1.9.1


