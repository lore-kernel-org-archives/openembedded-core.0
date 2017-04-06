Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A866277B41
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 06:41:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v366fgVZ005394
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Apr 2017 23:41:42 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Apr 2017 23:41:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Apr 2017 23:41:35 -0700
Message-ID: <ae5280da253521b56d2ee710534d5710cf88a162.1491460816.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491460816.git.liezhi.yang@windriver.com>
References: <cover.1491460816.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] runqemu: use self.rootfs to replace self.nfs_dir
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
X-List-Received-Date: Thu, 06 Apr 2017 06:41:41 -0000
Content-Type: text/plain

We can use self.rootfs as self.nfs_dir when self.fstype is nfs, this can
reduce the code's complexity and we can re-use the code of checking
ROOTFS conflictions.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 71e3cdbe80..23a344da35 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -178,7 +178,6 @@ class BaseConfig(object):
 
         self.qemu_opt = ''
         self.qemu_opt_script = ''
-        self.nfs_dir = ''
         self.clean_nfs_dir = False
         self.nfs_server = ''
         self.rootfs = ''
@@ -284,12 +283,11 @@ class BaseConfig(object):
 
     def check_arg_nfs(self, p):
         if os.path.isdir(p):
-            self.nfs_dir = p
+            self.rootfs = p
         else:
             m = re.match('(.*):(.*)', p)
             self.nfs_server = m.group(1)
-            self.nfs_dir = m.group(2)
-        self.rootfs = ""
+            self.rootfs = m.group(2)
         self.check_arg_fstype('nfs')
 
     def check_arg_path(self, p):
@@ -759,7 +757,7 @@ class BaseConfig(object):
         print('MACHINE: [%s]' % self.get('MACHINE'))
         print('FSTYPE: [%s]' % self.fstype)
         if self.fstype  == 'nfs':
-            print('NFS_DIR: [%s]' % self.nfs_dir)
+            print('NFS_DIR: [%s]' % self.rootfs)
         else:
             print('ROOTFS: [%s]' % self.rootfs)
         if self.ovmf_bios:
@@ -804,13 +802,13 @@ class BaseConfig(object):
 
         self.unfs_opts="nfsvers=3,port=%s,mountprog=%s,nfsprog=%s,udp,mountport=%s" % (nfsd_port, mountd_rpcport, nfsd_rpcport, mountd_port)
 
-        # Extract .tar.bz2 or .tar.bz if no self.nfs_dir
-        if not self.nfs_dir:
+        # Extract .tar.bz2 or .tar.bz if no nfs dir
+        if not (self.rootfs and os.path.isdir(self.rootfs)):
             src_prefix = '%s/%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_LINK_NAME'))
             dest = "%s-nfsroot" % src_prefix
             if os.path.exists('%s.pseudo_state' % dest):
                 logger.info('Use %s as NFS_DIR' % dest)
-                self.nfs_dir = dest
+                self.rootfs = dest
             else:
                 src = ""
                 src1 = '%s.tar.bz2' % src_prefix
@@ -827,10 +825,10 @@ class BaseConfig(object):
                 if subprocess.call(cmd, shell=True) != 0:
                     raise Exception('Failed to run %s' % cmd)
                 self.clean_nfs_dir = True
-                self.nfs_dir = dest
+                self.rootfs = dest
 
         # Start the userspace NFS server
-        cmd = 'runqemu-export-rootfs start %s' % self.nfs_dir
+        cmd = 'runqemu-export-rootfs start %s' % self.rootfs
         logger.info('Running %s...' % cmd)
         if subprocess.call(cmd, shell=True) != 0:
             raise Exception('Failed to run %s' % cmd)
@@ -1001,7 +999,7 @@ class BaseConfig(object):
 
         if self.fstype == 'nfs':
             self.rootfs_options = ''
-            k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server, self.nfs_dir, self.unfs_opts)
+            k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server, self.rootfs, self.unfs_opts)
             self.kernel_cmdline = 'root=%s rw highres=off' % k_root
 
         if self.fstype == 'none':
@@ -1147,7 +1145,7 @@ class BaseConfig(object):
 
         if self.nfs_running:
             logger.info("Shutting down the userspace NFS server...")
-            cmd = "runqemu-export-rootfs stop %s" % self.nfs_dir
+            cmd = "runqemu-export-rootfs stop %s" % self.rootfs
             logger.info('Running %s' % cmd)
             subprocess.call(cmd, shell=True)
 
@@ -1156,9 +1154,9 @@ class BaseConfig(object):
             subprocess.call(cmd, shell=True)
 
         if self.clean_nfs_dir:
-            logger.info('Removing %s' % self.nfs_dir)
-            shutil.rmtree(self.nfs_dir)
-            shutil.rmtree('%s.pseudo_state' % self.nfs_dir)
+            logger.info('Removing %s' % self.rootfs)
+            shutil.rmtree(self.rootfs)
+            shutil.rmtree('%s.pseudo_state' % self.rootfs)
 
     def load_bitbake_env(self, mach=None):
         if self.bitbake_e:
-- 
2.11.0.rc2.dirty


