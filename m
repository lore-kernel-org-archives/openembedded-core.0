Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5FDD660938
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 11:55:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vA9BtqtN007427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 9 Nov 2017 11:55:53 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eClR2-00030j-HX; Thu, 09 Nov 2017 11:55:52 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 11:55:48 +0000
Message-Id: <1510228551-11516-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510228551-11516-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1510228551-11516-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 4/7] oeqa/qemurunner: Use logger.debug, not logger.info
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
X-List-Received-Date: Thu, 09 Nov 2017 11:55:55 -0000

Bitbake logs info messages to the console. These messages are really
there as debugging information. At the debug level, they will be shown
in failure logs and in the task logs but not on the console which
is what we want in this case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 74 +++++++++++++++++++--------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index aa2600b..3214887 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -68,7 +68,7 @@ class QemuRunner:
             sock.bind(("127.0.0.1",0))
             sock.listen(2)
             port = sock.getsockname()[1]
-            self.logger.info("Created listening socket for qemu serial console on: 127.0.0.1:%s" % port)
+            self.logger.debug("Created listening socket for qemu serial console on: 127.0.0.1:%s" % port)
             return (sock, port)
 
         except socket.error:
@@ -95,8 +95,8 @@ class QemuRunner:
     def handleSIGCHLD(self, signum, frame):
         if self.runqemu and self.runqemu.poll():
             if self.runqemu.returncode:
