Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A091F76FC9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 15:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t84Fxqxg008044 for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Sep 2015 16:59:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BAMJBV37HIYq
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 16:59:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t84FxcA7008027
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Sep 2015 16:59:50 +0100
Message-ID: <1441382378.24871.180.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Sep 2015 16:59:38 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] oeqa: Test failure/cleanup improvements
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
X-List-Received-Date: Fri, 04 Sep 2015 15:59:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, if qemu segfaults, the tests merrily continue trying to execute
which takes time for them to timeout and is a bit silly. Worse, no logs about
the segfault are shown to the user, its silent!

This patch tries to unravel the tangled web of issues and ensures that we:

* install a SIGCHLD handler which tells the user qemu exited
* check if qemu is running, if it isn't fail the test outright
* don't leave processes behind in sshcontrol which would hold
  bitbake.lock and block shutdown

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 9724325..ff62c30 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -144,6 +144,9 @@ class oeRuntimeTest(oeTest):
         self.target = oeRuntimeTest.tc.target
         super(oeRuntimeTest, self).__init__(methodName)
 
+    def setUp(self):
+        self.assertTrue(self.target.check(), msg = "Qemu not running?")
+
     def tearDown(self):
         # If a test fails or there is an exception
         if not exc_info() == (None, None, None):
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 542e259..edc0d01 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -188,6 +188,9 @@ class QemuTarget(BaseTarget):
                     bb.error("Qemu log output from %s:\n%s" % (self.qemulog, f.read()))
             raise bb.build.FuncFailed("%s - FAILED to start qemu - check the task log and the boot log" % self.pn)
 
+    def check(self):
+        return self.runner.is_alive()
+
     def stop(self):
         self.runner.stop()
         self.connection = None
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 3ad747a..c04ee0d 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -64,6 +64,22 @@ class QemuRunner:
             with open(self.logfile, "a") as f:
                 f.write("%s" % msg)
 
+    def getOutput(self, o):
+        import fcntl
+        fl = fcntl.fcntl(o, fcntl.F_GETFL)
+        fcntl.fcntl(o, fcntl.F_SETFL, fl | os.O_NONBLOCK)
+        return os.read(o.fileno(), 1000000)
+
+
+    def handleSIGCHLD(self, signum, frame):
+        if self.runqemu and self.runqemu.poll():
+            if self.runqemu.returncode:
+                logger.info('runqemu exited with code %d' % self.runqemu.returncode)
+                logger.info("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
+                self.stop()
+                self._dump_host()
+                raise SystemExit
+
     def start(self, qemuparams = None):
         if self.display:
             os.environ["DISPLAY"] = self.display
@@ -98,11 +114,8 @@ class QemuRunner:
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
-        def getOutput(o):
-            import fcntl
-            fl = fcntl.fcntl(o, fcntl.F_GETFL)
-            fcntl.fcntl(o, fcntl.F_SETFL, fl | os.O_NONBLOCK)
-            return os.read(o.fileno(), 1000000)
+        self.origchldhandler = signal.getsignal(signal.SIGCHLD)
+        signal.signal(signal.SIGCHLD, self.handleSIGCHLD)
 
         launch_cmd = 'runqemu tcpserial=%s %s %s %s' % (self.serverport, self.machine, self.rootfs, self.qemuparams)
         # FIXME: We pass in stdin=subprocess.PIPE here to work around stty
@@ -122,7 +135,7 @@ class QemuRunner:
                     logger.info('runqemu exited with code %d' % self.runqemu.returncode)
                     self._dump_host()
                     self.stop()
-                    logger.info("Output from runqemu:\n%s" % getOutput(output))
+                    logger.info("Output from runqemu:\n%s" % self.getOutput(output))
                     return False
             time.sleep(1)
 
@@ -139,7 +152,7 @@ class QemuRunner:
                     self.ip = ips[0]
                     self.server_ip = ips[1]
             except IndexError, ValueError:
-                logger.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used:\n%s\nand output from runqemu:\n%s" % (cmdline, getOutput(output)))
+                logger.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used:\n%s\nand output from runqemu:\n%s" % (cmdline, self.getOutput(output)))
                 self._dump_host()
                 self.stop()
                 return False
@@ -154,7 +167,7 @@ class QemuRunner:
                 logger.error("Didn't receive a console connection from qemu. "
                              "Here is the qemu command line used:\n%s\nand "
                              "output from runqemu:\n%s" % (cmdline,
-                                                           getOutput(output)))
+                                                           self.getOutput(output)))
                 self.stop_thread()
                 return False
 
@@ -213,7 +226,7 @@ class QemuRunner:
             logger.info("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
             self._dump_host()
             self.stop()
-            logger.info("Output from runqemu:\n%s" % getOutput(output))
+            logger.info("Output from runqemu:\n%s" % self.getOutput(output))
             return False
 
         return self.is_alive()
@@ -240,6 +253,7 @@ class QemuRunner:
             self.server_socket = None
         self.qemupid = None
         self.ip = None
+        signal.signal(signal.SIGCHLD, self.origchldhandler)
 
     def stop_thread(self):
         if self.thread and self.thread.is_alive():
@@ -255,6 +269,8 @@ class QemuRunner:
         return False
 
     def is_alive(self):
+        if not self.runqemu:
+            return False
         qemu_child = self.find_child(str(self.runqemu.pid))
         if qemu_child:
             self.qemupid = qemu_child[0]
diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 6ed48ba..00f5051 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -42,7 +42,7 @@ class SSHProcess(object):
             with open(self.logfile, "a") as f:
                f.write("%s" % msg)
 
-    def run(self, command, timeout=None, logfile=None):
+    def _run(self, command, timeout=None, logfile=None):
         self.logfile = logfile
         self.starttime = time.time()
         output = ''
@@ -79,8 +79,18 @@ class SSHProcess(object):
 
         self.status = self.process.wait()
         self.output = output.rstrip()
-        return (self.status, self.output)
 
+    def run(self, command, timeout=None, logfile=None):
+        try:
+            self._run(command, timeout, logfile)
+        except:
+            # Need to guard against a SystemExit or other exception occuring whilst running
+            # and ensure we don't leave a process behind.
+            if self.process.poll() is None:
+                self.process.kill()
+                self.status = self.process.wait()
+            raise
+        return (self.status, self.output)
 
 class SSHControl(object):
     def __init__(self, ip, logfile=None, timeout=300, user='root', port=None):



