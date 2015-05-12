Return-Path: <george.l.musat@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6EE267402E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 15:03:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2015 08:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,415,1427785200"; d="scan'208";a="709020163"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2015 08:02:45 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 0B6E96A408D;
	Tue, 12 May 2015 08:02:15 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 May 2015 18:00:06 +0300
Message-Id: <1431442806-11829-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/utils: Fixed a problem with get_bb_var not returning right variable.
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
X-List-Received-Date: Tue, 12 May 2015 15:03:42 -0000

It searches using regex now and should be more accurate.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/utils/commands.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index bc1dbb1..663e4e7 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -16,6 +16,7 @@ import threading
 import logging
 from oeqa.utils import CommandError
 from oeqa.utils import ftools
+import re
 
 class Command(object):
     def __init__(self, command, bg=False, timeout=None, data=None, **options):
@@ -139,11 +140,11 @@ def get_bb_var(var, target=None, postconfig=None):
     bbenv = get_bb_env(target, postconfig=postconfig)
     lastline = None
     for line in bbenv.splitlines():
-        if line.startswith(var + "=") or line.startswith("export " + var + "="):
+        if re.search("^(export )?%s=" % var, line):
             val = line.split('=')[1]
             val = val.strip('\"')
             break
-        elif line.startswith("unset " + var):
+        elif re.match("unset %s$" % var, line):
             # Handle [unexport] variables
             if lastline.startswith('#   "'):
                 val = lastline.split('\"')[1]
-- 
2.1.4


