Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A42E376AC5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 22:24:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 20 Aug 2015 15:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,717,1432623600"; d="scan'208";a="629341552"
Received: from bitbang.jf.intel.com ([10.7.201.51])
	by orsmga003.jf.intel.com with ESMTP; 20 Aug 2015 15:24:12 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 15:24:10 -0700
Message-Id: <1440109450-9173-4-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1440109450-9173-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1440109450-9173-1-git-send-email-randy.e.witt@linux.intel.com>
Subject: [PATCH 3/3] qemurunner: Use two serial ports and log console with a thread
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
X-List-Received-Date: Thu, 20 Aug 2015 22:24:12 -0000

qemu can freeze and stop responding if the socket buffer connected to a tcp
serial connection fills up. This happens of course when the reader of
the serial data doesn't actually read it.

This happened in the qemurunner code, because after checking for the
"login:" sentinel, data was never again read from the serial connection.

This patch solves the potential freeze by adding a thread to continuously
read the data from the console and log it. So it also will give a full log
of the console, rather than just up to the login prompt.

To simplify this patch, another serial port was also added to use for the
sole purpose of watching for the sentinel as well as being the interactive
serial port. This will also prevent the possibility of lots of debug
data on the console preventing the sentinel value from being seen due to
interleaved text.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/conf/machine/qemuarm.conf    |   2 +-
 meta/conf/machine/qemuarm64.conf  |   2 +-
 meta/conf/machine/qemumips.conf   |   2 +-
 meta/conf/machine/qemumips64.conf |   2 +-
 meta/conf/machine/qemuppc.conf    |   2 +-
 meta/conf/machine/qemux86-64.conf |   2 +-
 meta/conf/machine/qemux86.conf    |   2 +-
 meta/lib/oeqa/utils/qemurunner.py | 126 +++++++++++++++++++++++++++++++++++++-
 8 files changed, 131 insertions(+), 9 deletions(-)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index d07084b..cdad03f 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -8,5 +8,5 @@ require conf/machine/include/tune-arm926ejs.inc
 
 KERNEL_IMAGETYPE = "zImage"
 
-SERIAL_CONSOLE = "115200 ttyAMA0"
+SERIAL_CONSOLES = "115200;ttyAMA0 115200;ttyAMA1"
 
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 20bcfba..7bbdad7 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -9,4 +9,4 @@ MACHINE_FEATURES = ""
 
 KERNEL_IMAGETYPE = "Image"
 
-SERIAL_CONSOLE = "38400 ttyAMA0"
+SERIAL_CONSOLES = "38400;ttyAMA0 38400;ttyAMA1"
diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index d9d2421..fbf8137 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -8,6 +8,6 @@ require conf/machine/include/tune-mips32r2.inc
 KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
 MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
index b2c7998..8c3f1fe 100644
--- a/meta/conf/machine/qemumips64.conf
+++ b/meta/conf/machine/qemumips64.conf
@@ -8,6 +8,6 @@ require conf/machine/include/tune-mips64.inc
 KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
 MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index 93145a1..85cbbf7 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -7,5 +7,5 @@ require conf/machine/include/tune-ppc7400.inc
 
 KERNEL_IMAGETYPE = "vmlinux"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 837f9f4..a4fd43c 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -13,7 +13,7 @@ require conf/machine/include/tune-core2.inc
 
 KERNEL_IMAGETYPE = "bzImage"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
 XSERVER = "xserver-xorg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 3562276..96cea66 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -12,7 +12,7 @@ require conf/machine/include/tune-i586.inc
 
 KERNEL_IMAGETYPE = "bzImage"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
 XSERVER = "xserver-xorg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c8d6899..b50b6ea 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -13,6 +13,7 @@ import re
 import socket
 import select
 import errno
+import threading
 
 import logging
 logger = logging.getLogger("BitBake.QemuRunner")
@@ -38,6 +39,7 @@ class QemuRunner:
         self.logfile = logfile
         self.boottime = boottime
         self.logged = False
+        self.thread = None
 
         self.runqemutime = 60
 
