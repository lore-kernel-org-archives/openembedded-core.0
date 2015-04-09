Return-Path: <george.l.musat@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 791DC606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 08:10:43 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2015 01:10:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,548,1422950400"; d="scan'208";a="553384586"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 09 Apr 2015 01:10:45 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 92B736A408F;
	Thu,  9 Apr 2015 01:10:21 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 11:08:11 +0300
Message-Id: <1428566892-30526-2-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1428566892-30526-1-git-send-email-george.l.musat@intel.com>
References: <1428566892-30526-1-git-send-email-george.l.musat@intel.com>
Subject: [PATCH 2/3] oeqa/utils: Add runner for poky-tiny qemu.
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
X-List-Received-Date: Thu, 09 Apr 2015 08:10:47 -0000

The connection and commands are done via serial.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/utils/qemutinyrunner.py | 170 ++++++++++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/qemutinyrunner.py

diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
new file mode 100644
index 0000000..4f95101
--- /dev/null
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -0,0 +1,170 @@
+# Copyright (C) 2015 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+# This module provides a class for starting qemu images of poky tiny.
+# It's used by testimage.bbclass.
+
+import subprocess
+import os
+import time
+import signal
+import re
+import socket
+import select
+import bb
+from qemurunner import QemuRunner
+
+class QemuTinyRunner(QemuRunner):
+
+    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, kernel, boottime):
+
+        # Popen object for runqemu
+        self.runqemu = None
+        # pid of the qemu process that runqemu will start
+        self.qemupid = None
+        # target ip - from the command line
+        self.ip = None
+        # host ip - where qemu is running
+        self.server_ip = None
+
+        self.machine = machine
+        self.rootfs = rootfs
+        self.display = display
+        self.tmpdir = tmpdir
+        self.deploy_dir_image = deploy_dir_image
+        self.logfile = logfile
+        self.boottime = boottime
+
+        self.runqemutime = 60
+        self.socketfile = "console.sock"
+        self.server_socket = None
+        self.kernel = kernel
+
+
+    def create_socket(self):
+        tries = 3
+        while tries > 0:
+            try:
+                self.server_socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
+                self.server_socket.connect(self.socketfile)
+                bb.note("Created listening socket for qemu serial console.")
+                tries = 0
+            except socket.error, msg:
+                self.server_socket.close()
+                bb.fatal("Failed to create listening socket.")
+                tries -= 1
+
+    def log(self, msg):
+        if self.logfile:
+            with open(self.logfile, "a") as f:
+                f.write("%s" % msg)
+
+    def start(self, qemuparams = None):
+
+        if self.display:
+            os.environ["DISPLAY"] = self.display
+        else:
+            bb.error("To start qemu I need a X desktop, please set DISPLAY correctly (e.g. DISPLAY=:1)")
+            return False
+        if not os.path.exists(self.rootfs):
+            bb.error("Invalid rootfs %s" % self.rootfs)
+            return False
+        if not os.path.exists(self.tmpdir):
+            bb.error("Invalid TMPDIR path %s" % self.tmpdir)
+            return False
+        else:
+            os.environ["OE_TMPDIR"] = self.tmpdir
+        if not os.path.exists(self.deploy_dir_image):
+            bb.error("Invalid DEPLOY_DIR_IMAGE path %s" % self.deploy_dir_image)
+            return False
+        else:
+            os.environ["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
+
+        # Set this flag so that Qemu doesn't do any grabs as SDL grabs interact
+        # badly with screensavers.
+        os.environ["QEMU_DONT_GRAB"] = "1"
+        self.qemuparams = '--append "root=/dev/ram0 console=ttyS0" -nographic -serial unix:%s,server,nowait' % self.socketfile
+
+        launch_cmd = 'qemu-system-i386 -kernel %s -initrd %s %s' % (self.kernel, self.rootfs, self.qemuparams)
+        self.runqemu = subprocess.Popen(launch_cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,preexec_fn=os.setpgrp)
+
+        bb.note("runqemu started, pid is %s" % self.runqemu.pid)
+        bb.note("waiting at most %s seconds for qemu pid" % self.runqemutime)
+        endtime = time.time() + self.runqemutime
+        while not self.is_alive() and time.time() < endtime:
+            time.sleep(1)
+
+        if self.is_alive():
+            bb.note("qemu started - qemu procces pid is %s" % self.qemupid)
+            self.create_socket()
+        else:
+            bb.note("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
+            output = self.runqemu.stdout
+            self.stop()
+            bb.note("Output from runqemu:\n%s" % output.read())
+            return False
+
+        return self.is_alive()
+
+    def run_serial(self, command):
+        self.server_socket.sendall(command+'\n')
+        data = ''
+        status = 0
+        stopread = False
+        endtime = time.time()+5
+        while time.time()<endtime and not stopread:
+                sread, _, _ = select.select([self.server_socket],[],[],5)
+                for sock in sread:
+                        answer = sock.recv(1024)
+                        if answer:
+                                data += answer
+                        else:
+                                sock.close()
+                                stopread = True
+        if not data:
+            status = 1
+        return (status, str(data))
+
+    def find_child(self,parent_pid):
+        #
+        # Walk the process tree from the process specified looking for a qemu-system. Return its [pid'cmd]
+        #
+        ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,command'], stdout=subprocess.PIPE).communicate()[0]
+        processes = ps.split('\n')
+        nfields = len(processes[0].split()) - 1
+        pids = {}
+        commands = {}
+        for row in processes[1:]:
+            data = row.split(None, nfields)
+            if len(data) != 3:
+                continue
+            if data[1] not in pids:
+                pids[data[1]] = []
+
+            pids[data[1]].append(data[0])
+            commands[data[0]] = data[2]
+
+        if parent_pid not in pids:
+            return []
+
+        parents = []
+        newparents = pids[parent_pid]
+        while newparents:
+            next = []
+            for p in newparents:
+                if p in pids:
+                    for n in pids[p]:
+                        if n not in parents and n not in next:
+                            next.append(n)
+                if p not in parents:
+                    parents.append(p)
+                    newparents = next
+        #print "Children matching %s:" % str(parents)
+        for p in parents:
+            # Need to be careful here since runqemu-internal runs "ldd qemu-system-xxxx"
+            # Also, old versions of ldd (2.11) run "LD_XXXX qemu-system-xxxx"
+            basecmd = commands[p].split()[0]
+            basecmd = os.path.basename(basecmd)
+            if "qemu-system" in basecmd and "-serial unix" in commands[p]:
+                return [int(p),commands[p]]
\ No newline at end of file
-- 
2.1.0


