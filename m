Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C19486F2A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 15:46:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Feb 2014 07:41:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,555,1389772800"; d="scan'208";a="463497365"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2014 07:46:09 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 6141B6A4087;
	Thu, 27 Feb 2014 07:45:58 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2014 17:46:15 +0200
Message-Id: <1393515975-1069-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] oeqa/targetcontrol: make BaseTarget an abstract class
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
X-List-Received-Date: Thu, 27 Feb 2014 15:46:13 -0000

This should make it clear what methods a subclass
needs to redefine.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/targetcontrol.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 46e5f7f..d8a6ac0 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -12,6 +12,7 @@ import traceback
 from oeqa.utils.sshcontrol import SSHControl
 from oeqa.utils.qemurunner import QemuRunner
 from oeqa.controllers.testtargetloader import TestTargetLoader
+from abc import ABCMeta, abstractmethod
 
 def get_target_controller(d):
     testtarget = d.getVar("TEST_TARGET", True)
@@ -40,6 +41,8 @@ def get_target_controller(d):
 
 class BaseTarget(object):
 
+    __metaclass__ = ABCMeta
+
     def __init__(self, d):
         self.connection = None
         self.ip = None
@@ -48,6 +51,7 @@ class BaseTarget(object):
         self.testdir = d.getVar("TEST_LOG_DIR", True)
         self.pn = d.getVar("PN", True)
 
+    @abstractmethod
     def deploy(self):
 
         self.sshlog = os.path.join(self.testdir, "ssh_target_log.%s" % self.datetime)
@@ -57,6 +61,18 @@ class BaseTarget(object):
         os.symlink(self.sshlog, sshloglink)
         bb.note("SSH log file: %s" %  self.sshlog)
 
+    @abstractmethod
+    def start(self, params=None):
+        pass
+
+    @abstractmethod
+    def stop(self):
+        pass
+
+    @abstractmethod
+    def restart(self, params=None):
+        pass
+
     def run(self, cmd, timeout=None):
         return self.connection.run(cmd, timeout)
 
-- 
1.8.5.3


