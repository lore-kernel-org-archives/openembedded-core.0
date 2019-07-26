Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C0D487ECB0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 01:11:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6Q1BunG018498
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 18:11:57 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 25 Jul 2019 18:11:56 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2019 09:11:55 +0800
Message-ID: <1564103515-245065-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] runqemu: add lockfile for port used when slirp enabled
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
X-List-Received-Date: Fri, 26 Jul 2019 01:11:55 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

There is race condition when multi qemu starting with slirp,
add lockfile for each port to avoid problem like:

runqemu - ERROR - Failed to run qemu: qemu-system-x86_64: Could not set up host forwarding rule 'tcp::2323-:23'

[YOCTO #13364]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 scripts/runqemu | 128 ++++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 91 insertions(+), 37 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 4079f2b..c6a892d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -119,19 +119,6 @@ def get_first_file(cmds):
                     return f
     return ''
 
-def check_free_port(host, port):
-    """ Check whether the port is free or not """
-    import socket
-    from contextlib import closing
-
-    with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as sock:
-        if sock.connect_ex((host, port)) == 0:
-            # Port is open, so not free
-            return False
-        else:
-            # Port is not open, so free
-            return True
-
 class BaseConfig(object):
     def __init__(self):
         # The self.d saved vars from self.set(), part of them are from qemuboot.conf
@@ -181,8 +168,9 @@ class BaseConfig(object):
         self.audio_enabled = False
         self.tcpserial_portnum = ''
         self.custombiosdir = ''
-        self.lock = ''
-        self.lock_descriptor = None
+        self.taplock = ''
+        self.taplock_descriptor = None
+        self.portlocks = {}
         self.bitbake_e = ''
         self.snapshot = False
         self.wictypes = ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi')
@@ -204,30 +192,81 @@ class BaseConfig(object):
         # avoid cleanup twice
         self.cleaned = False
 
-    def acquire_lock(self, error=True):
-        logger.debug("Acquiring lockfile %s..." % self.lock)
+    def acquire_taplock(self, error=True):
+        logger.debug("Acquiring lockfile %s..." % self.taplock)
         try:
-            self.lock_descriptor = open(self.lock, 'w')
-            fcntl.flock(self.lock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
+            self.taplock_descriptor = open(self.taplock, 'w')
+            fcntl.flock(self.taplock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
         except Exception as e:
-            msg = "Acquiring lockfile %s failed: %s" % (self.lock, e)
+            msg = "Acquiring lockfile %s failed: %s" % (self.taplock, e)
             if error:
                 logger.error(msg)
             else:
                 logger.info(msg)
-            if self.lock_descriptor:
-                self.lock_descriptor.close()
-                self.lock_descriptor = None
+            if self.taplock_descriptor:
+                self.taplock_descriptor.close()
+                self.taplock_descriptor = None
             return False
         return True
 
-    def release_lock(self):
-        if self.lock_descriptor:
+    def release_taplock(self):
+        if self.taplock_descriptor:
             logger.debug("Releasing lockfile for tap device '%s'" % self.tap)
-            fcntl.flock(self.lock_descriptor, fcntl.LOCK_UN)
-            self.lock_descriptor.close()
-            os.remove(self.lock)
-            self.lock_descriptor = None
+            fcntl.flock(self.taplock_descriptor, fcntl.LOCK_UN)
+            self.taplock_descriptor.close()
+            os.remove(self.taplock)
+            self.taplock_descriptor = None
+
+    def check_free_port(self, host, port, lockdir):
+        """ Check whether the port is free or not """
+        import socket
+        from contextlib import closing
+
+        lockfile = os.path.join(lockdir, str(port) + '.lock')
+        if self.acquire_portlock(lockfile):
+            with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as sock:
+                if sock.connect_ex((host, port)) == 0:
+                    # Port is open, so not free
+                    self.release_portlock(lockfile)
+                    return False
+                else:
+                    # Port is not open, so free
+                    return True
+        else:
+            return False
+
+    def acquire_portlock(self, lockfile, error=True):
+        logger.debug("Acquiring lockfile %s..." % lockfile)
+        try:
+            portlock_descriptor = open(lockfile, 'w')
+            self.portlocks.update({lockfile: portlock_descriptor})
+            fcntl.flock(self.portlocks[lockfile], fcntl.LOCK_EX|fcntl.LOCK_NB)
+        except Exception as e:
+            msg = "Acquiring lockfile %s failed: %s" % (lockfile, e)
+            if error:
+                logger.error(msg)
+            else:
+                logger.info(msg)
+            if self.portlocks[lockfile]:
+                self.portlocks[lockfile].close()
+                del self.portlocks[lockfile]
+            return False
+        return True
+
+    def release_portlock(self, lockfile=None):
+        if lockfile != None:
+           logger.debug("Releasing lockfile '%s'" % lockfile)
+           fcntl.flock(self.portlocks[lockfile], fcntl.LOCK_UN)
+           self.portlocks[lockfile].close()
+           os.remove(lockfile)
+           del self.portlocks[lockfile]
+        elif len(self.portlocks):
+            for lockfile, descriptor in self.portlocks.items():
+                logger.debug("Releasing lockfile '%s'" % lockfile)
+                fcntl.flock(descriptor, fcntl.LOCK_UN)
+                descriptor.close()
+                os.remove(lockfile)
+            self.portlocks = {}
 
     def get(self, key):
         if key in self.d:
@@ -958,10 +997,21 @@ class BaseConfig(object):
         ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
         ports = [int(i) for i in ports]
         mac = 2
+
+        lockdir = "/tmp/qemu-port-locks"
+        if not os.path.exists(lockdir):
+            # There might be a race issue when multi runqemu processess are
+            # running at the same time.
+            try:
+                os.mkdir(lockdir)
+                os.chmod(lockdir, 0o777)
+            except FileExistsError:
+                pass
+
         # Find a free port to avoid conflicts
         for p in ports[:]:
             p_new = p
-            while not check_free_port('localhost', p_new):
+            while not self.check_free_port('localhost', p_new, lockdir):
                 p_new += 1
                 mac += 1
                 while p_new in ports:
@@ -1016,8 +1066,8 @@ class BaseConfig(object):
             if os.path.exists('%s.skip' % lockfile):
                 logger.info('Found %s.skip, skipping %s' % (lockfile, p))
                 continue
-            self.lock = lockfile + '.lock'
-            if self.acquire_lock(error=False):
+            self.taplock = lockfile + '.lock'
+            if self.acquire_taplock(error=False):
                 tap = p
                 logger.info("Using preconfigured tap device %s" % tap)
                 logger.info("If this is not intended, touch %s.skip to make runqemu skip %s." %(lockfile, tap))
@@ -1035,8 +1085,8 @@ class BaseConfig(object):
             cmd = ('sudo', self.qemuifup, str(uid), str(gid), self.bindir_native)
             tap = subprocess.check_output(cmd).decode('utf-8').strip()
             lockfile = os.path.join(lockdir, tap)
-            self.lock = lockfile + '.lock'
-            self.acquire_lock()
+            self.taplock = lockfile + '.lock'
+            self.acquire_taplock()
             self.cleantap = True
             logger.debug('Created tap: %s' % tap)
 
@@ -1268,8 +1318,11 @@ class BaseConfig(object):
         cmds = shlex.split(cmd)
         logger.info('Running %s\n' % cmd)
         pass_fds = []
-        if self.lock_descriptor:
-            pass_fds = [self.lock_descriptor.fileno()]
+        if self.taplock_descriptor:
+            pass_fds = [self.taplock_descriptor.fileno()]
+        if len(self.portlocks):
+            for descriptor in self.portlocks.values():
+                pass_fds.append(descriptor.fileno())
         process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=pass_fds)
         self.qemupid = process.pid
         retcode = process.wait()
@@ -1291,7 +1344,8 @@ class BaseConfig(object):
             cmd = ('sudo', self.qemuifdown, self.tap, self.bindir_native)
             logger.debug('Running %s' % str(cmd))
             subprocess.check_call(cmd)
-        self.release_lock()
+        self.release_taplock()
+        self.release_portlock()
 
         if self.nfs_running:
             logger.info("Shutting down the userspace NFS server...")
-- 
2.7.4


