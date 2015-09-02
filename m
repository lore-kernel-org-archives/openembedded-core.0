Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BC2BC77002
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 21:53:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 02 Sep 2015 14:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,456,1437462000"; d="scan'208";a="797003936"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2015 14:53:39 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:44:42 +0000
Message-Id: <1441201482-23565-1-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] qemurunner: Handle lack of data on run serial gracefully
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
X-List-Received-Date: Wed, 02 Sep 2015 21:53:41 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This changes the behavior when data was not received over
the serial console when a command is run. With this the
socket is no longer closed but it throws and exception that
can handled in upper layers. With this the test can continue
without throwing errors for not having the socket anymore.

[YOCTO #8118]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/dump.py       | 12 ++++++++++--
 meta/lib/oeqa/utils/qemurunner.py | 21 ++++++++++++---------
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 6067438..4ae871c 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -12,6 +12,7 @@ def get_host_dumper(d):
 
 
 class BaseDumper(object):
+    """ Base class to dump commands from host/target """
 
     def __init__(self, cmds, parent_dir):
         self.cmds = []
@@ -53,6 +54,7 @@ class BaseDumper(object):
 
 
 class HostDumper(BaseDumper):
+    """ Class to get dumps from the host running the tests """
 
     def __init__(self, cmds, parent_dir):
         super(HostDumper, self).__init__(cmds, parent_dir)
@@ -66,6 +68,7 @@ class HostDumper(BaseDumper):
 
 
 class TargetDumper(BaseDumper):
+    """ Class to get dumps from target, it only works with QemuRunner """
 
     def __init__(self, cmds, parent_dir, qemurunner):
         super(TargetDumper, self).__init__(cmds, parent_dir)
@@ -75,5 +78,10 @@ class TargetDumper(BaseDumper):
         if dump_dir:
             self.dump_dir = dump_dir
         for cmd in self.cmds:
-            (status, output) = self.runner.run_serial(cmd)
-            self._write_dump(cmd.split()[0], output)
+            # We can continue with the testing if serial commands fail
+            try:
+                (status, output) = self.runner.run_serial(cmd)
+                self._write_dump(cmd.split()[0], output)
+            except:
+                print("Tried to dump info from target but "
+                        "serial console failed")
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 4ce5d9c..3ad747a 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -197,13 +197,17 @@ class QemuRunner:
                 self.stop()
                 return False
 
-            (status, output) = self.run_serial("root\n", raw=True)
-            if re.search("root@[a-zA-Z0-9\-]+:~#", output):
-                self.logged = True
-                logger.info("Logged as root in serial console")
-            else:
-                logger.info("Couldn't login into serial console"
-                        " as root using blank password")
+            # If we are not able to login the tests can continue
+            try:
+                (status, output) = self.run_serial("root\n", raw=True)
+                if re.search("root@[a-zA-Z0-9\-]+:~#", output):
+                    self.logged = True
+                    logger.info("Logged as root in serial console")
+                else:
+                    logger.info("Couldn't login into serial console"
+                            " as root using blank password")
+            except:
+                logger.info("Serial console failed while trying to login")
 
         else:
             logger.info("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
@@ -321,8 +325,7 @@ class QemuRunner:
                         stopread = True
                         break
                 else:
-                    sock.close()
-                    stopread = True
+                    raise Exception("No data on serial console socket")
         if data:
             if raw:
                 status = 1
-- 
1.8.4.5


