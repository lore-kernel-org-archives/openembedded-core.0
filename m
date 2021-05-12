Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4074.1620808565759951992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: JRzzKKW8N67pmCLI/flcl8cTln9WCh92/M/VlR63/IH725oUN8BoHBlEbPHEmkWHp3HgFwWW0+
 1AURlO7V+U9w==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179917779"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179917779"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:03 -0700
IronPort-SDR: cYo3333jwgAcIdyv0qM0fO3NUMqNu7w/4NkesWr/fzhXyfTHJZiBkut8wxE6PX1LMX+E8cHlm5
 Ic5Dx5QJeDmQ==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="430645726"
Received: from tmustofa-mobl1.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.122])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:02 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/15] oeqa/qemurunner: Improve logging thread exit handling for qemu shutdown test
Date: Wed, 12 May 2021 16:35:34 +0800
Message-Id: <7f931dce4484a2740b419b2d25830fc453748a0c.1620808329.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620808329.git.anuj.mittal@intel.com>
References: <cover.1620808329.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Rather than totally disabling the logging, inform it we're about to exit
so we can log messages over the exit cleanly too. This aids debugging. It
also avoids a race where the logging handler could still error whilst
shutting down.

Also remove a race window by notificing the handler of the shutdown
first, before triggering it. This removes a race window I watched in
local testing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0e19f31a1005f94105e1cef252abfffcef2aafad)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/runqemu.py |  9 ++++-----
 meta/lib/oeqa/utils/qemurunner.py       | 12 +++++++++++-
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 7e676bcb41..da22f77b27 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -163,12 +163,11 @@ class QemuTest(OESelftestTestCase):
         bitbake(cls.recipe)
 
     def _start_qemu_shutdown_check_if_shutdown_succeeded(self, qemu, timeout):
+        # Allow the runner's LoggingThread instance to exit without errors
+        # (such as the exception "Console connection closed unexpectedly")
+        # as qemu will disappear when we shut it down
+        qemu.runner.allowexit()
         qemu.run_serial("shutdown -h now")
-        # Stop thread will stop the LoggingThread instance used for logging
-        # qemu through serial console, stop thread will prevent this code
-        # from facing exception (Console connection closed unexpectedly)
-        # when qemu was shutdown by the above shutdown command
-        qemu.runner.stop_thread()
         time_track = 0
         try:
             while True:
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 278904ba0b..84f7c5e76d 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -471,6 +471,10 @@ class QemuRunner:
             self.thread.stop()
             self.thread.join()
 
+    def allowexit(self):
+        if self.thread:
+            self.thread.allowexit()
+
     def restart(self, qemuparams = None):
         self.logger.warning("Restarting qemu process")
         if self.runqemu.poll() is None:
@@ -564,6 +568,7 @@ class LoggingThread(threading.Thread):
         self.logger = logger
         self.readsock = None
         self.running = False
+        self.canexit = False
 
         self.errorevents = select.POLLERR | select.POLLHUP | select.POLLNVAL
         self.readevents = select.POLLIN | select.POLLPRI
@@ -597,6 +602,9 @@ class LoggingThread(threading.Thread):
         self.close_ignore_error(self.writepipe)
         self.running = False
 
+    def allowexit(self):
+        self.canexit = True
+
     def eventloop(self):
         poll = select.poll()
         event_read_mask = self.errorevents | self.readevents
@@ -653,7 +661,9 @@ class LoggingThread(threading.Thread):
             # happened. But for this code it counts as an
             # error since the connection shouldn't go away
             # until qemu exits.
-            raise Exception("Console connection closed unexpectedly")
+            if not self.canexit:
+                raise Exception("Console connection closed unexpectedly")
+            return ''
 
         return data
 
-- 
2.31.1

