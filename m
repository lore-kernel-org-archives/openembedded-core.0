Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 206346F5B9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 11:34:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Mar 2014 03:34:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,607,1389772800"; d="scan'208";a="494113297"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2014 03:34:03 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id D25B56A4007;
	Fri,  7 Mar 2014 03:33:51 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Mar 2014 13:34:05 +0200
Message-Id: <1394192045-7063-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] oeqa/targetcontrol: fix loading a controller using a class name
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
X-List-Received-Date: Fri, 07 Mar 2014 11:34:07 -0000

This was wrong and if one would do TEST_TARGET = "SimpleRemoteTarget"
instead of TEST_TARGET = "simpleremote" it would complain
that there is no such controller when there is.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/targetcontrol.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index d8a6ac0..490810d 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -9,6 +9,7 @@ import shutil
 import subprocess
 import bb
 import traceback
+import sys
 from oeqa.utils.sshcontrol import SSHControl
 from oeqa.utils.qemurunner import QemuRunner
 from oeqa.controllers.testtargetloader import TestTargetLoader
@@ -25,7 +26,7 @@ def get_target_controller(d):
         # use the class name
         try:
             # is it a core class defined here?
-            controller = getattr(__name__, testtarget)
+            controller = getattr(sys.modules[__name__], testtarget)
         except AttributeError:
             # nope, perhaps a layer defined one
             try:
-- 
1.8.5.3


