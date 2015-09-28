Return-Path: <george.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7F975CF1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 14:28:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Sep 2015 07:28:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,602,1437462000"; d="scan'208";a="814711109"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 28 Sep 2015 07:28:00 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 502F46A4087;
	Mon, 28 Sep 2015 07:27:04 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Sep 2015 17:25:56 +0300
Message-Id: <1443450356-14224-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/runexported: Fix a problem with ssh_target_log existing in folder.
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
X-List-Received-Date: Mon, 28 Sep 2015 14:28:02 -0000

When copying the exported tests to a remote machine ssh_target_log can
be transformed from softlink to file which will throw an error when
trying to run again.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runexported.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 4213cab..0daedd0 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -49,8 +49,8 @@ class FakeTarget(object):
     def exportStart(self):
         self.sshlog = os.path.join(self.testdir, "ssh_target_log.%s" % self.datetime)
         sshloglink = os.path.join(self.testdir, "ssh_target_log")
-        if os.path.islink(sshloglink):
-            os.unlink(sshloglink)
+        if os.path.exists(sshloglink):
+            os.remove(sshloglink)
         os.symlink(self.sshlog, sshloglink)
         print("SSH log file: %s" %  self.sshlog)
         self.connection = SSHControl(self.ip, logfile=self.sshlog)
-- 
2.1.4


