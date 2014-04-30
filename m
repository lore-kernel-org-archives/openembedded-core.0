Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 330E060144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 12:41:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2014 05:32:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,958,1389772800"; d="scan'208";a="531267830"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.50])
	by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2014 05:32:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 13:32:04 +0100
Message-Id: <e1607f8802ac0a2a5cc1f870e9b5db3f574dd7d4.1398861075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 8/8] oeqa: add proper handling for command errors where needed
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
X-List-Received-Date: Wed, 30 Apr 2014 12:41:43 -0000

For use outside of tests themselves, we want a better error than
AssertionError, so create one and allow us to request it when calling
runCmd(). This enables us to avoid tracebacks during master image
operations if the power control command fails.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/controllers/masterimage.py |  6 +++++-
 meta/lib/oeqa/utils/__init__.py          | 12 ++++++++++++
 meta/lib/oeqa/utils/commands.py          | 10 +++++++---
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index d151e24..f2585d4 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -20,6 +20,7 @@ import subprocess
 import oeqa.targetcontrol
 import oeqa.utils.sshcontrol as sshcontrol
 import oeqa.utils.commands as commands
+from oeqa.utils import CommandError
 
 from abc import ABCMeta, abstractmethod
 
@@ -94,7 +95,10 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget):
     def power_ctl(self, msg):
         if self.powercontrol_cmd:
             cmd = "%s %s" % (self.powercontrol_cmd, msg)
-            commands.runCmd(cmd, preexec_fn=os.setsid, env=self.origenv)
+            try:
+                commands.runCmd(cmd, assert_error=False, preexec_fn=os.setsid, env=self.origenv)
+            except CommandError as e:
+                bb.fatal(str(e))
 
     def power_cycle(self, conn):
         if self.powercontrol_cmd:
diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
index 8eda927..2260046 100644
--- a/meta/lib/oeqa/utils/__init__.py
+++ b/meta/lib/oeqa/utils/__init__.py
@@ -1,3 +1,15 @@
 # Enable other layers to have modules in the same named directory
 from pkgutil import extend_path
 __path__ = extend_path(__path__, __name__)
+
+
+# Borrowed from CalledProcessError
+
+class CommandError(Exception):
+    def __init__(self, retcode, cmd, output = None):
+        self.retcode = retcode
+        self.cmd = cmd
+        self.output = output
+    def __str__(self):
+        return "Command '%s' returned non-zero exit status %d with output: %s" % (self.cmd, self.retcode, self.output)
+
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 9b42620..7637b9d 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -1,4 +1,4 @@
-# Copyright (c) 2013 Intel Corporation
+# Copyright (c) 2013-2014 Intel Corporation
 #
 # Released under the MIT license (see COPYING.MIT)
 
@@ -14,6 +14,7 @@ import signal
 import subprocess
 import threading
 import logging
+from oeqa.utils import CommandError
 
 class Command(object):
     def __init__(self, command, bg=False, timeout=None, data=None, **options):
@@ -84,8 +85,8 @@ class Command(object):
 class Result(object):
     pass
 
-def runCmd(command, ignore_status=False, timeout=None, **options):
 
+def runCmd(command, ignore_status=False, timeout=None, assert_error=True, **options):
     result = Result()
 
     cmd = Command(command, timeout=timeout, **options)
@@ -97,7 +98,10 @@ def runCmd(command, ignore_status=False, timeout=None, **options):
     result.pid = cmd.process.pid
 
     if result.status and not ignore_status:
-        raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, result.output))
+        if assert_error:
+            raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, result.output))
+        else:
+            raise CommandError(result.status, command, result.output)
 
     return result
 
-- 
1.9.0


