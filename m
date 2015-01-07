Return-Path: <george.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5459365D40
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 16:29:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 07 Jan 2015 08:29:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,715,1413270000"; d="scan'208";a="647648725"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jan 2015 08:29:21 -0800
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 4FAC36A408D;
	Wed,  7 Jan 2015 08:29:17 -0800 (PST)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jan 2015 18:29:00 +0200
Message-Id: <1420648140-11371-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/parselogs: Added a check in case the folder location does not contain any log files
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
X-List-Received-Date: Wed, 07 Jan 2015 16:29:27 -0000

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 42cb1b5..1cb9939 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -100,9 +100,10 @@ class ParseLogsTest(oeRuntimeTest):
                 (status, output) = self.target.run("test -d "+str(location))
                 if (status == 0):
                     (status, output) = self.target.run("find "+str(location)+"/*.log -maxdepth 1 -type f")
-                    output = output.splitlines()
-                    for logfile in output:
-                        logs.append(os.path.join(location,str(logfile)))
+                    if (status == 0):
+                        output = output.splitlines()
+                        for logfile in output:
+                            logs.append(os.path.join(location,str(logfile)))
         return logs
 
     #build the grep command to be used with filters and exclusions
-- 
2.1.0


