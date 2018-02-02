Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9F60071951
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 03:22:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w123MqEF026803
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Feb 2018 19:22:52 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 1 Feb 2018 19:22:51 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 11:23:25 +0800
Message-ID: <5129206d1ddc07fa0232a94be52f5f7ae3140bae.1517541572.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517541572.git.liezhi.yang@windriver.com>
References: <cover.1517541572.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] runqemu: qemuboot.conf -> qemuboot.json
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
X-List-Received-Date: Fri, 02 Feb 2018 03:22:51 -0000
Content-Type: text/plain

The qemuboot.conf uses configparser which can't suport upper case as key, and
json is more clearer than configparser and is widely used in oe-core, so use
qemuboot.json to replace qemuboot.conf.

[YOCTO #12503]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 70 ++++++++++++++++++++++++++++-----------------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index d998494..0ca62f4 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -26,7 +26,7 @@ import re
 import fcntl
 import shutil
 import glob
-import configparser
+import json
 
 class RunQemuError(Exception):
     """Custom exception to raise on known errors."""
@@ -38,8 +38,8 @@ class OEPathError(RunQemuError):
         super().__init__("In order for this script to dynamically infer paths\n \
 kernels or filesystem images, you either need bitbake in your PATH\n \
 or to source oe-init-build-env before running this script.\n\n \
-Dynamic path inference can be avoided by passing a *.qemuboot.conf to\n \
-runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`\n\n %s" % message)
+Dynamic path inference can be avoided by passing a *.qemuboot.json to\n \
+runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.json`\n\n %s" % message)
 
 
 def create_logger():
@@ -93,7 +93,7 @@ Examples:
   runqemu
   runqemu qemuarm
   runqemu tmp/deploy/images/qemuarm
-  runqemu tmp/deploy/images/qemux86/<qemuboot.conf>
+  runqemu tmp/deploy/images/qemux86/<qemuboot.json>
   runqemu qemux86-64 core-image-sato ext4
   runqemu qemux86-64 wic-image-minimal wic
   runqemu path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial
@@ -171,7 +171,7 @@ def check_free_port(host, port):
 
 class BaseConfig(object):
     def __init__(self):
-        # The self.d saved vars from self.set(), part of them are from qemuboot.conf
+        # The self.d saved vars from self.set(), part of them are from qemuboot.json
         self.d = {'QB_KERNEL_ROOT': '/dev/vda'}
 
         # Supported env vars, add it here if a var can be got from env,
@@ -197,7 +197,7 @@ class BaseConfig(object):
         # Setting one also adds "-vga std" because that is all that
         # OVMF supports.
         self.ovmf_bios = []
-        self.qemuboot = ''
+        self.qb_json = ''
         self.qbconfload = False
         self.kernel = ''
         self.kernel_cmdline = ''
@@ -268,8 +268,8 @@ class BaseConfig(object):
 
     def is_deploy_dir_image(self, p):
         if os.path.isdir(p):
-            if not re.search('.qemuboot.conf$', '\n'.join(os.listdir(p)), re.M):
-                logger.debug("Can't find required *.qemuboot.conf in %s" % p)
+            if not re.search('.qemuboot.json$', '\n'.join(os.listdir(p)), re.M):
+                logger.debug("Can't find required *.qemuboot.json in %s" % p)
                 return False
             if not any(map(lambda name: '-image-' in name, os.listdir(p))):
                 logger.debug("Can't find *-image-* in %s" % p)
@@ -309,14 +309,14 @@ class BaseConfig(object):
 
     def check_arg_path(self, p):
         """
-        - Check whether it is <image>.qemuboot.conf or contains <image>.qemuboot.conf
+        - Check whether it is <image>.qemuboot.json or contains <image>.qemuboot.json
         - Check whether is a kernel file
         - Check whether is a image file
         - Check whether it is a nfs dir
         - Check whether it is a OVMF flash file
         """
-        if p.endswith('.qemuboot.conf'):
-            self.qemuboot = p
+        if p.endswith('.qemuboot.json'):
+            self.qb_json = p
             self.qbconfload = True
         elif re.search('\.bin$', p) or re.search('bzImage', p) or \
              re.search('zImage', p) or re.search('vmlinux', p) or \
@@ -338,9 +338,9 @@ class BaseConfig(object):
             if fst:
                 self.check_arg_fstype(fst)
                 qb = re.sub('\.' + fst + "$", '', self.rootfs)
-                qb = '%s%s' % (re.sub('\.rootfs$', '', qb), '.qemuboot.conf')
+                qb = '%s%s' % (re.sub('\.rootfs$', '', qb), '.qemuboot.json')
                 if os.path.exists(qb):
-                    self.qemuboot = qb
+                    self.qb_json = qb
                     self.qbconfload = True
                 else:
                     logger.warn("%s doesn't exist" % qb)
@@ -701,7 +701,7 @@ class BaseConfig(object):
         self.check_tcpserial()
 
     def read_qemuboot(self):
-        if not self.qemuboot:
+        if not self.qb_json:
             if self.get('DEPLOY_DIR_IMAGE'):
                 deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
             else:
@@ -713,10 +713,10 @@ class BaseConfig(object):
                 machine = self.get('MACHINE')
                 if not machine:
                     machine = os.path.basename(deploy_dir_image)
-                self.qemuboot = "%s/%s-%s.qemuboot.conf" % (deploy_dir_image,
+                self.qb_json = "%s/%s-%s.qemuboot.json" % (deploy_dir_image,
                         self.rootfs, machine)
             else:
-                cmd = 'ls -t %s/*.qemuboot.conf' %  deploy_dir_image
+                cmd = 'ls -t %s/*.qemuboot.json' %  deploy_dir_image
                 logger.debug('Running %s...' % cmd)
                 try:
                     qbs = subprocess.check_output(cmd, shell=True).decode('utf-8')
@@ -727,42 +727,42 @@ class BaseConfig(object):
                         # Don't use initramfs when other choices unless fstype is ramfs
                         if '-initramfs-' in os.path.basename(qb) and self.fstype != 'cpio.gz':
                                 continue
-                        self.qemuboot = qb
+                        self.qb_json = qb
                         break
-                    if not self.qemuboot:
+                    if not self.qb_json:
                         # Use the first one when no choice
-                        self.qemuboot = qbs.split()[0]
+                        self.qb_json = qbs.split()[0]
                     self.qbconfload = True
 
-        if not self.qemuboot:
-            # If we haven't found a .qemuboot.conf at this point it probably
+        if not self.qb_json:
+            # If we haven't found a .qemuboot.json at this point it probably
             # doesn't exist, continue without
             return
 
-        if not os.path.exists(self.qemuboot):
-            raise RunQemuError("Failed to find %s (wrong image name or BSP does not support running under qemu?)." % self.qemuboot)
+        if not os.path.exists(self.qb_json):
+            raise RunQemuError("Failed to find %s (wrong image name or BSP does not support running under qemu?)." % self.qb_json)
 
-        logger.debug('CONFFILE: %s' % self.qemuboot)
+        logger.debug('CONFFILE: %s' % self.qb_json)
 
-        cf = configparser.ConfigParser()
-        cf.read(self.qemuboot)
-        for k, v in cf.items('config_bsp'):
-            k_upper = k.upper()
+        with open(self.qb_json, 'r') as f:
+            qb_json_dict = json.load(f)
+
+        for k, v in qb_json_dict.items():
             if v.startswith("../"):
-                v = os.path.abspath(os.path.dirname(self.qemuboot) + "/" + v)
+                v = os.path.abspath(os.path.dirname(self.qb_json) + "/" + v)
             elif v == ".":
-                v = os.path.dirname(self.qemuboot)
-            self.set(k_upper, v)
+                v = os.path.dirname(self.qb_json)
+            self.set(k, v)
 
     def validate_paths(self):
         """Ensure all relevant path variables are set"""
-        # When we're started with a *.qemuboot.conf arg assume that image
+        # When we're started with a *.qemuboot.json arg assume that image
         # artefacts are relative to that file, rather than in whatever
         # directory DEPLOY_DIR_IMAGE in the conf file points to.
         if self.qbconfload:
-            imgdir = os.path.realpath(os.path.dirname(self.qemuboot))
+            imgdir = os.path.realpath(os.path.dirname(self.qb_json))
             if imgdir != os.path.realpath(self.get('DEPLOY_DIR_IMAGE')):
-                logger.info('Setting DEPLOY_DIR_IMAGE to folder containing %s (%s)' % (self.qemuboot, imgdir))
+                logger.info('Setting DEPLOY_DIR_IMAGE to folder containing %s (%s)' % (self.qb_json, imgdir))
                 self.set('DEPLOY_DIR_IMAGE', imgdir)
 
         # If the STAGING_*_NATIVE directories from the config file don't exist
@@ -818,7 +818,7 @@ class BaseConfig(object):
             print('ROOTFS: [%s]' % self.rootfs)
         if self.ovmf_bios:
             print('OVMF: %s' % self.ovmf_bios)
-        print('CONFFILE: [%s]' % self.qemuboot)
+        print('CONFFILE: [%s]' % self.qb_json)
         print('')
 
     def setup_nfs(self):
-- 
2.7.4


