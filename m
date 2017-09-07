Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 04F4177BF0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 00:34:01 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 06 Sep 2017 17:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,355,1500966000"; d="scan'208";a="126293231"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga004.jf.intel.com with ESMTP; 06 Sep 2017 17:34:02 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Sep 2017 17:33:58 -0700
Message-Id: <1504744438-53711-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504744438-53711-1-git-send-email-juro.bystricky@intel.com>
References: <1504744438-53711-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/1] qemurunner.py: refactor searching for QEMU PID
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
X-List-Received-Date: Thu, 07 Sep 2017 00:34:02 -0000

Ask QEMU to store the QEMU process PID in a file, this way we don't
have to parse running processes and analyze descendents.
This is done via QEMU command line argument "-pidfile".

[YOCTO #12001]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 303 +++++++++++++++++---------------------
 1 file changed, 136 insertions(+), 167 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 54312fb..c28c2ce 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -56,6 +56,7 @@ class QemuRunner:
         self.use_kvm = use_kvm
 
         self.runqemutime = 120
+        self.qemu_pidfile = 'pidfile_'+str(os.getpid())
         self.host_dumper = HostDumper(dump_host_cmds, dump_dir)
 
     def create_socket(self):
@@ -143,7 +144,11 @@ class QemuRunner:
         if extra_bootparams:
             bootparams = bootparams + ' ' + extra_bootparams
 
-        self.qemuparams = 'bootparams="{0}" qemuparams="-serial tcp:127.0.0.1:{1}"'.format(bootparams, threadport)
+        # Ask QEMU to store the QEMU process PID in file, this way we don't have to parse running processes
+        # and analyze descendents in order to determine it.
+        if os.path.exists(self.qemu_pidfile):
+            os.remove(self.qemu_pidfile)
+        self.qemuparams = 'bootparams="{0}" qemuparams="-serial tcp:127.0.0.1:{1} -pidfile {2}"'.format(bootparams, threadport, self.qemu_pidfile)
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
@@ -199,125 +204,14 @@ class QemuRunner:
                     self.stop()
                     logger.info("Output from runqemu:\n%s" % self.getOutput(output))
                     return False
-            time.sleep(1)
+            time.sleep(0.5)
 
-        out = self.getOutput(output)
-        netconf = False # network configuration is not required by default
-        if self.is_alive():
-            logger.info("qemu started in %s seconds - qemu procces pid is %s" % (time.time() - (endtime - self.runqemutime), self.qemupid))
-            if get_ip:
-                cmdline = ''
-                with open('/proc/%s/cmdline' % self.qemupid) as p:
-                    cmdline = p.read()
-                    # It is needed to sanitize the data received
-                    # because is possible to have control characters
-                    cmdline = re_control_char.sub('', cmdline)
-                try:
-                    ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
-                    self.ip = ips[0]
-                    self.server_ip = ips[1]
-                    logger.info("qemu cmdline used:\n{}".format(cmdline))
-                except (IndexError, ValueError):
-                    # Try to get network configuration from runqemu output
-                    match = re.match('.*Network configuration: ([0-9.]+)::([0-9.]+):([0-9.]+)$.*',
-                                     out, re.MULTILINE|re.DOTALL)
-                    if match:
-                        self.ip, self.server_ip, self.netmask = match.groups()
-                        # network configuration is required as we couldn't get it
-                        # from the runqemu command line, so qemu doesn't run kernel
-                        # and guest networking is not configured
-                        netconf = True
-                    else:
-                        logger.error("Couldn't get ip from qemu command line and runqemu output! "
-                                     "Here is the qemu command line used:\n%s\n"
-                                     "and output from runqemu:\n%s" % (cmdline, out))
-                        self._dump_host()
-                        self.stop()
-                        return False
-
-                logger.info("Target IP: %s" % self.ip)
-                logger.info("Server IP: %s" % self.server_ip)
-
-            self.thread = LoggingThread(self.log, threadsock, logger)
-            self.thread.start()
-            if not self.thread.connection_established.wait(self.boottime):
-                logger.error("Didn't receive a console connection from qemu. "
-                             "Here is the qemu command line used:\n%s\nand "
-                             "output from runqemu:\n%s" % (cmdline, out))
-                self.stop_thread()
-                return False
-
-            logger.info("Output from runqemu:\n%s", out)
-            logger.info("Waiting at most %d seconds for login banner" % self.boottime)
-            endtime = time.time() + self.boottime
-            socklist = [self.server_socket]
-            reachedlogin = False
-            stopread = False
-            qemusock = None
-            bootlog = ''
-            data = b''
-            while time.time() < endtime and not stopread:
-                try:
-                    sread, swrite, serror = select.select(socklist, [], [], 5)
-                except InterruptedError:
-                    continue
-                for sock in sread:
-                    if sock is self.server_socket:
-                        qemusock, addr = self.server_socket.accept()
-                        qemusock.setblocking(0)
-                        socklist.append(qemusock)
-                        socklist.remove(self.server_socket)
-                        logger.info("Connection from %s:%s" % addr)
-                    else:
-                        data = data + sock.recv(1024)
-                        if data:
-                            try:
-                                data = data.decode("utf-8", errors="surrogateescape")
-                                bootlog += data
-                                data = b''
-                                if re.search(".* login:", bootlog):
-                                    self.server_socket = qemusock
-                                    stopread = True
-                                    reachedlogin = True
-                                    logger.info("Reached login banner")
-                            except UnicodeDecodeError:
-                                continue
-                        else:
-                            socklist.remove(sock)
-                            sock.close()
-                            stopread = True
-
-            if not reachedlogin:
-                logger.info("Target didn't reached login boot in %d seconds" % self.boottime)
-                lines = "\n".join(bootlog.splitlines()[-25:])
-                logger.info("Last 25 lines of text:\n%s" % lines)
-                logger.info("Check full boot log: %s" % self.logfile)
-                self._dump_host()
-                self.stop()
-                return False
-
-            # If we are not able to login the tests can continue
-            try:
-                (status, output) = self.run_serial("root\n", raw=True)
-                if re.search("root@[a-zA-Z0-9\-]+:~#", output):
-                    self.logged = True
-                    logger.info("Logged as root in serial console")
-                    if netconf:
-                        # configure guest networking
-                        cmd = "ifconfig eth0 %s netmask %s up\n" % (self.ip, self.netmask)
-                        output = self.run_serial(cmd, raw=True)[1]
-                        if re.search("root@[a-zA-Z0-9\-]+:~#", output):
-                            logger.info("configured ip address %s", self.ip)
-                        else:
-                            logger.info("Couldn't configure guest networking")
-                else:
-                    logger.info("Couldn't login into serial console"
-                            " as root using blank password")
-            except:
-                logger.info("Serial console failed while trying to login")
-
-        else:
+        if not self.is_alive():
             logger.error("Qemu pid didn't appear in %s seconds" % self.runqemutime)
+            # Dump all processes to help us to figure out what is going on...
+            ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,command '], stdout=subprocess.PIPE).communicate()[0]
+            processes = ps.decode("utf-8")
+            logger.info("Running processes:\n%s" % processes)
             self._dump_host()
             self.stop()
             op = self.getOutput(output)
@@ -327,7 +221,121 @@ class QemuRunner:
                 logger.error("No output from runqemu.\n")
             return False
 
-        return self.is_alive()
+        # We are alive: qemu is running
+        out = self.getOutput(output)
+        netconf = False # network configuration is not required by default
+        logger.info("qemu started in %s seconds - qemu procces pid is %s" % (time.time() - (endtime - self.runqemutime), self.qemupid))
+        if get_ip:
+            cmdline = ''
+            with open('/proc/%s/cmdline' % self.qemupid) as p:
+                cmdline = p.read()
+                # It is needed to sanitize the data received
+                # because is possible to have control characters
+                cmdline = re_control_char.sub(' ', cmdline)
+            try:
+                ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
+                self.ip = ips[0]
+                self.server_ip = ips[1]
+                logger.info("qemu cmdline used:\n{}".format(cmdline))
+            except (IndexError, ValueError):
+                # Try to get network configuration from runqemu output
+                match = re.match('.*Network configuration: ([0-9.]+)::([0-9.]+):([0-9.]+)$.*',
+                                 out, re.MULTILINE|re.DOTALL)
+                if match:
+                    self.ip, self.server_ip, self.netmask = match.groups()
+                    # network configuration is required as we couldn't get it
+                    # from the runqemu command line, so qemu doesn't run kernel
+                    # and guest networking is not configured
+                    netconf = True
+                else:
+                    logger.error("Couldn't get ip from qemu command line and runqemu output! "
+                                 "Here is the qemu command line used:\n%s\n"
+                                 "and output from runqemu:\n%s" % (cmdline, out))
+                    self._dump_host()
+                    self.stop()
+                    return False
+
+        logger.info("Target IP: %s" % self.ip)
+        logger.info("Server IP: %s" % self.server_ip)
+
+        self.thread = LoggingThread(self.log, threadsock, logger)
+        self.thread.start()
+        if not self.thread.connection_established.wait(self.boottime):
+            logger.error("Didn't receive a console connection from qemu. "
+                         "Here is the qemu command line used:\n%s\nand "
+                         "output from runqemu:\n%s" % (cmdline, out))
+            self.stop_thread()
+            return False
+
+        logger.info("Output from runqemu:\n%s", out)
+        logger.info("Waiting at most %d seconds for login banner" % self.boottime)
+        endtime = time.time() + self.boottime
+        socklist = [self.server_socket]
+        reachedlogin = False
+        stopread = False
+        qemusock = None
+        bootlog = ''
+        data = b''
+        while time.time() < endtime and not stopread:
+            try:
+                sread, swrite, serror = select.select(socklist, [], [], 5)
+            except InterruptedError:
+                continue
+            for sock in sread:
+                if sock is self.server_socket:
+                    qemusock, addr = self.server_socket.accept()
+                    qemusock.setblocking(0)
+                    socklist.append(qemusock)
+                    socklist.remove(self.server_socket)
+                    logger.info("Connection from %s:%s" % addr)
+                else:
+                    data = data + sock.recv(1024)
+                    if data:
+                        try:
+                            data = data.decode("utf-8", errors="surrogateescape")
+                            bootlog += data
+                            data = b''
+                            if re.search(".* login:", bootlog):
+                                self.server_socket = qemusock
+                                stopread = True
+                                reachedlogin = True
+                                logger.info("Reached login banner")
+                        except UnicodeDecodeError:
+                            continue
+                    else:
+                        socklist.remove(sock)
+                        sock.close()
+                        stopread = True
+
+        if not reachedlogin:
+            logger.info("Target didn't reached login boot in %d seconds" % self.boottime)
+            lines = "\n".join(bootlog.splitlines()[-25:])
+            logger.info("Last 25 lines of text:\n%s" % lines)
+            logger.info("Check full boot log: %s" % self.logfile)
+            self._dump_host()
+            self.stop()
+            return False
+
+        # If we are not able to login the tests can continue
+        try:
+            (status, output) = self.run_serial("root\n", raw=True)
+            if re.search("root@[a-zA-Z0-9\-]+:~#", output):
+                self.logged = True
+                logger.info("Logged as root in serial console")
+                if netconf:
+                    # configure guest networking
+                    cmd = "ifconfig eth0 %s netmask %s up\n" % (self.ip, self.netmask)
+                    output = self.run_serial(cmd, raw=True)[1]
+                    if re.search("root@[a-zA-Z0-9\-]+:~#", output):
+                        logger.info("configured ip address %s", self.ip)
+                    else:
+                        logger.info("Couldn't configure guest networking")
+                else:
+                    logger.info("Couldn't login into serial console"
+                                " as root using blank password")
+        except:
+            logger.info("Serial console failed while trying to login")
+        return True
 
     def stop(self):
         self.stop_thread()
@@ -355,6 +363,8 @@ class QemuRunner:
             self.server_socket = None
         self.qemupid = None
         self.ip = None
+        if os.path.exists(self.qemu_pidfile):
+            os.remove(self.qemu_pidfile)
 
     def stop_qemu_system(self):
         if self.qemupid:
@@ -380,56 +390,15 @@ class QemuRunner:
     def is_alive(self):
         if not self.runqemu:
             return False
-        qemu_child = self.find_child(str(self.runqemu.pid))
-        if qemu_child:
-            self.qemupid = qemu_child[0]
-            if os.path.exists("/proc/" + str(self.qemupid)):
-                return True
+        if os.path.isfile(self.qemu_pidfile):
+            f = open(self.qemu_pidfile, 'r')
+            qemu_pid = f.read()
+            f.close()
+            #logger.info("qemu_pid: %s" % qemu_pid)
+            self.qemupid = int(qemu_pid)
+            return True
         return False
 
-    def find_child(self,parent_pid):
-        #
-        # Walk the process tree from the process specified looking for a qemu-system. Return its [pid'cmd]
-        #
-        ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,command'], stdout=subprocess.PIPE).communicate()[0]
-        processes = ps.decode("utf-8").split('\n')
-        nfields = len(processes[0].split()) - 1
-        pids = {}
-        commands = {}
-        for row in processes[1:]:
-            data = row.split(None, nfields)
-            if len(data) != 3:
-                continue
-            if data[1] not in pids:
-                pids[data[1]] = []
-
-            pids[data[1]].append(data[0])
-            commands[data[0]] = data[2]
-
-        if parent_pid not in pids:
-            return []
-
-        parents = []
-        newparents = pids[parent_pid]
-        while newparents:
-            next = []
-            for p in newparents:
-                if p in pids:
-                    for n in pids[p]:
-                        if n not in parents and n not in next:
-                            next.append(n)
-                if p not in parents:
-                    parents.append(p)
-                    newparents = next
-        #print("Children matching %s:" % str(parents))
-        for p in parents:
-            # Need to be careful here since runqemu runs "ldd qemu-system-xxxx"
-            # Also, old versions of ldd (2.11) run "LD_XXXX qemu-system-xxxx"
-            basecmd = commands[p].split()[0]
-            basecmd = os.path.basename(basecmd)
-            if "qemu-system" in basecmd and "-serial tcp" in commands[p]:
-                return [int(p),commands[p]]
-
     def run_serial(self, command, raw=False, timeout=5):
         # We assume target system have echo to get command status
         if not raw:
-- 
2.7.4


