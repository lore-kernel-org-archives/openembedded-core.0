Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC5D60017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 23:22:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 05 Aug 2015 16:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,620,1432623600"; d="scan'208";a="743031455"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2015 16:22:13 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Aug 2015 23:21:25 +0000
Message-Id: <95943e072596a3d06d3c2f164620373e18925f9a.1438816804.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1438816804.git.alejandro.hernandez@linux.intel.com>
References: <cover.1438816804.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] qemurunner: Improves checking for Server and Target IPs on qemus parameters
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
X-List-Received-Date: Wed, 05 Aug 2015 23:22:12 -0000

Fixes server hanging infinitely waiting for qemus process to let go of bitbake.lock

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 1cf8f76..ff53af3 100644
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
+	            raise Exception
+                else:
+                    self.ip = ips[0]
+                    self.server_ip = ips[1]
+	    except Exception:
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


