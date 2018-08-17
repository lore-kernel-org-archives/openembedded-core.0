Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E452D79303
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 09:12:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7H9CpUk031773
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 02:12:52 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 17 Aug 2018 02:12:51 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2018 17:17:14 +0800
Message-ID: <760193dd3732a2239aa96f7660dd85ed4071ebd2.1534497181.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1534497181.git.Qi.Chen@windriver.com>
References: <cover.1534497181.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] assimp.py: fix AttributeError in tearDownClass
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
X-List-Received-Date: Fri, 17 Aug 2018 09:12:52 -0000
Content-Type: text/plain

When running this test case, we will see the following error.

  AttributeError: type object 'BuildAssimp' has no attribute 'project'

assimp.py test case does not make use of SDKBuildProject, so remove
the import statement and the tearDownClass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/sdk/cases/assimp.py | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index 7251bdf..26c1df0 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -1,7 +1,6 @@
 import os, subprocess, unittest
 import bb
 from oeqa.sdk.case import OESDKTestCase
-from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
@@ -62,7 +61,3 @@ class BuildAssimp(OESDKTestCase):
             self.assertEqual(machine, elf.machine())
             self.assertEqual(bits, elf.abiSize())
             self.assertEqual(endian, elf.isLittleEndian())
-
-    @classmethod
-    def tearDownClass(self):
-        self.project.clean()
-- 
1.9.1


