Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 48CC26BE9B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 17:51:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2013 10:48:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,984,1367996400"; d="scan'208";a="395507429"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 29 Aug 2013 10:51:47 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 1EFCE6A4007;
	Thu, 29 Aug 2013 10:51:44 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 20:51:41 +0300
Message-Id: <1377798701-20612-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/utils: qemurunner: fix when runqemu errors out
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
X-List-Received-Date: Thu, 29 Aug 2013 17:51:48 -0000

When qemu doesn't start or runqemu errors out
(some wrong option passed or sudo needs a password for setting tap) we
want to display the output but oe-core commit 9de7fe11967576f4a8b24e653c6b9a02e5f6d85b/
poky commit 51588936d4a8cde3c9bb05800240c0a0f5dedf8d
changed the kill method and broke this code, so let's fix it.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 6ee5b85..e7bd8b1 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -133,9 +133,9 @@ class QemuRunner:
                 return False
         else:
             bb.note("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
+            output = self.runqemu.stdout
             self.kill()
-            bb.note("Output from runqemu: %s " % self.runqemu.stdout.read())
-            self.runqemu.stdout.close()
+            bb.note("Output from runqemu:\n%s" % output.read())
             return False
 
         return self.is_alive()
-- 
1.8.3.1


