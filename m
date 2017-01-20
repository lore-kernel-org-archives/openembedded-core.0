Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 78A44772CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567509"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:56 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:17 -0600
Message-Id: <5c6c8f72ec1fed7b1d5977d505dea2297c9e85d5.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 46/55] core/target/qemu.py Adds qemu target
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:56 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds qemu target to be used in testimage.
It uses the current QemuRunner class in order
to boot and control qemu.

[YOCTO #10231]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/target/qemu.py | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta/lib/oeqa/core/target/qemu.py

diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
new file mode 100644
index 0000000..641dd6a
--- /dev/null
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -0,0 +1,45 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+import sys
+import signal
+import time
+
+from .ssh import OESSHTarget
+from oeqa.utils.qemurunner import QemuRunner
+
+supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
+
+class OEQemuTarget(OESSHTarget):
+    def __init__(self, logger, ip, server_ip, timeout=300, user='root',
+            port=None, machine='', rootfs='', kernel='', kvm=False,
+            dump_dir='', dump_host_cmds='', display='', bootlog='',
+            tmpdir='', dir_image='', boottime=60):
+
+        super(OEQemuTarget, self).__init__(logger, ip, server_ip, timeout,
+                user, port)
+
+        self.ip = ip
+        self.server_ip = server_ip
+        self.machine = machine
+        self.rootfs = rootfs
+        self.kernel = kernel
+        self.kvm = kvm
+
+        self.runner = QemuRunner(machine=machine, rootfs=rootfs, tmpdir=tmpdir,
+                                 deploy_dir_image=dir_image, display=display,
+                                 logfile=bootlog, boottime=boottime,
+                                 use_kvm=kvm, dump_dir=dump_dir,
+                                 dump_host_cmds=dump_host_cmds)
+
+    def start(self, params=None, extra_bootparams=None):
+        if self.runner.start(params, extra_bootparams=extra_bootparams):
+            self.ip = self.runner.ip
+            self.server_ip = self.runner.server_ip
+        else:
+            self.stop()
+            raise RuntimeError("FAILED to start qemu - check the task log and the boot log")
+
+    def stop(self):
+        self.runner.stop()
-- 
2.1.4


