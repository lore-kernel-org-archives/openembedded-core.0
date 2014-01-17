Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id AB6F261624
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 15:56:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2014 07:56:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,674,1384329600"; d="scan'208";a="460554942"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2014 07:56:43 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 8FF2B6A4007;
	Fri, 17 Jan 2014 07:56:38 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2014 17:57:47 +0200
Message-Id: <1389974267-12667-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [PATCH] lib/oeqa: sshcontrol: fix false timeout failures
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
X-List-Received-Date: Fri, 17 Jan 2014 15:56:43 -0000

Ocasionally AB shows odd false fails like:
http://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/1/steps/Running%20Sanity%20Tests/logs/stdio
This should fix that by checking for eof instead of
polling the return code of the ssh process, because the process
might still be there.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/sshcontrol.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index a0dcf02..3e53ec3 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -77,7 +77,7 @@ class SSHControl(object):
                         endtime = time.time() + tdelta
 
             # process hasn't returned yet
-            if sshconn.poll() is None:
+            if not eof:
                 sshconn.terminate()
                 time.sleep(3)
                 try:
@@ -86,7 +86,7 @@ class SSHControl(object):
                     pass
                 output += "\n[!!! SSH command killed - no output for %d seconds. Total running time: %d seconds." % (tdelta, time.time() - self._starttime)
 
-        self._ret = sshconn.poll()
+        self._ret = sshconn.wait()
         # strip the last LF so we can test the output
         self._out = output.rstrip()
         self.log("%s" % self._out)
-- 
1.8.4.2


