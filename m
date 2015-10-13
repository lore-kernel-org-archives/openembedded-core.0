Return-Path: <george.l.musat@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F33E765D6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 13:45:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 13 Oct 2015 06:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,678,1437462000"; d="scan'208";a="791547459"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 13 Oct 2015 06:45:13 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 35F796A4083;
	Tue, 13 Oct 2015 06:44:13 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Oct 2015 16:43:21 +0300
Message-Id: <1444743801-2667-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/runexported: Add ability to run tests grouped in folders.
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
X-List-Received-Date: Tue, 13 Oct 2015 13:45:30 -0000

It can accept parameters like oeqa.runtime.<foldername> and it
will run all test files from that folder.
Also a small fix for detecting ssh_target_log symlink when it
points to a nonexisting file.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runexported.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index d273d2f..c3ce79a 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -49,7 +49,7 @@ class FakeTarget(object):
     def exportStart(self):
         self.sshlog = os.path.join(self.testdir, "ssh_target_log.%s" % self.datetime)
         sshloglink = os.path.join(self.testdir, "ssh_target_log")
-        if os.path.exists(sshloglink):
+        if os.path.lexists(sshloglink):
             os.remove(sshloglink)
         os.symlink(self.sshlog, sshloglink)
         print("SSH log file: %s" %  self.sshlog)
@@ -138,6 +138,12 @@ def main():
         for test in tc.testslist:
             print test
     else:
+        for index, test in enumerate(tc.testslist):
+            if os.path.isdir(os.sep.join(test.split('.'))):
+                del tc.testslist[index]
+                for files in os.listdir(os.sep.join(test.split('.'))):
+                    if (files.endswith(".py")) and not files.startswith("_"):
+                        tc.testslist.insert(index, test+'.'+files.split('.')[0])
         target.exportStart()
         runTests(tc)
 
-- 
2.1.4


