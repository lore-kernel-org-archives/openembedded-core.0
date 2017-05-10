Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CAF8D71D31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 19:48:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 10 May 2017 12:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="1128735229"
Received: from rnpawar-mobl3.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.59.138])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2017 12:48:09 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 14:47:17 -0500
Message-Id: <498a0a96a6d8c5a86e8032a160abfdb224fb6f38.1494445222.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, juan.m.cruz.alcaraz@intel.com
Subject: [PATCH 17/17] oeqa/sdk: Enable usage of OEQA thread mode
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
X-List-Received-Date: Wed, 10 May 2017 19:48:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

oeqa/sdk/context.py - Use OETestContextThreaded.
classes/testsdk.bbclass - Enable bb event thread mode to avoid
corrupt the PIPE when multiple threads writes.

[YOCTO #11450]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testsdk.bbclass | 4 ++++
 meta/lib/oeqa/sdk/context.py | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index edea89c..8a9e680 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -24,6 +24,8 @@ def testsdk_main(d):
     from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
     from oeqa.utils import make_logger_bitbake_compatible
 
+    bb.event.enable_threadlock()
+
     pn = d.getVar("PN")
     logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
 
@@ -97,6 +99,8 @@ def testsdkext_main(d):
     from oeqa.utils import avoid_paths_in_environ, make_logger_bitbake_compatible, subprocesstweak
     from oeqa.sdkext.context import OESDKExtTestContext, OESDKExtTestContextExecutor
 
+    bb.event.enable_threadlock()
+
     pn = d.getVar("PN")
     logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
 
diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index 82e4c19..b3d7c75 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -6,9 +6,10 @@ import sys
 import glob
 import re
 
-from oeqa.core.context import OETestContext, OETestContextExecutor
+from oeqa.core.context import OETestContextExecutor
+from oeqa.core.threaded import OETestContextThreaded
 
-class OESDKTestContext(OETestContext):
+class OESDKTestContext(OETestContextThreaded):
     sdk_files_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "files")
 
     def __init__(self, td=None, logger=None, sdk_dir=None, sdk_env=None,
-- 
2.1.4


