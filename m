Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 692DD6B180
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 09:24:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0O9OXkX005047
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 01:24:44 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 24 Jan 2019 01:24:22 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2019 17:33:01 +0800
Message-ID: <8c03aec86c79c856b4f68ab4ff5cf8fe8943306e.1548322104.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1548322104.git.Qi.Chen@windriver.com>
References: <cover.1548322104.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] eSDK.py: avoid error in tearDownClass due to race condistion
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
X-List-Received-Date: Thu, 24 Jan 2019 09:24:53 -0000
Content-Type: text/plain

When removing the temporary directory, it's possible that bitbake.lock
file is removed by bitbake during the cleanup. And this leads to the
following error.

  FileNotFoundError: [Errno 2] No such file or directory: 'bitbake.lock'

So add a check to remove this file before cleaning up the temporary
directory.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/eSDK.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index d7aef93..8e3a43d 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -2,6 +2,7 @@ import tempfile
 import shutil
 import os
 import glob
+import time
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
@@ -95,6 +96,11 @@ SSTATE_MIRRORS =  "file://.* file://%s/PATH"
 
     @classmethod
     def tearDownClass(cls):
+        for i in range(0, 10):
+            if os.path.exists(os.path.join(cls.tmpdir_eSDKQA, 'bitbake.lock')):
+                time.sleep(1)
+            else:
+                break
         cls.tmpdirobj.cleanup()
         super().tearDownClass()
 
-- 
1.9.1