@@ -81,6 +83,7 @@ class QemuRunner:
             os.environ["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
 
         try:
+            threadsock, threadport = self.create_socket()
             self.server_socket, self.serverport = self.create_socket()
         except socket.error, msg:
             logger.error("Failed to create listening socket: %s" % msg[1])
@@ -89,7 +92,7 @@ class QemuRunner:
         # Set this flag so that Qemu doesn't do any grabs as SDL grabs interact
         # badly with screensavers.
         os.environ["QEMU_DONT_GRAB"] = "1"
-        self.qemuparams = 'bootparams="console=tty1 console=ttyS0,115200n8" qemuparams="-serial tcp:127.0.0.1:%s"' % self.serverport
+        self.qemuparams = 'bootparams="console=tty1 console=ttyS0,115200n8" qemuparams="-serial tcp:127.0.0.1:{} -serial tcp:127.0.0.1:{}"'.format(threadport, self.serverport)
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
@@ -138,6 +141,16 @@ class QemuRunner:
                 return False
             logger.info("Target IP: %s" % self.ip)
             logger.info("Server IP: %s" % self.server_ip)
+
+            logger.info("Starting logging thread")
+            self.thread = LoggingThread(self.log, threadsock, logger)
+            self.thread.start()
+            if not self.thread.connection_established.wait(self.boottime):
+                logger.error("Didn't receive a console connection from qemu")
+                logger.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used:\n%s\nand output from runqemu:\n%s" % (cmdline, getOutput(output)))
+                self.stop_thread()
+                return False
+
             logger.info("Waiting at most %d seconds for login banner" % self.boottime)
             endtime = time.time() + self.boottime
             socklist = [self.server_socket]
@@ -157,7 +170,6 @@ class QemuRunner:
                     else:
                         data = sock.recv(1024)
                         if data:
-                            self.log(data)
                             bootlog += data
                             if re.search(".* login:", bootlog):
                                 self.server_socket = qemusock
@@ -214,6 +226,12 @@ class QemuRunner:
             self.server_socket = None
         self.qemupid = None
         self.ip = None
+        self.stop_thread()
+
+    def stop_thread(self):
+        if self.thread and self.thread.is_alive():
+            self.thread.stop()
+            self.thread.join()
 
     def restart(self, qemuparams = None):
         logger.info("Restarting qemu process")
@@ -312,3 +330,107 @@ class QemuRunner:
                 if (status_cmd == "0"):
                     status = 1
         return (status, str(data))
+
+# This class is for reading data from a socket and passing it to logfunc
+# to be processed. It's completely event driven and has a straightforward
+# event loop. The mechanism for stopping the thread is a simple pipe which
+# will wake up the poll and allow for tearing everything down.
+class LoggingThread(threading.Thread):
+    def __init__(self, logfunc, sock, logger):
+        self.connection_established = threading.Event()
+        self.serversock = sock
+        self.logfunc = logfunc
+        self.logger = logger
+        self.readsock = None
+        self.running = False
+
+        self.errorevents = select.POLLERR | select.POLLHUP | select.POLLNVAL
+        self.readevents = select.POLLIN | select.POLLPRI
+
+        threading.Thread.__init__(self, target=self.threadtarget)
+
+    def threadtarget(self):
+        try:
+            self.eventloop()
+        finally:
+            self.teardown()
+
+    def run(self):
+        self.logger.info("Starting logging thread")
+        self.readpipe, self.writepipe = os.pipe()
+        threading.Thread.run(self)
+
+    def stop(self):
+        self.logger.info("Stopping logging thread")
+        if self.running:
+            os.write(self.writepipe, "stop")
+
+    def teardown(self):
+        self.close_socket(self.serversock)
+
+        if self.readsock is not None:
+            self.close_socket(self.readsock)
+
+        self.close_ignore_error(self.readpipe)
+        self.close_ignore_error(self.writepipe)
+        self.running = False
+
+    def eventloop(self):
+        poll = select.poll()
+        eventmask = self.errorevents | self.readevents
+        poll.register(self.serversock.fileno())
+        poll.register(self.readpipe, eventmask)
+
+        breakout = False
+        self.running = True
+        self.logger.info("Starting thread event loop")
+        while not breakout:
+            events = poll.poll()
+            for event in events:
+                # An error occurred, bail out
+                if event[1] & self.errorevents:
+                    raise Exception(self.stringify_event(event[1]))
+
+                # Event to stop the thread
+                if self.readpipe == event[0]:
+                    self.logger.info("Stop event received")
+                    breakout = True
+                    break
+
+                # A connection request was received
+                elif self.serversock.fileno() == event[0]:
+                    self.logger.info("Connection request received")
+                    self.readsock, _ = self.serversock.accept()
+                    poll.unregister(self.serversock.fileno())
+                    poll.register(self.readsock.fileno())
+
+                    self.logger.info("Setting connection established event")
+                    self.connection_established.set()
+
+                # Actual data to be logged
+                elif self.readsock.fileno() == event[0]:
+                    data = self.readsock.recv(1024)
+                    if not data:
+                        raise Exception("No data on read ready socket")
+
+                    self.logfunc(data)
+
+    def stringify_event(self, event):
+        val = ''
+        if select.POLLERR == event:
+            val = 'POLLER'
+        elif select.POLLHUP == event:
+            val = 'POLLHUP'
+        elif select.POLLNVAL == event:
+            val = 'POLLNVAL'
+        return val
+
+    def close_socket(self, sock):
+        sock.shutdown(socket.SHUT_RDWR)
+        sock.close()
+
+    def close_ignore_error(self, fd):
+        try:
+            os.close(fd)
+        except OSError:
+            pass
-- 
2.4.3


