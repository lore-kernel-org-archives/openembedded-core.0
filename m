Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F149960EBA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 12:30:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 Sep 2013 05:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,978,1371106800"; d="scan'208";a="406936601"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 25 Sep 2013 05:30:34 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id A20272C8001;
	Wed, 25 Sep 2013 05:30:30 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2013 15:30:49 +0300
Message-Id: <1380112249-10491-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/runtime: ping: wait for 5 echo replies
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
X-List-Received-Date: Wed, 25 Sep 2013 12:30:39 -0000

Instead of considering that ping test passed after 1 reply,
wait for at least 5 consecutive replies in 60 seconds (which should
be enough time for connman to reconfigure the interface in systemd
images and help with the fake ssh/tests fails.)

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/ping.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/ping.py b/meta/lib/oeqa/runtime/ping.py
index e163b96..0d028f9 100644
--- a/meta/lib/oeqa/runtime/ping.py
+++ b/meta/lib/oeqa/runtime/ping.py
@@ -8,10 +8,13 @@ class PingTest(oeRuntimeTest):
 
     def test_ping(self):
         output = ''
-        status = None
+        count = 0
         endtime = time.time() + 60
-        while status != 0 and time.time() < endtime:
+        while count < 5 and time.time() < endtime:
             proc = subprocess.Popen("ping -c 1 %s" % oeRuntimeTest.tc.qemu.ip, shell=True, stdout=subprocess.PIPE)
             output += proc.communicate()[0]
-            status = proc.poll()
-        self.assertEqual(status, 0, msg = "No echo reply, ping output is:\n%s" % output)
+            if proc.poll() == 0:
+                count += 1
+            else:
+                count = 0
+        self.assertEqual(count, 5, msg = "Expected 5 consecutive replies, got %d.\nping output is:\n%s" % (count,output))
-- 
1.8.3.1