-                self.logger.info('runqemu exited with code %d' % self.runqemu.returncode)
-                self.logger.info("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
+                self.logger.debug('runqemu exited with code %d' % self.runqemu.returncode)
+                self.logger.debug("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
                 self.stop()
                 self._dump_host()
                 raise SystemExit
@@ -125,10 +125,10 @@ class QemuRunner:
         if not launch_cmd:
             launch_cmd = 'runqemu %s %s ' % ('snapshot' if discard_writes else '', runqemuparams)
             if self.use_kvm:
-                self.logger.info('Using kvm for runqemu')
+                self.logger.debug('Using kvm for runqemu')
                 launch_cmd += ' kvm'
             else:
-                self.logger.info('Not using kvm for runqemu')
+                self.logger.debug('Not using kvm for runqemu')
             if not self.display:
                 launch_cmd += ' nographic'
             launch_cmd += ' %s %s' % (self.machine, self.rootfs)
@@ -160,7 +160,7 @@ class QemuRunner:
         self.origchldhandler = signal.getsignal(signal.SIGCHLD)
         signal.signal(signal.SIGCHLD, self.handleSIGCHLD)
 
-        self.logger.info('launchcmd=%s'%(launch_cmd))
+        self.logger.debug('launchcmd=%s'%(launch_cmd))
 
         # FIXME: We pass in stdin=subprocess.PIPE here to work around stty
         # blocking at the end of the runqemu script when using this within
@@ -195,17 +195,17 @@ class QemuRunner:
             os.killpg(os.getpgid(self.runqemu.pid), signal.SIGTERM)
             sys.exit(0)
 
-        self.logger.info("runqemu started, pid is %s" % self.runqemu.pid)
-        self.logger.info("waiting at most %s seconds for qemu pid" % self.runqemutime)
+        self.logger.debug("runqemu started, pid is %s" % self.runqemu.pid)
+        self.logger.debug("waiting at most %s seconds for qemu pid" % self.runqemutime)
         endtime = time.time() + self.runqemutime
         while not self.is_alive() and time.time() < endtime:
             if self.runqemu.poll():
                 if self.runqemu.returncode:
                     # No point waiting any longer
-                    self.logger.info('runqemu exited with code %d' % self.runqemu.returncode)
+                    self.logger.debug('runqemu exited with code %d' % self.runqemu.returncode)
                     self._dump_host()
                     self.stop()
-                    self.logger.info("Output from runqemu:\n%s" % self.getOutput(output))
+                    self.logger.debug("Output from runqemu:\n%s" % self.getOutput(output))
                     return False
             time.sleep(0.5)
 
@@ -214,7 +214,7 @@ class QemuRunner:
             # Dump all processes to help us to figure out what is going on...
             ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,command '], stdout=subprocess.PIPE).communicate()[0]
             processes = ps.decode("utf-8")
-            self.logger.info("Running processes:\n%s" % processes)
+            self.logger.debug("Running processes:\n%s" % processes)
             self._dump_host()
             self.stop()
             op = self.getOutput(output)
@@ -227,7 +227,7 @@ class QemuRunner:
         # We are alive: qemu is running
         out = self.getOutput(output)
         netconf = False # network configuration is not required by default
-        self.logger.info("qemu started in %s seconds - qemu procces pid is %s" % (time.time() - (endtime - self.runqemutime), self.qemupid))
+        self.logger.debug("qemu started in %s seconds - qemu procces pid is %s" % (time.time() - (endtime - self.runqemutime), self.qemupid))
         if get_ip:
             cmdline = ''
             with open('/proc/%s/cmdline' % self.qemupid) as p:
@@ -239,7 +239,7 @@ class QemuRunner:
                 ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
                 self.ip = ips[0]
                 self.server_ip = ips[1]
-                self.logger.info("qemu cmdline used:\n{}".format(cmdline))
+                self.logger.debug("qemu cmdline used:\n{}".format(cmdline))
             except (IndexError, ValueError):
                 # Try to get network configuration from runqemu output
                 match = re.match('.*Network configuration: ([0-9.]+)::([0-9.]+):([0-9.]+)$.*',
@@ -258,8 +258,8 @@ class QemuRunner:
                     self.stop()
                     return False
 
-        self.logger.info("Target IP: %s" % self.ip)
-        self.logger.info("Server IP: %s" % self.server_ip)
+        self.logger.debug("Target IP: %s" % self.ip)
+        self.logger.debug("Server IP: %s" % self.server_ip)
 
         self.thread = LoggingThread(self.log, threadsock, self.logger)
         self.thread.start()
@@ -270,8 +270,8 @@ class QemuRunner:
             self.stop_thread()
             return False
 
-        self.logger.info("Output from runqemu:\n%s", out)
-        self.logger.info("Waiting at most %d seconds for login banner" % self.boottime)
+        self.logger.debug("Output from runqemu:\n%s", out)
+        self.logger.debug("Waiting at most %d seconds for login banner" % self.boottime)
         endtime = time.time() + self.boottime
         socklist = [self.server_socket]
         reachedlogin = False
@@ -290,7 +290,7 @@ class QemuRunner:
                     qemusock.setblocking(0)
                     socklist.append(qemusock)
                     socklist.remove(self.server_socket)
-                    self.logger.info("Connection from %s:%s" % addr)
+                    self.logger.debug("Connection from %s:%s" % addr)
                 else:
                     data = data + sock.recv(1024)
                     if data:
@@ -302,7 +302,7 @@ class QemuRunner:
                                 self.server_socket = qemusock
                                 stopread = True
                                 reachedlogin = True
-                                self.logger.info("Reached login banner")
+                                self.logger.debug("Reached login banner")
                         except UnicodeDecodeError:
                             continue
                     else:
@@ -312,12 +312,12 @@ class QemuRunner:
 
 
         if not reachedlogin:
-            self.logger.info("Target didn't reached login boot in %d seconds" % self.boottime)
+            self.logger.debug("Target didn't reached login boot in %d seconds" % self.boottime)
             tail = lambda l: "\n".join(l.splitlines()[-25:])
             # in case bootlog is empty, use tail qemu log store at self.msg
             lines = tail(bootlog if bootlog else self.msg)
-            self.logger.info("Last 25 lines of text:\n%s" % lines)
-            self.logger.info("Check full boot log: %s" % self.logfile)
+            self.logger.debug("Last 25 lines of text:\n%s" % lines)
+            self.logger.debug("Check full boot log: %s" % self.logfile)
             self._dump_host()
             self.stop()
             return False
@@ -327,20 +327,20 @@ class QemuRunner:
             (status, output) = self.run_serial("root\n", raw=True)
             if re.search("root@[a-zA-Z0-9\-]+:~#", output):
                 self.logged = True
-                self.logger.info("Logged as root in serial console")
+                self.logger.debug("Logged as root in serial console")
                 if netconf:
                     # configure guest networking
                     cmd = "ifconfig eth0 %s netmask %s up\n" % (self.ip, self.netmask)
                     output = self.run_serial(cmd, raw=True)[1]
                     if re.search("root@[a-zA-Z0-9\-]+:~#", output):
-                        self.logger.info("configured ip address %s", self.ip)
+                        self.logger.debug("configured ip address %s", self.ip)
                     else:
-                        self.logger.info("Couldn't configure guest networking")
+                        self.logger.debug("Couldn't configure guest networking")
             else:
-                self.logger.info("Couldn't login into serial console"
+                self.logger.debug("Couldn't login into serial console"
                             " as root using blank password")
         except:
-            self.logger.info("Serial console failed while trying to login")
+            self.logger.debug("Serial console failed while trying to login")
         return True
 
     def stop(self):
@@ -351,7 +351,7 @@ class QemuRunner:
         if self.runqemu:
             if hasattr(self, "monitorpid"):
                 os.kill(self.monitorpid, signal.SIGKILL)
-                self.logger.info("Sending SIGTERM to runqemu")
+                self.logger.debug("Sending SIGTERM to runqemu")
                 try:
                     os.killpg(os.getpgid(self.runqemu.pid), signal.SIGTERM)
                 except OSError as e:
@@ -361,7 +361,7 @@ class QemuRunner:
             while self.runqemu.poll() is None and time.time() < endtime:
                 time.sleep(1)
             if self.runqemu.poll() is None:
-                self.logger.info("Sending SIGKILL to runqemu")
+                self.logger.debug("Sending SIGKILL to runqemu")
                 os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
             self.runqemu = None
         if hasattr(self, 'server_socket') and self.server_socket:
@@ -387,7 +387,7 @@ class QemuRunner:
             self.thread.join()
 
     def restart(self, qemuparams = None):
-        self.logger.info("Restarting qemu process")
+        self.logger.debug("Restarting qemu process")
         if self.runqemu.poll() is None:
             self.stop()
         if self.start(qemuparams):
@@ -485,17 +485,17 @@ class LoggingThread(threading.Thread):
             self.teardown()
 
     def run(self):
-        self.logger.info("Starting logging thread")
+        self.logger.debug("Starting logging thread")
         self.readpipe, self.writepipe = os.pipe()
         threading.Thread.run(self)
 
     def stop(self):
-        self.logger.info("Stopping logging thread")
+        self.logger.debug("Stopping logging thread")
         if self.running:
             os.write(self.writepipe, bytes("stop", "utf-8"))
 
     def teardown(self):
-        self.logger.info("Tearing down logging thread")
+        self.logger.debug("Tearing down logging thread")
         self.close_socket(self.serversock)
 
         if self.readsock is not None:
@@ -513,7 +513,7 @@ class LoggingThread(threading.Thread):
 
         breakout = False
         self.running = True
-        self.logger.info("Starting thread event loop")
+        self.logger.debug("Starting thread event loop")
         while not breakout:
             events = poll.poll()
             for event in events:
@@ -523,19 +523,19 @@ class LoggingThread(threading.Thread):
 
                 # Event to stop the thread
                 if self.readpipe == event[0]:
-                    self.logger.info("Stop event received")
+                    self.logger.debug("Stop event received")
                     breakout = True
                     break
 
                 # A connection request was received
                 elif self.serversock.fileno() == event[0]:
-                    self.logger.info("Connection request received")
+                    self.logger.debug("Connection request received")
                     self.readsock, _ = self.serversock.accept()
                     self.readsock.setblocking(0)
                     poll.unregister(self.serversock.fileno())
                     poll.register(self.readsock.fileno(), event_read_mask)
 
-                    self.logger.info("Setting connection established event")
+                    self.logger.debug("Setting connection established event")
                     self.connection_established.set()
 
                 # Actual data to be logged
-- 
2.7.4


