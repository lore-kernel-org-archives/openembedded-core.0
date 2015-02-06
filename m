Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6FDE3605F1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 21:00:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2015 13:00:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,530,1418112000"; d="scan'208";a="682165426"
Received: from ranerica-desk01.sc.intel.com ([10.3.52.155])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2015 13:00:11 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Fri,  6 Feb 2015 12:59:57 -0800
Message-Id: <1423256398-20405-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] rootfs.py: ignore "NOTE:" when catching warnings
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
X-List-Received-Date: Fri, 06 Feb 2015 21:00:57 -0000

The script looks for any warn|Warn pattern in the log. However,
it may happen that the warn|Warn pattern appears as part of the name
of the objects described in the NOTE lines of the log. Thus, to avoid
false positives, ignore the line if it contains the word "NOTE:"

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index f42a2ae..dd7aa44 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -359,7 +359,7 @@ class RpmRootfs(Rootfs):
         log_path = self.d.expand("${T}/log.do_rootfs")
         with open(log_path, 'r') as log:
             for line in log.read().split('\n'):
-                if 'log_check' in line:
+                if 'log_check' or 'NOTE:' in line:
                     continue
 
                 m = r.search(line)
-- 
1.9.1


