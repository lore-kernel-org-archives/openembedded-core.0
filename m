Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 90E5F6074F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 09:48:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 01:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,498,1534834800"; d="scan'208";a="273593277"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 13 Nov 2018 01:48:08 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 17:32:56 +0800
Message-Id: <1542101577-59901-3-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1542101577-59901-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1542101577-59901-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 3/4] oeqa/qemu: Add support for slirp
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
X-List-Received-Date: Tue, 13 Nov 2018 09:48:07 -0000

Enable qemu for slirp. Initialize Qemurunner with slirp. Setup
ip and port attribute to enable connection with qemu running
with slirp.

[YOCTO#10713]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/core/target/qemu.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index bf3b633..95f14c8 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -13,7 +13,7 @@ supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
 
 class OEQemuTarget(OESSHTarget):
     def __init__(self, logger, ip, server_ip, timeout=300, user='root',
-            port=None, machine='', rootfs='', kernel='', kvm=False,
+            port=None, machine='', rootfs='', kernel='', kvm=False, slirp=False,
             dump_dir='', dump_host_cmds='', display='', bootlog='',
             tmpdir='', dir_image='', boottime=60, **kwargs):
 
@@ -26,16 +26,25 @@ class OEQemuTarget(OESSHTarget):
         self.rootfs = rootfs
         self.kernel = kernel
         self.kvm = kvm
+        self.slirp = slirp
 
         self.runner = QemuRunner(machine=machine, rootfs=rootfs, tmpdir=tmpdir,
                                  deploy_dir_image=dir_image, display=display,
                                  logfile=bootlog, boottime=boottime,
-                                 use_kvm=kvm, dump_dir=dump_dir,
+                                 use_kvm=kvm, use_slirp=slirp, dump_dir=dump_dir,
                                  dump_host_cmds=dump_host_cmds, logger=logger)
 
     def start(self, params=None, extra_bootparams=None):
         if self.runner.start(params, extra_bootparams=extra_bootparams):
             self.ip = self.runner.ip
+            if self.slirp:
+                target_ip_port = self.runner.ip.split(':')
+                if len(target_ip_port) == 2:
+                    target_ip = target_ip_port[0]
+                    port = target_ip_port[1]
+                    self.ip = target_ip
+                    self.ssh = self.ssh + ['-p', port]
+                    self.scp = self.scp + ['-P', port]
             self.server_ip = self.runner.server_ip
         else:
             self.stop()
-- 
2.7.4


