Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5B09B771D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 20:49:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jan 2017 12:49:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,316,1477983600"; d="scan'208";a="37939484"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.122])
	by orsmga002.jf.intel.com with ESMTP; 31 Jan 2017 12:49:50 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 14:52:54 -0600
Message-Id: <1485895975-7611-3-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1485895975-7611-1-git-send-email-anibal.limon@linux.intel.com>
References: <1485895975-7611-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] oeqa/core/context.py: Add validation for run-tests option
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
X-List-Received-Date: Tue, 31 Jan 2017 20:49:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The run-tests option is optional so if isn't specified set
to None instead of crash on split().

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/context.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index efed4e6..4476750 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -215,7 +215,11 @@ class OETestContextExecutor(object):
         else:
             self.tc_kwargs['init']['td'] = {}
 
-        self.tc_kwargs['load']['modules'] = args.run_tests.split()
+
+        if args.run_tests:
+            self.tc_kwargs['load']['modules'] = args.run_tests.split()
+        else:
+            self.tc_kwargs['load']['modules'] = None
 
         self.module_paths = args.CASES_PATHS
 
-- 
2.1.4


