Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 498676007A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 10:46:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v87Akqje002452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 7 Sep 2017 11:46:53 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dpuKi-0000BZ-D6; Thu, 07 Sep 2017 11:46:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Sep 2017 11:46:51 +0100
Message-Id: <1504781211-675-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] oeqa/qemurunner: Improve logging
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
X-List-Received-Date: Thu, 07 Sep 2017 10:46:54 -0000

Python unittest intercepts stdout and stderr however qemurunner sets
up a streamhandler before that interception occurs, hence the messages
spam the unittest output.

By moving the logging init to the class init time, we use the unittest
stdout/stderr and this means unittest can only show the log output upon
failure. This cleans up the selftest and testimage output whilst still
showing logging upon failure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 90 +++++++++++++++++++--------------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 54312fb..6ee52a2 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -17,11 +17,8 @@ import errno
 import string
 import threading
 import codecs
-from oeqa.utils.dump import HostDumper
-
 import logging
-logger = logging.getLogger("BitBake.QemuRunner")
-logger.addHandler(logging.StreamHandler())
+from oeqa.utils.dump import HostDumper
 
 # Get Unicode non printable control chars
 control_range = list(range(0,32))+list(range(127,160))
@@ -58,6 +55,9 @@ class QemuRunner:
         self.runqemutime = 120
         self.host_dumper = HostDumper(dump_host_cmds, dump_dir)
 
+        self.logger = logging.getLogger("BitBake.QemuRunner")
+        self.logger.addHandler(logging.StreamHandler(sys.stdout))
+
     def create_socket(self):
         try:
             sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
@@ -65,7 +65,7 @@ class QemuRunner:
             sock.bind(("127.0.0.1",0))
             sock.listen(2)
             port = sock.getsockname()[1]
-            logger.info("Created listening socket for qemu serial console on: 127.0.0.1:%s" % port)
+            self.logger.info("Created listening socket for qemu serial console on: 127.0.0.1:%s" % port)
             return (sock, port)
 
         except socket.error:
@@ -91,8 +91,8 @@ class QemuRunner:
     def handleSIGCHLD(self, signum, frame):
         if self.runqemu and self.runqemu.poll():
             if self.runqemu.returncode:
