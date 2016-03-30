Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A400365CC3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 20:28:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 30 Mar 2016 13:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,418,1455004800"; d="scan'208";a="774923924"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.90])
	by orsmga003.jf.intel.com with ESMTP; 30 Mar 2016 13:28:24 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2016 14:21:41 -0600
Message-Id: <1459369302-16671-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 1/2] oeqa/runtime/parselogs.py: Add systemd unit circular dependencies errors.
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
X-List-Received-Date: Wed, 30 Mar 2016 20:28:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When systemd is enabled as init we need to notice when circular
dependencies in units happen because systemd try to solve this situation
removing the unit itself.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 4def533..dec9ebe 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -131,6 +131,17 @@ class ParseLogsTest(oeRuntimeTest):
     @classmethod
     def setUpClass(self):
         self.errors = errors
+
+        # When systemd is enabled we need to notice errors on
+        # circular dependencies in units.
+        if self.hasFeature("systemd"):
+            self.errors.extend([
+                'Found ordering cycle on',
+                'Breaking ordering cycle by deleting job',
+                'deleted to break ordering cycle',
+                'Ordering cycle found, skipping',
+                ])
+
         self.ignore_errors = ignore_errors
         self.log_locations = log_locations
         self.msg = ""
-- 
2.1.4


