Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E9C31771F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 16:12:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 30 Jan 2017 08:12:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,312,1477983600"; d="scan'208";a="815056928"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jan 2017 08:12:31 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2017 08:08:22 +0000
Message-Id: <be6fefb82dddf257fab119c536ab5b669c3ad51f.1485763510.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1485515180.git.mariano.lopez@linux.intel.com>
References: <cover.1485515180.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1485763510.git.mariano.lopez@linux.intel.com>
References: <cover.1485763510.git.mariano.lopez@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 4/5] oeqa/core/context.py: Add validation for run-tests option
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
X-List-Received-Date: Mon, 30 Jan 2017 16:12:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linux.intel.com>

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
2.6.6


