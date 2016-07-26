Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 73F36606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 15:45:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 26 Jul 2016 08:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,425,1464678000"; d="scan'208";a="740010940"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2016 08:45:59 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 07:39:06 +0000
Message-Id: <e87916a7973816a5310ca4b4574c6aac61a86741.1469518569.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1469518569.git.mariano.lopez@linux.intel.com>
References: <cover.1469518569.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1469518569.git.mariano.lopez@linux.intel.com>
References: <cover.1469518569.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/3] oeqa/utils/commands.py: Add oeqa_copy function
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
X-List-Received-Date: Tue, 26 Jul 2016 15:45:59 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This new function is just a call to shutil.copy2() with
follow_symlinks set to False. This function is needed
when using shutil.copytree() to preserve the symlinks.

[YOCTO #9932]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/commands.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 4f79d15..eedc4d7 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -18,6 +18,7 @@ from oeqa.utils import CommandError
 from oeqa.utils import ftools
 import re
 import contextlib
+import shutil
 # Export test doesn't require bb
 try:
     import bb
@@ -273,3 +274,11 @@ def updateEnv(env_file):
     for line in result.output.split("\0"):
         (key, _, value) = line.partition("=")
         os.environ[key] = value
+
+def oeqa_copy(src, dst):
+    """
+    Copy files and symlinks trying to preserve metadata.
+    """
+
+    shutil.copy2(src, dst, follow_symlinks=False)
+
-- 
2.6.6