-                logger.info('runqemu exited with code %d' % self.runqemu.returncode)
-                logger.info("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
+                self.logger.info('runqemu exited with code %d' % self.runqemu.returncode)
+                self.logger.info("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
                 self.stop()
                 self._dump_host()
                 raise SystemExit
@@ -105,15 +105,15 @@ class QemuRunner:
             # interact badly with screensavers.
             env["QEMU_DONT_GRAB"] = "1"
         if not os.path.exists(self.rootfs):
-            logger.error("Invalid rootfs %s" % self.rootfs)
+            self.logger.error("Invalid rootfs %s" % self.rootfs)
             return False
         if not os.path.exists(self.tmpdir):
-            logger.error("Invalid TMPDIR path %s" % self.tmpdir)
+            self.logger.error("Invalid TMPDIR path %s" % self.tmpdir)
             return False
         else:
             env["OE_TMPDIR"] = self.tmpdir
         if not os.path.exists(self.deploy_dir_image):
-            logger.error("Invalid DEPLOY_DIR_IMAGE path %s" % self.deploy_dir_image)
+            self.logger.error("Invalid DEPLOY_DIR_IMAGE path %s" % self.deploy_dir_image)
             return False
         else:
             env["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
@@ -121,10 +121,10 @@ class QemuRunner:
         if not launch_cmd:
             launch_cmd = 'runqemu %s %s ' % ('snapshot' if discard_writes else '', runqemuparams)
             if self.use_kvm:
-                logger.info('Using kvm for runqemu')
+                self.logger.info('Using kvm for runqemu')
                 launch_cmd += ' kvm'
             else:
-                logger.info('Not using kvm for runqemu')
+                self.logger.info('Not using kvm for runqemu')
             if not self.display:
                 launch_cmd += ' nographic'
             launch_cmd += ' %s %s' % (self.machine, self.rootfs)
@@ -136,7 +136,7 @@ class QemuRunner:
             threadsock, threadport = self.create_socket()
             self.server_socket, self.serverport = self.create_socket()
         except socket.error as msg:
-            logger.error("Failed to create listening socket: %s" % msg[1])
+            self.logger.error("Failed to create listening socket: %s" % msg[1])
             return False
 
         bootparams = 'console=tty1 console=ttyS0,115200n8 printk.time=1'
@@ -152,7 +152,7 @@ class QemuRunner:
         self.origchldhandler = signal.getsignal(signal.SIGCHLD)
         signal.signal(signal.SIGCHLD, self.handleSIGCHLD)
 
-        logger.info('launchcmd=%s'%(launch_cmd))
+        self.logger.info('launchcmd=%s'%(launch_cmd))
 
         # FIXME: We pass in stdin=subprocess.PIPE here to work around stty
         # blocking at the end of the runqemu script when using this within
@@ -187,24 +187,24 @@ class QemuRunner:
             os.killpg(os.getpgid(self.runqemu.pid), signal.SIGTERM)
             sys.exit(0)
 
-        logger.info("runqemu started, pid is %s" % self.runqemu.pid)
-        logger.info("waiting at most %s seconds for qemu pid" % self.runqemutime)
+        self.logger.info("runqemu started, pid is %s" % self.runqemu.pid)
+        self.logger.info("waiting at most %s seconds for qemu pid" % self.runqemutime)
         endtime = time.time() + self.runqemutime
         while not self.is_alive() and time.time() < endtime:
             if self.runqemu.poll():
                 if self.runqemu.returncode:
                     # No point waiting any longer
-                    logger.info('runqemu exited with code %d' % self.runqemu.returncode)
+                    self.logger.info('runqemu exited with code %d' % self.runqemu.returncode)
                     self._dump_host()
                     self.stop()
-                    logger.info("Output from runqemu:\n%s" % self.getOutput(output))
+                    self.logger.info("Output from runqemu:\n%s" % self.getOutput(output))
                     return False
             time.sleep(1)
 
         out = self.getOutput(output)
         netconf = False # network configuration is not required by default
         if self.is_alive():
-            logger.info("qemu started in %s seconds - qemu procces pid is %s" % (time.time() - (endtime - self.runqemutime), self.qemupid))
+            self.logger.info("qemu started in %s seconds - qemu procces pid is %s" % (time.time() - (endtime - self.runqemutime), self.qemupid))
             if get_ip:
                 cmdline = ''
                 with open('/proc/%s/cmdline' % self.qemupid) as p:
@@ -216,7 +216,7 @@ class QemuRunner:
                     ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
                     self.ip = ips[0]
                     self.server_ip = ips[1]
-                    logger.info("qemu cmdline used:\n{}".format(cmdline))
+                    self.logger.info("qemu cmdline used:\n{}".format(cmdline))
                 except (IndexError, ValueError):
                     # Try to get network configuration from runqemu output
                     match = re.match('.*Network configuration: ([0-9.]+)::([0-9.]+):([0-9.]+)$.*',
@@ -228,27 +228,27 @@ class QemuRunner:
                         # and guest networking is not configured
                         netconf = True
                     else:
-                        logger.error("Couldn't get ip from qemu command line and runqemu output! "
+                        self.logger.error("Couldn't get ip from qemu command line and runqemu output! "
                                      "Here is the qemu command line used:\n%s\n"
                                      "and output from runqemu:\n%s" % (cmdline, out))
                         self._dump_host()
                         self.stop()
                         return False
 
-                logger.info("Target IP: %s" % self.ip)
-                logger.info("Server IP: %s" % self.server_ip)
+                self.logger.info("Target IP: %s" % self.ip)
+                self.logger.info("Server IP: %s" % self.server_ip)
 
-            self.thread = LoggingThread(self.log, threadsock, logger)
+            self.thread = LoggingThread(self.log, threadsock, self.logger)
             self.thread.start()
             if not self.thread.connection_established.wait(self.boottime):
-                logger.error("Didn't receive a console connection from qemu. "
+                self.logger.error("Didn't receive a console connection from qemu. "
                              "Here is the qemu command line used:\n%s\nand "
                              "output from runqemu:\n%s" % (cmdline, out))
                 self.stop_thread()
                 return False
 
-            logger.info("Output from runqemu:\n%s", out)
-            logger.info("Waiting at most %d seconds for login banner" % self.boottime)
+            self.logger.info("Output from runqemu:\n%s", out)
+            self.logger.info("Waiting at most %d seconds for login banner" % self.boottime)
             endtime = time.time() + self.boottime
             socklist = [self.server_socket]
             reachedlogin = False
@@ -267,7 +267,7 @@ class QemuRunner:
                         qemusock.setblocking(0)
                         socklist.append(qemusock)
                         socklist.remove(self.server_socket)
-                        logger.info("Connection from %s:%s" % addr)
+                        self.logger.info("Connection from %s:%s" % addr)
                     else:
                         data = data + sock.recv(1024)
                         if data:
@@ -279,7 +279,7 @@ class QemuRunner:
                                     self.server_socket = qemusock
                                     stopread = True
                                     reachedlogin = True
-                                    logger.info("Reached login banner")
+                                    self.logger.info("Reached login banner")
                             except UnicodeDecodeError:
                                 continue
                         else:
@@ -288,10 +288,10 @@ class QemuRunner:
                             stopread = True
 
             if not reachedlogin:
-                logger.info("Target didn't reached login boot in %d seconds" % self.boottime)
+                self.logger.info("Target didn't reached login boot in %d seconds" % self.boottime)
                 lines = "\n".join(bootlog.splitlines()[-25:])
-                logger.info("Last 25 lines of text:\n%s" % lines)
-                logger.info("Check full boot log: %s" % self.logfile)
+                self.logger.info("Last 25 lines of text:\n%s" % lines)
+                self.logger.info("Check full boot log: %s" % self.logfile)
                 self._dump_host()
                 self.stop()
                 return False
@@ -301,30 +301,30 @@ class QemuRunner:
                 (status, output) = self.run_serial("root\n", raw=True)
                 if re.search("root@[a-zA-Z0-9\-]+:~#", output):
                     self.logged = True
-                    logger.info("Logged as root in serial console")
+                    self.logger.info("Logged as root in serial console")
                     if netconf:
                         # configure guest networking
                         cmd = "ifconfig eth0 %s netmask %s up\n" % (self.ip, self.netmask)
                         output = self.run_serial(cmd, raw=True)[1]
                         if re.search("root@[a-zA-Z0-9\-]+:~#", output):
-                            logger.info("configured ip address %s", self.ip)
+                            self.logger.info("configured ip address %s", self.ip)
                         else:
-                            logger.info("Couldn't configure guest networking")
+                            self.logger.info("Couldn't configure guest networking")
                 else:
-                    logger.info("Couldn't login into serial console"
+                    self.logger.info("Couldn't login into serial console"
                             " as root using blank password")
             except:
-                logger.info("Serial console failed while trying to login")
+                self.logger.info("Serial console failed while trying to login")
 
         else:
-            logger.error("Qemu pid didn't appear in %s seconds" % self.runqemutime)
+            self.logger.error("Qemu pid didn't appear in %s seconds" % self.runqemutime)
             self._dump_host()
             self.stop()
             op = self.getOutput(output)
             if op:
-                logger.error("Output from runqemu:\n%s" % op)
+                self.logger.error("Output from runqemu:\n%s" % op)
             else:
-                logger.error("No output from runqemu.\n")
+                self.logger.error("No output from runqemu.\n")
             return False
 
         return self.is_alive()
@@ -337,7 +337,7 @@ class QemuRunner:
         if self.runqemu:
             if hasattr(self, "monitorpid"):
                 os.kill(self.monitorpid, signal.SIGKILL)
-                logger.info("Sending SIGTERM to runqemu")
+                self.logger.info("Sending SIGTERM to runqemu")
                 try:
                     os.killpg(os.getpgid(self.runqemu.pid), signal.SIGTERM)
                 except OSError as e:
@@ -347,7 +347,7 @@ class QemuRunner:
             while self.runqemu.poll() is None and time.time() < endtime:
                 time.sleep(1)
             if self.runqemu.poll() is None:
-                logger.info("Sending SIGKILL to runqemu")
+                self.logger.info("Sending SIGKILL to runqemu")
                 os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
             self.runqemu = None
         if hasattr(self, 'server_socket') and self.server_socket:
@@ -362,7 +362,7 @@ class QemuRunner:
                 # qemu-system behaves well and a SIGTERM is enough
                 os.kill(self.qemupid, signal.SIGTERM)
             except ProcessLookupError as e:
-                logger.warn('qemu-system ended unexpectedly')
+                self.logger.warn('qemu-system ended unexpectedly')
 
     def stop_thread(self):
         if self.thread and self.thread.is_alive():
@@ -370,7 +370,7 @@ class QemuRunner:
             self.thread.join()
 
     def restart(self, qemuparams = None):
-        logger.info("Restarting qemu process")
+        self.logger.info("Restarting qemu process")
         if self.runqemu.poll() is None:
             self.stop()
         if self.start(qemuparams):
@@ -479,7 +479,7 @@ class QemuRunner:
 
     def _dump_host(self):
         self.host_dumper.create_dir("qemu")
-        logger.warn("Qemu ended unexpectedly, dump data from host"
+        self.logger.warn("Qemu ended unexpectedly, dump data from host"
                 " is in %s" % self.host_dumper.dump_dir)
         self.host_dumper.dump_host()
 
-- 
2.7.4


