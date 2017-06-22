Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFFE177E58
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 08:30:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5M8U8kw022738
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 01:30:08 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Jun 2017 01:30:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jun 2017 01:30:06 -0700
Message-ID: <8134a5ecf72045c33cdfc80a0b647aee7674035e.1498120161.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498120161.git.liezhi.yang@windriver.com>
References: <cover.1498120161.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runqemu: drop RPC ports
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
X-List-Received-Date: Thu, 22 Jun 2017 08:30:08 -0000
Content-Type: text/plain

The following commit has removed rpc ports from runqemu-export-rootfs, so
runqemu should also remove them, otherwise "runqemu nfs" doesn't work. And use
abspath for nfsroot, otherwise it doesn't work when it is a relative path.

commit 6bb9860ef7ba9c84fe9bd3a81aa6555f67ebd38e
Author: Cody P Schafer <dev@codyps.com>
Date:   Tue Jun 6 18:30:49 2017 -0400

    runqemu-export-rootfs: don't change RPC ports

[YOCTO #11687]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 26328e5b512..41b870c9f7c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -784,16 +784,12 @@ class BaseConfig(object):
             all_instances.sort(key=int)
             self.nfs_instance = int(all_instances.pop()) + 1
 
-        mountd_rpcport = 21111 + self.nfs_instance
-        nfsd_rpcport = 11111 + self.nfs_instance
         nfsd_port = 3049 + 2 * self.nfs_instance
         mountd_port = 3048 + 2 * self.nfs_instance
 
         # Export vars for runqemu-export-rootfs
         export_dict = {
             'NFS_INSTANCE': self.nfs_instance,
-            'MOUNTD_RPCPORT': mountd_rpcport,
-            'NFSD_RPCPORT': nfsd_rpcport,
             'NFSD_PORT': nfsd_port,
             'MOUNTD_PORT': mountd_port,
         }
@@ -801,7 +797,7 @@ class BaseConfig(object):
             # Use '%s' since they are integers
             os.putenv(k, '%s' % v)
 
-        self.unfs_opts="nfsvers=3,port=%s,mountprog=%s,nfsprog=%s,udp,mountport=%s" % (nfsd_port, mountd_rpcport, nfsd_rpcport, mountd_port)
+        self.unfs_opts="nfsvers=3,port=%s,udp,mountport=%s" % (nfsd_port, mountd_port)
 
         # Extract .tar.bz2 or .tar.bz if no nfs dir
         if not (self.rootfs and os.path.isdir(self.rootfs)):
@@ -1006,7 +1002,7 @@ class BaseConfig(object):
 
         if self.fstype == 'nfs':
             self.rootfs_options = ''
-            k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server, self.rootfs, self.unfs_opts)
+            k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server, os.path.abspath(self.rootfs), self.unfs_opts)
             self.kernel_cmdline = 'root=%s rw highres=off' % k_root
 
         if self.fstype == 'none':
-- 
2.11.0


