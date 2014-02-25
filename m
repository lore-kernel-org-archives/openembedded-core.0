Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3A36E908
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 10:46:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2014 02:42:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,539,1389772800"; d="scan'208";a="489396588"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 25 Feb 2014 02:46:12 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id AC9996A4083;
	Tue, 25 Feb 2014 02:46:01 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2014 12:46:11 +0200
Message-Id: <1393325171-2672-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] oeqa/targetcontrol: properly get the host ip
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
X-List-Received-Date: Tue, 25 Feb 2014 10:46:36 -0000

For the SimpleRemote target where we need the host ip and
it wasn't set in conf, we tried to determine it automatically.
However ip route output isn't the same for every network, we
need the last field from the first line.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/targetcontrol.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index ba5e6e5..46e5f7f 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -133,7 +133,7 @@ class SimpleRemoteTarget(BaseTarget):
         self.server_ip = d.getVar("TEST_SERVER_IP", True)
         if not self.server_ip:
             try:
-                self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip ]).split()[6]
+                self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip ]).split("\n")[0].split()[-1]
             except Exception as e:
                 bb.fatal("Failed to determine the host IP address (alternatively you can set TEST_SERVER_IP with the IP address of this machine): %s" % e)
         bb.note("Server IP: %s" % self.server_ip)
-- 
1.8.5.3


