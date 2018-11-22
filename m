Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 095BB6C138
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 09:25:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2018 01:25:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,265,1539673200"; d="scan'208";a="93126064"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga006.jf.intel.com with ESMTP; 22 Nov 2018 01:25:52 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 17:10:43 +0800
Message-Id: <1542877846-77570-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1542877846-77570-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1542877846-77570-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 1/4 v2] oeqa/qemu & runtime: qemu do not need ip input from external
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
X-List-Received-Date: Thu, 22 Nov 2018 09:25:53 -0000

Qemu do not use the ip input from external. It will
retrieve ip from QemuRunner instance and assign
ip value.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/core/target/qemu.py | 5 ++---
 meta/lib/oeqa/runtime/context.py  | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index bf3b633..538bf12 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -12,15 +12,14 @@ from oeqa.utils.qemurunner import QemuRunner
 supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
 
 class OEQemuTarget(OESSHTarget):
-    def __init__(self, logger, ip, server_ip, timeout=300, user='root',
+    def __init__(self, logger, server_ip, timeout=300, user='root',
             port=None, machine='', rootfs='', kernel='', kvm=False,
             dump_dir='', dump_host_cmds='', display='', bootlog='',
             tmpdir='', dir_image='', boottime=60, **kwargs):
 
-        super(OEQemuTarget, self).__init__(logger, ip, server_ip, timeout,
+        super(OEQemuTarget, self).__init__(logger, None, server_ip, timeout,
                 user, port)
 
-        self.ip = ip
         self.server_ip = server_ip
         self.machine = machine
         self.rootfs = rootfs
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index a7f3823..943e29b 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -101,7 +101,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
         if target_type == 'simpleremote':
             target = OESSHTarget(logger, target_ip, server_ip, **kwargs)
         elif target_type == 'qemu':
-            target = OEQemuTarget(logger, target_ip, server_ip, **kwargs)
+            target = OEQemuTarget(logger, server_ip, **kwargs)
         else:
             # XXX: This code uses the old naming convention for controllers and
             # targets, the idea it is to leave just targets as the controller
-- 
2.7.4


