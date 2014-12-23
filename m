Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 42B507271F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 16:10:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 23 Dec 2014 08:08:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,632,1413270000"; d="scan'208";a="628280241"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.255.13.178])
	by orsmga001.jf.intel.com with ESMTP; 23 Dec 2014 08:08:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Dec 2014 16:08:43 +0000
Message-Id: <15a4e2d715fab1e8c9a8c8ff4af3d82da41818ed.1419350817.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1419350817.git.paul.eggleton@linux.intel.com>
References: <cover.1419350817.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1419350817.git.paul.eggleton@linux.intel.com>
References: <cover.1419350817.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/7] oeqa/utils: fix testcase decorator to allow calling tests individually
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
X-List-Received-Date: Tue, 23 Dec 2014 16:10:06 -0000

Without this, running tests individually failed with a traceback:

$ oe-selftest --run-test
buildoptions.ImageOptionsTests.test_incremental_image_generation
2014-12-23 14:40:37,636 - selftest - INFO - Checking that everything is in order before running the tests
2014-12-23 14:40:38,408 - selftest - INFO - Running bitbake -p
2014-12-23 14:40:40,235 - selftest - INFO - Loading tests from:
oeqa.selftest.buildoptions.ImageOptionsTests.test_incremental_image_generation
Traceback (most recent call last):
  File "/home/user/poky/scripts/oe-selftest", line 179, in <module>
    ret = main()
  File "/home/user/poky/scripts/oe-selftest", line 164, in main
    suite.addTests(loader.loadTestsFromName(test))
  File "/usr/lib64/python2.7/unittest/loader.py", line 91, in loadTestsFromName
    module = __import__('.'.join(parts_copy))
  File "/home/user/poky/meta/lib/oeqa/selftest/buildoptions.py", line 12, in <module>
    class ImageOptionsTests(oeSelfTest):
  File "/home/user/poky/meta/lib/oeqa/selftest/buildoptions.py", line 14, in ImageOptionsTests
    @testcase(761)
NameError: global name 'func' is not defined

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/utils/decorators.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 1ae1162..2d5db24 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -89,6 +89,7 @@ class testcase(object):
         def wrapped_f(*args):
             return func(*args)
         wrapped_f.test_case = self.test_case
+        wrapped_f.__name__ = func.__name__
         return wrapped_f
 
 class NoParsingFilter(logging.Filter):
-- 
1.9.3


