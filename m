Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BFD1D60C02
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 11:08:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Mar 2014 03:08:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,607,1389772800"; d="scan'208";a="494103981"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2014 03:08:31 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 37B1F6A4007;
	Fri,  7 Mar 2014 03:08:17 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Mar 2014 13:08:30 +0200
Message-Id: <1394190510-4316-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] oeqa/targetcontrol: allow a custom port for SimpleRemoteTarget
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
X-List-Received-Date: Fri, 07 Mar 2014 11:08:46 -0000

We had the ability to use a custom port for the ssh connection,
but we weren't using it.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/targetcontrol.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index d8a6ac0..17871f5 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -144,7 +144,12 @@ class SimpleRemoteTarget(BaseTarget):
 
     def __init__(self, d):
         super(SimpleRemoteTarget, self).__init__(d)
-        self.ip = d.getVar("TEST_TARGET_IP", True) or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
+        addr = d.getVar("TEST_TARGET_IP", True) or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
+        self.ip = addr.split(":")[0]
+        try:
+            self.port = addr.split(":")[1]
+        except IndexError:
+            self.port = None
         bb.note("Target IP: %s" % self.ip)
         self.server_ip = d.getVar("TEST_SERVER_IP", True)
         if not self.server_ip:
@@ -158,7 +163,7 @@ class SimpleRemoteTarget(BaseTarget):
         super(SimpleRemoteTarget, self).deploy()
 
     def start(self, params=None):
-        self.connection = SSHControl(self.ip, logfile=self.sshlog)
+        self.connection = SSHControl(self.ip, logfile=self.sshlog, port=self.port)
 
     def stop(self):
         self.connection = None
-- 
1.8.5.3


