Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5385C78352
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:38:55 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887865"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:38:55 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:51 -0500
Message-Id: <87e00e11dfc5ff1101cf3148011cfc946e042261.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 25/36] oeqa/core/context: Use a default iterable modules object
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
X-List-Received-Date: Fri, 26 May 2017 20:38:55 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The OETestLoader.modules must be an iterable object, otherwise
checking presence of specific modules with the 'in' operator fails
with the following command/error:

    % oe-test core
    .. - core - INFO - Running bitbake -p
    Traceback (most recent call last):
      File "..poky2/scripts/oe-test", line 108, in <module>
        ret = main()
      File "..poky2/scripts/oe-test", line 93, in main
        results = args.func(logger, args)
      File "..poky2/meta/lib/oeqa/core/context.py", line 235, in run
        self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
      File "..poky2/meta/lib/oeqa/core/context.py", line 53, in loadTests
        self.suites = self.loader.discover()
      File "..poky2/meta/lib/oeqa/core/loader.py", line 204, in discover
        pattern='*.py', top_level_dir=path)
      File "/usr/lib64/python3.4/unittest/loader.py", line 275, in discover
        tests = list(self._find_tests(start_dir, pattern))
      File "/usr/lib64/python3.4/unittest/loader.py", line 339, in _find_tests
        yield self.loadTestsFromModule(module)
      File "..poky2/meta/lib/oeqa/core/loader.py", line 266, in loadTestsFromModule
        and module.__name__ in self.modules \
    TypeError: argument of type 'NoneType' is not iterable

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/core/context.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 1ac2878..20d8236 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -139,7 +139,7 @@ class OETestContextExecutor(object):
         if args.run_tests:
             self.tc_kwargs['load']['modules'] = args.run_tests
         else:
-            self.tc_kwargs['load']['modules'] = None
+            self.tc_kwargs['load']['modules'] = []
 
         self.module_paths = args.CASES_PATHS
 
-- 
2.1.4


