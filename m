Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6BFD26BDE9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 16:49:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Aug 2013 09:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,992,1367996400"; d="scan'208";a="371152481"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2013 09:48:59 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 189066A4092;
	Fri, 30 Aug 2013 09:48:56 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2013 19:48:53 +0300
Message-Id: <1377881333-10382-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/runtime: ping: fix ping false fail
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
X-List-Received-Date: Fri, 30 Aug 2013 16:49:15 -0000

We run the ping test as soon as we reach the login prompt.
But sometimes (seen in sato systemd) we end up with link down/link up stuff like:

    qemux86-64 login: IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
    e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: RX
    IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready

The logic behind ping -w 30 -c 1 was to wait at most 30 seconds
for at least one reply,  but there is a catch: reply doesn't seems
to be echo reply but any reply (non-reply means loss not network error)
ping's man page:
    -w deadline
              Specify  a  timeout, in seconds, before ping exits regardless of
              how many packets have been sent or received. In this  case  ping
              does  not  stop after count packet are sent, it waits either for
              deadline expire or until count probes are answered or  for  some
              error notification from network.

Just when the link up/link down happens ping returns:
    From 192.168.7.1 icmp_seq=1 Destination Host Unreachable
    --- 192.168.7.2 ping statistics ---
    1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms

and exits sooner than the 30 seconds timeout.

This patch should do what was originally intended (wait at most
30 seconds for at least one reply).

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/ping.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/ping.py b/meta/lib/oeqa/runtime/ping.py
index d6a0c28..935f638 100644
--- a/meta/lib/oeqa/runtime/ping.py
+++ b/meta/lib/oeqa/runtime/ping.py
@@ -1,11 +1,17 @@
 import subprocess
 import unittest
 import sys
+import time
 from oeqa.oetest import oeRuntimeTest
 
 class PingTest(oeRuntimeTest):
 
     def test_ping(self):
-        status = subprocess.call("ping -w 30 -c 1 %s" % oeRuntimeTest.tc.qemu.ip, shell=True, stdout=subprocess.PIPE)
-        self.assertEqual(status, 0)
-
+        output = ''
+        status = None
+        endtime = time.time() + 30
+        while status != 0 and time.time() < endtime:
+            proc = subprocess.Popen("ping -c 1 %s" % oeRuntimeTest.tc.qemu.ip, shell=True, stdout=subprocess.PIPE)
+            output += proc.communicate()[0]
+            status = proc.poll()
+        self.assertEqual(status, 0, msg = "No echo reply, ping output is:\n%s" % output)
-- 
1.8.3.1


