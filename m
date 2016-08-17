Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 852D160762
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 02:17:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 16 Aug 2016 19:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,529,1464678000"; d="scan'208";a="866670641"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga003.jf.intel.com with ESMTP; 16 Aug 2016 19:17:55 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2016 22:14:53 -0700
Message-Id: <1471410895-3159-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 1/3] parselogs.py: Ignore Skylake graphics firmware load errors on genericx86-64
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
X-List-Received-Date: Wed, 17 Aug 2016 02:17:57 -0000

These errors can't be fixed without adding the firmware to the initramfs
and building it into the kernel, which we don't want to do for
genericx86-64. Since graphics still work acceptably without the firmware
blobs, just ignore the errors for that MACHINE.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 242cd8c..3899d26 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -114,7 +114,13 @@ ignore_errors = {
     'intel-corei7-64' : x86_common,
     'crownbay' : x86_common,
     'genericx86' : x86_common,
-    'genericx86-64' : x86_common,
+    'genericx86-64' : [
+        'Direct firmware load for i915',
+        'Failed to load firmware i915',
+        'Failed to fetch GuC',
+        'Failed to initialize GuC',
+        'The driver is built-in, so to load the firmware you need to',
+        ] + x86_common,
     'edgerouter' : [
         'Fatal server error:',
         ] + common_errors,
-- 
2.5.5


