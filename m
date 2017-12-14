Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E2D39787FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 15:07:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Dec 2017 07:07:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,400,1508828400"; 
   d="scan'208";a="2386448"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga007.fm.intel.com with ESMTP; 14 Dec 2017 07:07:29 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Dec 2017 07:07:22 -0800
Message-Id: <20171214150722.20030-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH v2] core/loader.py: fix regex to include all available test cases
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
X-List-Received-Date: Thu, 14 Dec 2017 15:07:29 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Some test cases (eSDK.oeSDK*, runtime_test/*) does not match
with current regex, fix it accept all.

[YOCTO #12385]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/core/loader.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 975a081ba4..a4744dee03 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -43,7 +43,7 @@ def _built_modules_dict(modules):
     for module in modules:
         # Assumption: package and module names do not contain upper case
         # characters, whereas class names do
-        m = re.match(r'^([^A-Z]+)(?:\.([A-Z][^.]*)(?:\.([^.]+))?)?$', module)
+        m = re.match(r'^(\w+)(?:\.(\w[^.]*)(?:\.([^.]+))?)?$', module, flags=re.ASCII)
 
         module_name, class_name, test_name = m.groups()
 
-- 
2.12.3


