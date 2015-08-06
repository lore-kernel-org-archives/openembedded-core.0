Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 28B8376597
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 18:33:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 06 Aug 2015 11:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,624,1432623600"; d="scan'208";a="763457343"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga001.fm.intel.com with ESMTP; 06 Aug 2015 11:33:05 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 18:32:18 +0000
Message-Id: <752bf9c36cbb5acc623f3e8acca340579a91edb3.1438880827.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1438880827.git.alejandro.hernandez@linux.intel.com>
References: <cover.1438880827.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH v2 1/1] qemurunner: Improves checking for server and target IPs on qemus parameters
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
X-List-Received-Date: Thu, 06 Aug 2015 18:33:10 -0000

Fixes OS hanging infinitely waiting for qemus process to release bitbake.lock

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 1cf8f76..6c1b8dd 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -120,14 +120,17 @@ class QemuRunner:
             cmdline = ''
             with open('/proc/%s/cmdline' % self.qemupid) as p:
                 cmdline = p.read()
-            ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
-            if not ips or len(ips) != 3:
+	    try:
+                ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
+                if not ips or len(ips) != 3:
+                    raise ValueError
+                else:
+                    self.ip = ips[0]
+                    self.server_ip = ips[1]
+            except IndexError, ValueError:
                 logger.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used: %s" % cmdline)
                 self.stop()
                 return False
-            else:
-                self.ip = ips[0]
-                self.server_ip = ips[1]
             logger.info("Target IP: %s" % self.ip)
             logger.info("Server IP: %s" % self.server_ip)
             logger.info("Waiting at most %d seconds for login banner" % self.boottime)
-- 
1.8.4.5


