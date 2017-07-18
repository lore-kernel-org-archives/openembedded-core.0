Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 85F7C77E35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:21:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I3LbUl022397
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:21:37 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 20:21:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jul 2017 20:21:31 -0700
Message-ID: <90b8354d45ea7687838cd2fb19a961a1a3d3e5e5.1500348040.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500348040.git.liezhi.yang@windriver.com>
References: <cover.1500348040.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] runqemu: add --debug and --quiet
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
X-List-Received-Date: Tue, 18 Jul 2017 03:21:36 -0000
Content-Type: text/plain

And move some debug info into logger.debug(), this can make it easy to
read key messages like errors or warnings.

I checked meta/lib/oeqa/ they don't depend on these messages. And I have
run "oe-selftest -a", it doesn't break anything.

[YOCTO #10474]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 50 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index d44afc7e7a1..7188bd78830 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -48,7 +48,7 @@ def create_logger():
 
     # create console handler and set level to debug
     ch = logging.StreamHandler()
-    ch.setLevel(logging.INFO)
+    ch.setLevel(logging.DEBUG)
 
     # create formatter
     formatter = logging.Formatter('%(name)s - %(levelname)s - %(message)s')
@@ -85,6 +85,8 @@ of the following environment variables (in any order):
   qemuparams=<xyz> - specify custom parameters to QEMU
   bootparams=<xyz> - specify custom kernel parameters during boot
   help, -h, --help: print this text
+  -d, --debug: Enable debug output
+  -q, --quite: Hide most output except error messages
 
 Examples:
   runqemu
@@ -112,7 +114,7 @@ def check_tun():
 
 def check_libgl(qemu_bin):
     cmd = 'ldd %s' % qemu_bin
-    logger.info('Running %s...' % cmd)
+    logger.debug('Running %s...' % cmd)
     need_gl = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
     if re.search('libGLU', need_gl):
         # We can't run without a libGL.so
@@ -229,12 +231,12 @@ class BaseConfig(object):
         self.mac_slirp = "52:54:00:12:35:"
 
     def acquire_lock(self):
-        logger.info("Acquiring lockfile %s..." % self.lock)
+        logger.debug("Acquiring lockfile %s..." % self.lock)
         try:
             self.lock_descriptor = open(self.lock, 'w')
             fcntl.flock(self.lock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
         except Exception as e:
-            logger.info("Acquiring lockfile %s failed: %s" % (self.lock, e))
+            logger.error("Acquiring lockfile %s failed: %s" % (self.lock, e))
             if self.lock_descriptor:
                 self.lock_descriptor.close()
             return False
@@ -259,10 +261,10 @@ class BaseConfig(object):
     def is_deploy_dir_image(self, p):
         if os.path.isdir(p):
             if not re.search('.qemuboot.conf$', '\n'.join(os.listdir(p)), re.M):
-                logger.info("Can't find required *.qemuboot.conf in %s" % p)
+                logger.debug("Can't find required *.qemuboot.conf in %s" % p)
                 return False
             if not any(map(lambda name: '-image-' in name, os.listdir(p))):
-                logger.info("Can't find *-image-* in %s" % p)
+                logger.debug("Can't find *-image-* in %s" % p)
                 return False
             return True
         else:
@@ -281,9 +283,9 @@ class BaseConfig(object):
 
     def set_machine_deploy_dir(self, machine, deploy_dir_image):
         """Set MACHINE and DEPLOY_DIR_IMAGE"""
-        logger.info('MACHINE: %s' % machine)
+        logger.debug('MACHINE: %s' % machine)
         self.set("MACHINE", machine)
-        logger.info('DEPLOY_DIR_IMAGE: %s' % deploy_dir_image)
+        logger.debug('DEPLOY_DIR_IMAGE: %s' % deploy_dir_image)
         self.set("DEPLOY_DIR_IMAGE", deploy_dir_image)
 
     def check_arg_nfs(self, p):
@@ -337,10 +339,10 @@ class BaseConfig(object):
 
         elif os.path.isdir(p) or re.search(':', p) and re.search('/', p):
             if self.is_deploy_dir_image(p):
-                logger.info('DEPLOY_DIR_IMAGE: %s' % p)
+                logger.debug('DEPLOY_DIR_IMAGE: %s' % p)
                 self.set("DEPLOY_DIR_IMAGE", p)
             else:
-                logger.info("Assuming %s is an nfs rootfs" % p)
+                logger.debug("Assuming %s is an nfs rootfs" % p)
                 self.check_arg_nfs(p)
         elif os.path.basename(p).startswith('ovmf'):
             self.ovmf_bios.append(p)
@@ -356,7 +358,7 @@ class BaseConfig(object):
         elif re.search('/', arg):
             raise RunQemuError("Unknown arg: %s" % arg)
 
-        logger.info('Assuming MACHINE = %s' % arg)
+        logger.debug('Assuming MACHINE = %s' % arg)
 
         # if we're running under testimage, or similarly as a child
         # of an existing bitbake invocation, we can't invoke bitbake
@@ -393,6 +395,16 @@ class BaseConfig(object):
             self.set("MACHINE", arg)
 
     def check_args(self):
+        for debug in ("-d", "--debug"):
+            if debug in sys.argv:
+                logger.setLevel(logging.DEBUG)
+                sys.argv.remove(debug)
+
+        for quiet in ("-q", "--quiet"):
+            if quiet in sys.argv:
+                logger.setLevel(logging.ERROR)
+                sys.argv.remove(quiet)
+
         unknown_arg = ""
         for arg in sys.argv[1:]:
             if arg in self.fstypes + self.vmtypes:
@@ -608,7 +620,7 @@ class BaseConfig(object):
                 break
 
         if biosdir:
-            logger.info("Assuming biosdir is: %s" % biosdir)
+            logger.debug("Assuming biosdir is: %s" % biosdir)
             self.qemu_opt_script += ' -L %s' % biosdir
         else:
             logger.error("Custom BIOS directory not found. Tried: %s, %s, and %s" % (self.custombiosdir, biosdir_native, biosdir_host))
@@ -663,7 +675,7 @@ class BaseConfig(object):
             if self.get('DEPLOY_DIR_IMAGE'):
                 deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
             else:
-                logger.info("Can't find qemuboot conf file, DEPLOY_DIR_IMAGE is NULL!")
+                logger.warn("Can't find qemuboot conf file, DEPLOY_DIR_IMAGE is NULL!")
                 return
 
             if self.rootfs and not os.path.exists(self.rootfs):
@@ -675,7 +687,7 @@ class BaseConfig(object):
                         self.rootfs, machine)
             else:
                 cmd = 'ls -t %s/*.qemuboot.conf' %  deploy_dir_image
-                logger.info('Running %s...' % cmd)
+                logger.debug('Running %s...' % cmd)
                 try:
                     qbs = subprocess.check_output(cmd, shell=True).decode('utf-8')
                 except subprocess.CalledProcessError as err:
@@ -700,7 +712,7 @@ class BaseConfig(object):
         if not os.path.exists(self.qemuboot):
             raise RunQemuError("Failed to find %s (wrong image name or BSP does not support running under qemu?)." % self.qemuboot)
 
-        logger.info('CONFFILE: %s' % self.qemuboot)
+        logger.debug('CONFFILE: %s' % self.qemuboot)
 
         cf = configparser.ConfigParser()
         cf.read(self.qemuboot)
@@ -899,7 +911,7 @@ class BaseConfig(object):
                 pass
 
         cmd = '%s link' % ip
-        logger.info('Running %s...' % cmd)
+        logger.debug('Running %s...' % cmd)
         ip_link = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
         # Matches line like: 6: tap0: <foo>
         possibles = re.findall('^[1-9]+: +(tap[0-9]+): <.*', ip_link, re.M)
@@ -931,7 +943,7 @@ class BaseConfig(object):
             self.lock = lockfile + '.lock'
             self.acquire_lock()
             self.cleantap = True
-            logger.info('Created tap: %s' % tap)
+            logger.debug('Created tap: %s' % tap)
 
         if not tap:
             logger.error("Failed to setup tap device. Run runqemu-gen-tapdevs to manually create.")
@@ -1150,7 +1162,7 @@ class BaseConfig(object):
     def cleanup(self):
         if self.cleantap:
             cmd = 'sudo %s %s %s' % (self.qemuifdown, self.tap, self.bindir_native)
-            logger.info('Running %s' % cmd)
+            logger.debug('Running %s' % cmd)
             subprocess.check_call(cmd, shell=True)
         if self.lock_descriptor:
             logger.info("Releasing lockfile for tap device '%s'" % self.tap)
@@ -1159,7 +1171,7 @@ class BaseConfig(object):
         if self.nfs_running:
             logger.info("Shutting down the userspace NFS server...")
             cmd = "runqemu-export-rootfs stop %s" % self.rootfs
-            logger.info('Running %s' % cmd)
+            logger.debug('Running %s' % cmd)
             subprocess.check_call(cmd, shell=True)
 
         if self.saved_stty:
-- 
2.11.0


