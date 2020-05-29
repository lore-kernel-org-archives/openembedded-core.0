Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: kQu5QbpRj4W3fow6BwoBLid/G1jYIAfAfwgEduI4W4ZJp/lQQKmAAmbjk1XVwIYU95LPxs0Gvs
 Z5UYu2swkUHg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:13 -0700
IronPort-SDR: 5HI3WQU9/6kjfo0JcRoO8l+N/MSzcDKsa59i6HQS+cUAn/rmF8lePWNkaV0KU9vkI+kojdm8xL
 P5ptqE/wOxlg==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866116"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:12 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 01/25] oeqa/qemurunner: Clean up failure handling
Date: Fri, 29 May 2020 13:52:37 +0800
Message-Id: <19120fce4f55f6a2903812ed9461273a85cb3544.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If you fail to setup the tap devices, runqemu will error quickly
however stdout/stderr are not shown to the user, instead a SystemExit
traceback is shown. This could explain some long since unexplained
failures on the autobuilder.

Rework the error handling so SystemExit isn't used and the
standard log failure messages can be shown. The code could
likely ultimatley need some restructuring to work effectively.

(From OE-Core rev: 83b8e66b66aa9848ed9c8761a21cb47c6443d0c6)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e820c86fb9ddfadea0c27f29e14b985ee3178320)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 0d63e44ea7..3db177b001 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -35,6 +35,7 @@ class QemuRunner:
 
         # Popen object for runqemu
         self.runqemu = None
+        self.runqemu_exited = False
         # pid of the qemu process that runqemu will start
         self.qemupid = None
         # target ip - from the command line or runqemu output
@@ -102,7 +103,6 @@ class QemuRunner:
                 self.logger.debug("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
                 self.stop()
                 self._dump_host()
-                raise SystemExit
 
     def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams='', launch_cmd=None, discard_writes=True):
         env = os.environ.copy()
@@ -206,6 +206,8 @@ class QemuRunner:
         endtime = time.time() + self.runqemutime
         while not self.is_alive() and time.time() < endtime:
             if self.runqemu.poll():
+                if self.runqemu_exited:
+                    return False
                 if self.runqemu.returncode:
                     # No point waiting any longer
                     self.logger.warning('runqemu exited with code %d' % self.runqemu.returncode)
@@ -215,6 +217,9 @@ class QemuRunner:
                     return False
             time.sleep(0.5)
 
+        if self.runqemu_exited:
+            return False
+
         if not self.is_alive():
             self.logger.error("Qemu pid didn't appear in %s seconds (%s)" %
                               (self.runqemutime, time.strftime("%D %H:%M:%S")))
@@ -385,7 +390,7 @@ class QemuRunner:
                 os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
             self.runqemu.stdin.close()
             self.runqemu.stdout.close()
-            self.runqemu = None
+            self.runqemu_exited = True
 
         if hasattr(self, 'server_socket') and self.server_socket:
             self.server_socket.close()
@@ -425,7 +430,7 @@ class QemuRunner:
         return False
 
     def is_alive(self):
-        if not self.runqemu or self.runqemu.poll() is not None:
+        if not self.runqemu or self.runqemu.poll() is not None or self.runqemu_exited:
             return False
         if os.path.isfile(self.qemu_pidfile):
             # when handling pidfile, qemu creates the file, stat it, lock it and then write to it
-- 
2.25.4

