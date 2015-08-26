Return-Path: <costin.c.constantin@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6EAE8734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 12:43:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 26 Aug 2015 05:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,415,1437462000"; d="scan'208";a="548857871"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2015 05:43:29 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 84B606A4005;
	Wed, 26 Aug 2015 05:42:37 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 15:54:21 +0300
Message-Id: <1440593661-7746-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] runtime/syslog.py: fix syslog test crash
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
X-List-Received-Date: Wed, 26 Aug 2015 12:43:31 -0000

This patch fixes the ability to correctly identify syslog's package
name for the built image. It is derived from modifying oeqa/oetest.py
for [YOCTO #8170]

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/runtime/syslog.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/syslog.py b/meta/lib/oeqa/runtime/syslog.py
index dbaf8c6..2601dd9 100644
--- a/meta/lib/oeqa/runtime/syslog.py
+++ b/meta/lib/oeqa/runtime/syslog.py
@@ -3,7 +3,7 @@ from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
 
 def setUpModule():
-    if not oeRuntimeTest.hasPackage("syslog"):
+    if not (oeRuntimeTest.hasPackage("busybox-syslog") or oeRuntimeTest.hasPackage("sysklogd")):
         skipModule("No syslog package in image")
 
 class SyslogTest(oeRuntimeTest):
-- 
2.1.4


