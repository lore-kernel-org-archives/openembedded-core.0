Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E823F61019
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 12:48:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 13 Sep 2013 05:48:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,898,1371106800"; d="scan'208";a="395251470"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2013 05:48:08 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id B9FE66A4093;
	Fri, 13 Sep 2013 05:48:05 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2013 15:48:18 +0300
Message-Id: <1379076498-30469-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/runtime: timeout increases
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
X-List-Received-Date: Fri, 13 Sep 2013 12:48:08 -0000

Increase the timeout for smart commands as under load for qemumips
it's still to small. Also give ping more time fixing a potential
timeout for sato systemd.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/ping.py  | 2 +-
 meta/lib/oeqa/runtime/smart.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/ping.py b/meta/lib/oeqa/runtime/ping.py
index 935f638..e163b96 100644
--- a/meta/lib/oeqa/runtime/ping.py
+++ b/meta/lib/oeqa/runtime/ping.py
@@ -9,7 +9,7 @@ class PingTest(oeRuntimeTest):
     def test_ping(self):
         output = ''
         status = None
-        endtime = time.time() + 30
+        endtime = time.time() + 60
         while status != 0 and time.time() < endtime:
             proc = subprocess.Popen("ping -c 1 %s" % oeRuntimeTest.tc.qemu.ip, shell=True, stdout=subprocess.PIPE)
             output += proc.communicate()[0]
diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index e2f0aea..5580655 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -15,7 +15,7 @@ class SmartTest(oeRuntimeTest):
     @skipUnlessPassed('test_smart_help')
     def smart(self, command, expected = 0):
         command = 'smart %s' % command
-        status, output = self.target.run(command, 500)
+        status, output = self.target.run(command, 900)
         message = os.linesep.join([command, output])
         self.assertEqual(status, expected, message)
         self.assertFalse("Cannot allocate memory" in output, message)
-- 
1.8.3.1


