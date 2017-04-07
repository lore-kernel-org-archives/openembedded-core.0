Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96C4177D86
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 09:47:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v379lINJ025416
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Apr 2017 02:47:19 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Apr 2017 02:47:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Apr 2017 02:47:09 -0700
Message-ID: <1eb0d4a15c13ef2b61b1abf913e75eed676120f2.1491557671.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491557671.git.liezhi.yang@windriver.com>
References: <cover.1491557671.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] runqemu: support env vars explicitly
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
X-List-Received-Date: Fri, 07 Apr 2017 09:47:18 -0000
Content-Type: text/plain

Use self.env_vars to support get vars from environment explicity. The
MACHINE, ROOTFS and KERNEL was supported by shell based runqemu, and
the help text says support them from env vars, so add them back.

[YOCTO #11141]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 71 ++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 42 insertions(+), 29 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 251f5f7e94..ddbff4b221 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -163,12 +163,18 @@ def check_free_port(host, port):
 
 class BaseConfig(object):
     def __init__(self):
-        # Vars can be merged with .qemuboot.conf, use a dict to manage them.
-        self.d = {
-            'MACHINE': '',
-            'DEPLOY_DIR_IMAGE': '',
-            'QB_KERNEL_ROOT': '/dev/vda',
-        }
+        # The self.d saved vars from self.set(), part of them are from qemuboot.conf
+        self.d = {'QB_KERNEL_ROOT': '/dev/vda'}
+
+        # Supported env vars, add it here if a var can be got from env,
+        # and don't use os.getenv in the code.
+        self.env_vars = ('MACHINE',
+                        'ROOTFS',
+                        'KERNEL',
+                        'DEPLOY_DIR_IMAGE',
+                        'OE_TMPDIR',
+                        'OECORE_NATIVE_SYSROOT',
+                        )
 
         self.qemu_opt = ''
         self.qemu_opt_script = ''
@@ -238,6 +244,8 @@ class BaseConfig(object):
     def get(self, key):
         if key in self.d:
             return self.d.get(key)
+        elif os.getenv(key):
+            return os.getenv(key)
         else:
             return ''
 
@@ -338,10 +346,13 @@ class BaseConfig(object):
 
     def check_arg_machine(self, arg):
         """Check whether it is a machine"""
-        if self.get('MACHINE') and self.get('MACHINE') != arg or re.search('/', arg):
-            raise Exception("Unknown arg: %s" % arg)
-        elif self.get('MACHINE') == arg:
+        if self.get('MACHINE') == arg:
             return
+        elif self.get('MACHINE') and self.get('MACHINE') != arg:
+            raise Exception("Maybe conflicted MACHINE: %s vs %s" % (self.get('MACHINE'), arg))
+        elif re.search('/', arg):
+            raise Exception("Unknown arg: %s" % arg)
+
         logger.info('Assuming MACHINE = %s' % arg)
 
         # if we're running under testimage, or similarly as a child
@@ -350,14 +361,14 @@ class BaseConfig(object):
         # FIXME: testimage.bbclass exports these two variables into env,
         # are there other scenarios in which we need to support being
         # invoked by bitbake?
-        deploy = os.environ.get('DEPLOY_DIR_IMAGE')
-        bbchild = deploy and os.environ.get('OE_TMPDIR')
+        deploy = self.get('DEPLOY_DIR_IMAGE')
+        bbchild = deploy and self.get('OE_TMPDIR')
         if bbchild:
             self.set_machine_deploy_dir(arg, deploy)
             return
         # also check whether we're running under a sourced toolchain
         # environment file
-        if os.environ.get('OECORE_NATIVE_SYSROOT'):
+        if self.get('OECORE_NATIVE_SYSROOT'):
             self.set("MACHINE", arg)
             return
 
@@ -430,20 +441,15 @@ class BaseConfig(object):
         if unknown_arg:
             if self.get('MACHINE') == unknown_arg:
                 return
-            if not self.get('DEPLOY_DIR_IMAGE'):
-                # Trying to get DEPLOY_DIR_IMAGE from env.
-                p = os.getenv('DEPLOY_DIR_IMAGE')
-                if p and self.is_deploy_dir_image(p):
-                    machine = os.path.basename(p)
-                    if unknown_arg == machine:
-                        self.set_machine_deploy_dir(machine, p)
-                        return
-                    else:
-                        logger.info('DEPLOY_DIR_IMAGE: %s' % p)
-                        self.set("DEPLOY_DIR_IMAGE", p)
+            if self.get('DEPLOY_DIR_IMAGE'):
+                machine = os.path.basename(self.get('DEPLOY_DIR_IMAGE'))
+                if unknown_arg == machine:
+                    self.set("MACHINE", machine)
+                    return
+
             self.check_arg_machine(unknown_arg)
 
-        if not (self.get('MACHINE') or self.get('DEPLOY_DIR_IMAGE')):
+        if not self.get('DEPLOY_DIR_IMAGE'):
             self.load_bitbake_env()
             s = re.search('^DEPLOY_DIR_IMAGE="(.*)"', self.bitbake_e, re.M)
             if s:
@@ -505,7 +511,16 @@ class BaseConfig(object):
     def check_rootfs(self):
         """Check and set rootfs"""
 
-        if self.fstype == 'nfs' or self.fstype == "none":
+        if self.fstype == "none":
+            return
+
+        if self.get('ROOTFS'):
+            if not self.rootfs:
+                self.rootfs = self.get('ROOTFS')
+            elif self.get('ROOTFS') != self.rootfs:
+                raise Exception("Maybe conflicted ROOTFS: %s vs %s" % (self.get('ROOTFS'), self.rootfs))
+
+        if self.fstype == 'nfs':
             return
 
         if self.rootfs and not os.path.exists(self.rootfs):
@@ -642,8 +657,6 @@ class BaseConfig(object):
         if not self.qemuboot:
             if self.get('DEPLOY_DIR_IMAGE'):
                 deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
-            elif os.getenv('DEPLOY_DIR_IMAGE'):
-                deploy_dir_image = os.getenv('DEPLOY_DIR_IMAGE')
             else:
                 logger.info("Can't find qemuboot conf file, DEPLOY_DIR_IMAGE is NULL!")
                 return
@@ -720,8 +733,8 @@ class BaseConfig(object):
                 # be able to call `bitbake -e`, then try:
                 # - get OE_TMPDIR from environment and guess paths based on it
                 # - get OECORE_NATIVE_SYSROOT from environment (for sdk)
-                tmpdir = os.environ.get('OE_TMPDIR', None)
-                oecore_native_sysroot = os.environ.get('OECORE_NATIVE_SYSROOT', None)
+                tmpdir = self.get('OE_TMPDIR', None)
+                oecore_native_sysroot = self.get('OECORE_NATIVE_SYSROOT', None)
                 if tmpdir:
                     logger.info('Setting STAGING_DIR_NATIVE and STAGING_BINDIR_NATIVE relative to OE_TMPDIR (%s)' % tmpdir)
                     hostos, _, _, _, machine = os.uname()
-- 
2.11.0.rc2.dirty


