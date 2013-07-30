Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 761306B0AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 09:27:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 30 Jul 2013 02:27:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,776,1367996400"; d="scan'208";a="373345172"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2013 02:27:48 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 770066A4092
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 02:27:46 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2013 12:28:17 +0300
Message-Id: <7d18e13388c5baf12967e110ee7bda8ec1ec7ec9.1375176217.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1375176217.git.stefanx.stanacar@intel.com>
References: <cover.1375176217.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1375176217.git.stefanx.stanacar@intel.com>
References: <cover.1375176217.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 1/4] oeqa/utils/sshcontrol: increase and log timeout in output
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
X-List-Received-Date: Tue, 30 Jul 2013 09:27:47 -0000

Increase a bit the timeout for ssh commands and also
write in the output that the command timed out (it's
easier to see that in a test fail than checking the ssh log)

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/sshcontrol.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 8f98c45..7de7c3e 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -13,7 +13,7 @@ import os
 
 class SSHControl(object):
 
-    def __init__(self, host=None, timeout=200, logfile=None):
+    def __init__(self, host=None, timeout=300, logfile=None):
         self.host = host
         self.timeout = timeout
         self._out = ''
@@ -52,9 +52,10 @@ class SSHControl(object):
             self._ret = sshconn.poll()
         else:
             if timeout is None:
-                endtime = time.time() + self.timeout
+                tdelta = self.timeout
             else:
-                endtime = time.time() + timeout
+                tdelta = timeout
+            endtime = time.time() + tdelta
             while sshconn.poll() is None and time.time() < endtime:
                 time.sleep(1)
             # process hasn't returned yet
@@ -64,7 +65,8 @@ class SSHControl(object):
                 sshconn.kill()
                 self._out = sshconn.stdout.read()
                 sshconn.stdout.close()
-                self.log("[!!! process killed]")
+                self._out += "\n[!!! SSH command timed out after %d seconds and it was killed]" % tdelta
+                self.log("[!!! SSH command timed out after %d seconds and it was killed]" % tdelta)
             else:
                 self._out = sshconn.stdout.read()
                 self._ret = sshconn.poll()
-- 
1.8.3.1


