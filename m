Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8B0DA78715
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 15:51:45 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2017 07:51:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,364,1508828400"; d="scan'208";a="156278290"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga004.jf.intel.com with ESMTP; 05 Dec 2017 07:51:46 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 07:51:42 -0800
Message-Id: <20171205155142.190886-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] core/loader.py: fix regex to include all available test cases
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
X-List-Received-Date: Tue, 05 Dec 2017 15:51:45 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Some test cases (i.e. eSDK.oeSDKExtSelfTest*) does not match with current regex,
fix it to accept these (and previous ones).

Without it, the following runtime exception is observed when executing eSDK
selftest (oe-selftest -r eSDK)

    Traceback (most recent call last):
      File "/openembedded-core/scripts/oe-selftest", line 70, in <module>
        ret = main()
      File "/openembedded-core/scripts/oe-selftest", line 57, in main
        results = args.func(logger, args)
      File "/openembedded-core/meta/lib/oeqa/selftest/context.py", line 253, in run
        rc = self._internal_run(logger, args)
      File "/openembedded-core/meta/lib/oeqa/selftest/context.py", line 205, in _internal_run
        self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
      File "/openembedded-core/meta/lib/oeqa/core/context.py", line 58, in loadTests
        modules_required, filters)
      File "/openembedded-core/meta/lib/oeqa/core/loader.py", line 69, in __init__
        self.modules = _built_modules_dict(modules)
      File "/openembedded-core/meta/lib/oeqa/core/loader.py", line 48, in _built_modules_dict
        module_name, class_name, test_name = m.groups()
    AttributeError: 'NoneType' object has no attribute 'groups'

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/core/loader.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 975a081ba4..9ab4df0a60 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -43,7 +43,7 @@ def _built_modules_dict(modules):
     for module in modules:
         # Assumption: package and module names do not contain upper case
         # characters, whereas class names do
-        m = re.match(r'^([^A-Z]+)(?:\.([A-Z][^.]*)(?:\.([^.]+))?)?$', module)
+        m = re.match(r'^([a-zA-Z]+)(?:\.([a-zA-Z][^.]*)(?:\.([^.]+))?)?$', module)
 
         module_name, class_name, test_name = m.groups()
 
-- 
2.12.3


