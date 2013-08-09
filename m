Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id DC2556B4F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 15:04:35 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 09 Aug 2013 08:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,846,1367996400"; d="scan'208";a="279913944"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Aug 2013 08:04:35 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id EED522C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:04:33 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 18:04:29 +0300
Message-Id: <378314786b34b24e630fafd0fe7dcdf4fa16808b.1376060086.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1376060086.git.stefanx.stanacar@intel.com>
References: <cover.1376060086.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1376060086.git.stefanx.stanacar@intel.com>
References: <cover.1376060086.git.stefanx.stanacar@intel.com>
Subject: [PATCH 1/4] oeqa/utils/qemurunner: get ip old fashioned way and use tcp serial console
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
X-List-Received-Date: Fri, 09 Aug 2013 15:04:36 -0000

The way we read data from the serial console was unreliable and blocking (AutoBuilder
seems to hit that often), so change the serial console type from unix socket to tcp
and reverse the connection - don't let qemu act as server (wait for a connection).
So now the serial console is used to save the boot log and make sure that we reached
the login prompt. Until a better way is found this should solve some of the AutoBuilder
failures (one being YB#4904).

Also we need to use the same method as the old qemuimagetest to get the ip
(from the qemu process arguments), because that it's more reliable.
The first version used here was to log into the target and use the output of
"ip addr show eth0" but then systemd decides that it should rename interfaces,
so that was changed to get the ip of the interface that has the default gw,
but if there is no default gw we'll get the loopback ip and we end up trying to
ssh into the host machine (some recent AutoBuilder runs showed that).

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/oeqemuconsole.py |  45 -------------
 meta/lib/oeqa/utils/qemurunner.py    | 123 +++++++++++++++++++++++------------
 2 files changed, 81 insertions(+), 87 deletions(-)
 delete mode 100644 meta/lib/oeqa/utils/oeqemuconsole.py

diff --git a/meta/lib/oeqa/utils/oeqemuconsole.py b/meta/lib/oeqa/utils/oeqemuconsole.py
deleted file mode 100644
index 95a2133..0000000
--- a/meta/lib/oeqa/utils/oeqemuconsole.py
+++ /dev/null
@@ -1,45 +0,0 @@
-import socket
-import time
-import re
-from telnetlib import Telnet
-
-class oeQemuConsole(Telnet):
-
-    """
-    Override Telnet class to use unix domain sockets,
-    Telnet uses AF_INET for socket, we don't want that.
-    Also, provide a read_all variant with timeout, that
-    returns whatever output there is.
-    """
-
-    def __init__(self, stream, logfile):
-
-        Telnet.__init__(self, host=None)
-        self.stream = stream
-        self.logfile = logfile
-        self.eof = 0
-        self.sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
-        self.sock.connect(stream)
-
-    def log(self, msg):
-        if self.logfile:
-            with open(self.logfile, "a") as f:
-                f.write("%s\n" % msg)
-
-
-    def read_all_timeout(self, match, timeout=200):
-        """Read until EOF or until timeout or until match.
-        """
-        ret = False
-        self.process_rawq()
-        endtime = time.time() + timeout
-        while not self.eof and time.time() < endtime:
-            self.fill_rawq()
-            self.process_rawq()
-            if re.search(match, self.cookedq):
-                ret = True
-                break
-        buf = self.cookedq
-        self.cookedq = ''
-        self.log(buf)
-        return (ret, buf)
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index d086203..6ea89b9 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -6,26 +6,23 @@
 # It's used by testimage.bbclass.
 
 import subprocess
-import optparse
-import sys
 import os
 import time
 import signal
 import re
+import socket
+import select
 import bb
-from oeqa.utils.oeqemuconsole import oeQemuConsole
 
 class QemuRunner:
 
-    def __init__(self, machine, rootfs, display = None, tmpdir = None, logfile = None, boottime = 400):
+    def __init__(self, machine, rootfs, display = None, tmpdir = None, logfile = None, boottime = 400, runqemutime = 60):
         # Popen object
         self.runqemu = None
 
         self.machine = machine
         self.rootfs = rootfs
 
-        self.streampath = '/tmp/qemuconnection.%s' % os.getpid()
-        self.qemuparams = 'bootparams="console=tty1 console=ttyS0,115200n8" qemuparams="-serial unix:%s,server,nowait"' % self.streampath
         self.qemupid = None
         self.ip = None
 
@@ -33,11 +30,30 @@ class QemuRunner:
         self.tmpdir = tmpdir
         self.logfile = logfile
         self.boottime = boottime
+        self.runqemutime = runqemutime
+
+        self.bootlog = ''
+        self.qemusock = None
+
+        try:
+            self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
+            self.server_socket.setblocking(0)
+            self.server_socket.bind(("127.0.0.1",0))
+            self.server_socket.listen(2)
+            self.serverport = self.server_socket.getsockname()[1]
+            bb.note("Created listening socket for qemu serial console on: 127.0.0.1:%s" % self.serverport)
+        except socket.error, msg:
+            self.server_socket.close()
+            bb.fatal("Failed to create listening socket: %s" %msg[1])
+
+
+    def log(self, msg):
+        if self.logfile:
+            with open(self.logfile, "a") as f:
+                f.write("%s" % msg)
 
     def launch(self, qemuparams = None):
 
-        if qemuparams:
-            self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
         if self.display:
             os.environ["DISPLAY"] = self.display
@@ -53,49 +69,70 @@ class QemuRunner:
         else:
             os.environ["OE_TMPDIR"] = self.tmpdir
 
+        self.qemuparams = 'bootparams="console=tty1 console=ttyS0,115200n8" qemuparams="-serial tcp:127.0.0.1:%s"' % self.serverport
+        if qemuparams:
+            self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
+
         launch_cmd = 'runqemu %s %s %s' % (self.machine, self.rootfs, self.qemuparams)
         self.runqemu = subprocess.Popen(launch_cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,preexec_fn=os.setpgrp)
 
         bb.note("runqemu started, pid is %s" % self.runqemu.pid)
-        bb.note("waiting at most 60 seconds for qemu pid")
-        endtime = time.time() + 60
+        bb.note("waiting at most %s seconds for qemu pid" % self.runqemutime)
+        endtime = time.time() + self.runqemutime
         while not self.is_alive() and time.time() < endtime:
             time.sleep(1)
 
         if self.is_alive():
             bb.note("qemu started - qemu procces pid is %s" % self.qemupid)
-
-            console = oeQemuConsole(self.streampath, self.logfile)
+            pscmd = 'ps -p %s -f | grep -o "192\.168\.7\.[0-9]*::" | awk -F":" \'{print $1}\'' % self.qemupid
+            self.ip = subprocess.Popen(pscmd,shell=True,stdout=subprocess.PIPE).communicate()[0].strip()
+            if not re.search("^((?:[0-9]{1,3}\.){3}[0-9]{1,3})$", self.ip):
+                bb.note("Couldn't get ip from qemu process arguments, I got '%s'" % self.ip)
+                bb.note("Here is the ps output:\n%s" % \
+                        subprocess.Popen("ps -p %s -f" % self.qemupid,shell=True,stdout=subprocess.PIPE).communicate()[0])
+                self.kill()
+                return False
+            bb.note("IP found: %s" % self.ip)
             bb.note("Waiting at most %d seconds for login banner" % self.boottime )
-            (match, text) = console.read_all_timeout("login:", self.boottime)
-
-            if match:
-                bb.note("Reached login banner")
-                console.write("root\n")
-                (index, match, text) = console.expect([r"(root@[\w-]+:~#)"],10)
-                if not match:
-                    bb.note("Couldn't get prompt, all I got was:\n%s" % text)
-                    return False
-                console.write("ip addr show `ip route list | sed -n '1p' | awk '{print $5}'` | sed -n '3p' | awk '{ print $2 }' | cut -f 1 -d \"/\"\n")
-                (index, match, text) = console.expect([r"((?:[0-9]{1,3}\.){3}[0-9]{1,3})"],10)
-                console.close()
-                if match:
-                    self.ip = match.group(0)
-                    bb.note("Ip found: %s" % self.ip)
-                else:
-                    bb.note("Couldn't determine ip, all I got was:\n%s" % text)
-                    return False
-            else:
-                console.close()
+            endtime = time.time() + self.boottime
+            socklist = [self.server_socket]
+            reachedlogin = False
+            stopread = False
+            while time.time() < endtime and not stopread:
+                sread, swrite, serror = select.select(socklist, [], [], 0)
+                for sock in sread:
+                    if sock is self.server_socket:
+                        self.qemusock, addr = self.server_socket.accept()
+                        self.qemusock.setblocking(0)
+                        socklist.append(self.qemusock)
+                        socklist.remove(self.server_socket)
+                        bb.note("Connection from %s:%s" % addr)
+                    else:
+                        data = sock.recv(1024)
+                        if data:
+                            self.log(data)
+                            self.bootlog += data
+                            lastlines = "\n".join(self.bootlog.splitlines()[-2:])
+                            if re.search("login:", lastlines):
+                                stopread = True
+                                reachedlogin = True
+                                bb.note("Reached login banner")
+                        else:
+                            socklist.remove(sock)
+                            sock.close()
+                            stopread = True
+
+
+            if not reachedlogin:
                 bb.note("Target didn't reached login boot in %d seconds" % self.boottime)
-                lines = "\n".join(text.splitlines()[-5:])
+                lines = "\n".join(self.bootlog.splitlines()[-5:])
                 bb.note("Last 5 lines of text:\n%s" % lines)
                 bb.note("Check full boot log: %s" % self.logfile)
+                self.kill()
                 return False
         else:
-            bb.note("Qemu pid didn't appeared in 30 seconds")
-            self.runqemu.terminate()
-            self.runqemu.kill()
+            bb.note("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
+            self.kill()
             bb.note("Output from runqemu: %s " % self.runqemu.stdout.read())
             self.runqemu.stdout.close()
             return False
@@ -104,12 +141,15 @@ class QemuRunner:
 
 
     def kill(self):
-        if self.runqemu:
+        if self.server_socket:
+            self.server_socket.close()
+            self.server_socket = None
+        if self.runqemu.pid:
             os.kill(-self.runqemu.pid,signal.SIGTERM)
+            os.kill(-self.runqemu.pid,signal.SIGKILL)
+            self.runqemu.pid = None
         self.qemupid = None
         self.ip = None
-        if os.path.exists(self.streampath):
-            os.remove(self.streampath)
 
     def restart(self, qemuparams = None):
         if self.is_alive():
@@ -121,7 +161,7 @@ class QemuRunner:
         qemu_child = self.find_child(str(self.runqemu.pid))
         if qemu_child:
             self.qemupid = qemu_child[0]
-            if os.path.exists("/proc/" + str(self.qemupid)) and os.path.exists(self.streampath):
+            if os.path.exists("/proc/" + str(self.qemupid)):
                 return True
         return False
 
@@ -145,7 +185,6 @@ class QemuRunner:
             commands[data[0]] = data[2]
 
         if parent_pid not in pids:
-            sys.stderr.write("No children found matching %s\n" % parent_pid)
             return []
 
         parents = []
@@ -166,6 +205,6 @@ class QemuRunner:
             # Also, old versions of ldd (2.11) run "LD_XXXX qemu-system-xxxx"
             basecmd = commands[p].split()[0]
             basecmd = os.path.basename(basecmd)
-            if "qemu-system" in basecmd and "-serial unix" in commands[p]:
+            if "qemu-system" in basecmd and "-serial tcp" in commands[p]:
                 return [int(p),commands[p]]
 
-- 
1.8.3.1


