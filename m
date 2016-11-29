Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDD5271AB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 07:36:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAT7ZsA7007920
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 28 Nov 2016 23:35:54 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 28 Nov 2016 23:35:53 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2016 23:35:48 -0800
Message-ID: <bbb3fa123f5f06b91458912ee3cf4dc1c0d9897d.1480404884.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1480404884.git.liezhi.yang@windriver.com>
References: <cover.1480404884.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] runqemu: support mutiple qemus running when nfs
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
X-List-Received-Date: Tue, 29 Nov 2016 07:36:03 -0000
Content-Type: text/plain

Fixed:
* In build1:
  $ runqemu nfs qemux86-64
  In build2:
  $ runqemu nfs qemux86-64

  It would fail before since the port numerbs and conf files are
  conflicted, now make runqemu-export-rootfs work together with runqemu to
  fix the problem.

* And we don't need export PSEUDO_LOCALSTATEDIR in runqemu, the
  runqemu-export-rootfs can handle it well based on NFS_EXPORT_DIR.

* Remove "async" option from unfsd to fix warning in syslog:
  Warning: unknown exports option `async' ignored

* Fixed typos

Both slirp and tap can work.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu               | 55 ++++++++++++++++++++++++++++---------------
 scripts/runqemu-export-rootfs | 10 ++++----
 2 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c737eb2..a10270c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -690,17 +690,33 @@ class BaseConfig(object):
             else:
                 self.nfs_server = '192.168.7.1'
 
-        nfs_instance = int(self.nfs_instance)
-
-        mountd_rpcport = 21111 + nfs_instance
-        nfsd_rpcport = 11111 + nfs_instance
-        nfsd_port = 3049 + 2 * nfs_instance
-        mountd_port = 3048 + 2 * nfs_instance
-        unfs_opts="nfsvers=3,port=%s,mountprog=%s,nfsprog=%s,udp,mountport=%s" % (nfsd_port, mountd_rpcport, nfsd_rpcport, mountd_port)
-        self.unfs_opts = unfs_opts
+        # Figure out a new nfs_instance to allow multiple qemus running.
+        cmd = "ps aux"
+        ps = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
+        pattern = '/bin/unfsd .* -i .*\.pid -e .*/exports([0-9]+) '
+        all_instances = re.findall(pattern, ps, re.M)
+        if all_instances:
+            all_instances.sort(key=int)
+            self.nfs_instance = int(all_instances.pop()) + 1
+
+        mountd_rpcport = 21111 + self.nfs_instance
+        nfsd_rpcport = 11111 + self.nfs_instance
+        nfsd_port = 3049 + 2 * self.nfs_instance
+        mountd_port = 3048 + 2 * self.nfs_instance
+
+        # Export vars for runqemu-export-rootfs
+        export_dict = {
+            'NFS_INSTANCE': self.nfs_instance,
+            'MOUNTD_RPCPORT': mountd_rpcport,
+            'NFSD_RPCPORT': nfsd_rpcport,
+            'NFSD_PORT': nfsd_port,
+            'MOUNTD_PORT': mountd_port,
+        }
+        for k, v in export_dict.items():
+            # Use '%s' since they are integers
+            os.putenv(k, '%s' % v)
 
-        p = '%s/.runqemu-sdk/pseudo' % os.getenv('HOME')
-        os.putenv('PSEUDO_LOCALSTATEDIR', p)
+        self.unfs_opts="nfsvers=3,port=%s,mountprog=%s,nfsprog=%s,udp,mountport=%s" % (nfsd_port, mountd_rpcport, nfsd_rpcport, mountd_port)
 
         # Extract .tar.bz2 or .tar.bz if no self.nfs_dir
         if not self.nfs_dir:
@@ -728,7 +744,7 @@ class BaseConfig(object):
                 self.nfs_dir = dest
 
         # Start the userspace NFS server
-        cmd = 'runqemu-export-rootfs restart %s' % self.nfs_dir
+        cmd = 'runqemu-export-rootfs start %s' % self.nfs_dir
         logger.info('Running %s...' % cmd)
         if subprocess.call(cmd, shell=True) != 0:
             raise Exception('Failed to run %s' % cmd)
@@ -737,6 +753,8 @@ class BaseConfig(object):
 
 
     def setup_slirp(self):
+        """Setup user networking"""
+
         if self.fstype == 'nfs':
             self.setup_nfs()
         self.kernel_cmdline_script += ' ip=dhcp'
@@ -804,14 +822,13 @@ class BaseConfig(object):
             logger.error("Failed to setup tap device. Run runqemu-gen-tapdevs to manually create.")
             return 1
         self.tap = tap
-        n0 = tap[3:]
-        n1 = int(n0) * 2 + 1
-        n2 = n1 + 1
-        self.nfs_instance = n0
+        tapnum = int(tap[3:])
+        gateway = tapnum * 2 + 1
+        client = gateway + 1
         if self.fstype == 'nfs':
             self.setup_nfs()
-        self.kernel_cmdline_script += " ip=192.168.7.%s::192.168.7.%s:255.255.255.0" % (n2, n1)
-        mac = "52:54:00:12:34:%02x" % n2
+        self.kernel_cmdline_script += " ip=192.168.7.%s::192.168.7.%s:255.255.255.0" % (client, gateway)
+        mac = "52:54:00:12:34:%02x" % client
         qb_tap_opt = self.get('QB_TAP_OPT')
         if qb_tap_opt:
             qemu_tap_opt = qb_tap_opt.replace('@TAP@', tap).replace('@MAC@', mac)
@@ -854,11 +871,11 @@ class BaseConfig(object):
                         vm_drive = '-drive if=none,id=hd,file=%s,format=%s -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd' \
                                        % (self.rootfs, rootfs_format)
                     elif subprocess.call(cmd2, shell=True) == 0:
-                        logger.info('Using scsi drive')
+                        logger.info('Using ide drive')
                         vm_drive = "%s,format=%s" % (self.rootfs, rootfs_format)
                     else:
                         logger.warn("Can't detect drive type %s" % self.rootfs)
-                        logger.warn('Tring to use virtio block drive')
+                        logger.warn('Trying to use virtio block drive')
                         vm_drive = '-drive if=virtio,file=%s,format=%s' % (self.rootfs, rootfs_format)
                 self.rootfs_options = '%s -no-reboot' % vm_drive
             self.kernel_cmdline = 'root=%s rw highres=off' % (self.get('QB_KERNEL_ROOT'))
diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 0dd3eba..7ebc071 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -78,13 +78,13 @@ if [ ! -d "$PSEUDO_LOCALSTATEDIR" ]; then
 fi
 
 # rpc.mountd RPC port
-MOUNTD_RPCPORT=$[ 21111 + $NFS_INSTANCE ]
+MOUNTD_RPCPORT=${MOUNTD_RPCPORT:=$[ 21111 + $NFS_INSTANCE ]}
 # rpc.nfsd RPC port
-NFSD_RPCPORT=$[ 11111 + $NFS_INSTANCE ]
+NFSD_RPCPORT=${NFSD_RPCPORT:=$[ 11111 + $NFS_INSTANCE ]}
 # NFS server port number
-NFSD_PORT=$[ 3049 + 2 * $NFS_INSTANCE ]
+NFSD_PORT=${NFSD_PORT:=$[ 3049 + 2 * $NFS_INSTANCE ]}
 # mountd port number
-MOUNTD_PORT=$[ 3048 + 2 * $NFS_INSTANCE ]
+MOUNTD_PORT=${MOUNTD_PORT:=$[ 3048 + 2 * $NFS_INSTANCE ]}
 
 ## For debugging you would additionally add
 ## --debug all
@@ -109,7 +109,7 @@ case "$1" in
 	fi
 
 	echo "Creating exports file..."
-	echo "$NFS_EXPORT_DIR (rw,async,no_root_squash,no_all_squash,insecure)" > $EXPORTS
+	echo "$NFS_EXPORT_DIR (rw,no_root_squash,no_all_squash,insecure)" > $EXPORTS
 
 	echo "Starting User Mode nfsd"
 	echo "  $PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/bin/unfsd $UNFSD_OPTS"
-- 
2.9.0


