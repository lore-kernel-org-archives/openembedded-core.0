Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E4A16FF72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 10:19:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 10 Feb 2016 02:19:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,425,1449561600"; d="scan'208";a="881111472"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 10 Feb 2016 02:19:13 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id E444B6A4002;
	Wed, 10 Feb 2016 03:07:04 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 10:09:37 +0200
Message-Id: <1455091777-19181-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa: setup bitbake logger after tinfoil.shutdown
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
X-List-Received-Date: Wed, 10 Feb 2016 10:19:13 -0000

Bitbake logger stops working after tinfoil.shutdown removes console
handler from it. This makes bb.{error,warn,note,critical} messages
disappear from the console. Adding console handler to bitbake logger
again should fix this issue.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/utils/commands.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 08e2cbb..dfb6c21 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -18,6 +18,7 @@ from oeqa.utils import CommandError
 from oeqa.utils import ftools
 import re
 import contextlib
+import bb
 
 class Command(object):
     def __init__(self, command, bg=False, timeout=None, data=None, **options):
@@ -208,6 +209,16 @@ def runqemu(pn, test):
         # Luckily QemuTarget doesn't need it after the constructor.
         tinfoil.shutdown()
 
+    # Setup bitbake logger as console handler is removed by tinfoil.shutdown
+    bblogger = logging.getLogger('BitBake')
+    bblogger.setLevel(logging.INFO)
+    console = logging.StreamHandler(sys.stdout)
+    bbformat = bb.msg.BBLogFormatter("%(levelname)s: %(message)s")
+    if sys.stdout.isatty():
+        bbformat.enable_color()
+    console.setFormatter(bbformat)
+    bblogger.addHandler(console)
+
     try:
         qemu.deploy()
         try:
-- 
2.1.4


