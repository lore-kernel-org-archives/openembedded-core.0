Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.28.1623164260548575968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 07:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 158EvdHs001336
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Jun 2021 07:57:39 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 8 Jun 2021 07:57:39 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Tue, 8 Jun 2021 07:57:39 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] oeqa/core/target/qemu.py: display contents of dumped files
Date: Tue, 8 Jun 2021 10:57:34 -0400
Message-ID: <20210608145734.3474-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

During do_testimage, if the target is not started within a certain
timeout, TEST_QEMUBOOT_TIMEOUT, host data is dumped to files for
each command in
${TMPDIR}/log/runtime-hostdump/<datetime>_qemu/host_<seq>_<command>.

Display the first 20 lines of top output and the last 20 lines of
bootlog to standard output for more context for the target not being
started up.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/lib/oeqa/core/target/qemu.py | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 4a5df4a9a8..79fd724f7d 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -8,6 +8,8 @@ import os
 import sys
 import signal
 import time
+import glob
+import subprocess
 from collections import defaultdict
 
 from .ssh import OESSHTarget
@@ -36,6 +38,8 @@ class OEQemuTarget(OESSHTarget):
         self.ovmf = ovmf
         self.use_slirp = slirp
         self.boot_patterns = boot_patterns
+        self.dump_dir = dump_dir
+        self.bootlog = bootlog
 
         self.runner = QemuRunner(machine=machine, rootfs=rootfs, tmpdir=tmpdir,
                                  deploy_dir_image=dir_image, display=display,
@@ -74,7 +78,28 @@ class OEQemuTarget(OESSHTarget):
                 self.server_ip = self.runner.server_ip
         else:
             self.stop()
-            raise RuntimeError("FAILED to start qemu - check the task log and the boot log")
+            # Display the first 20 lines of top and
+            # last 20 lines of the bootlog when the
+            # target is not being booted up.
+            topfile = glob.glob(self.dump_dir + "/*_qemu/host_*_top")
+            msg = "\n\n===== start: snippet =====\n\n"
+            for f in topfile:
+                msg += "file: %s\n\n" % f
+                with open(f) as tf:
+                    for x in range(20):
+                        msg += next(tf)
+            msg += "\n\n===== end: snippet =====\n\n"
+            blcmd = ["tail", "-20", self.bootlog]
+            msg += "===== start: snippet =====\n\n"
+            try:
+                out = subprocess.check_output(blcmd, stderr=subprocess.STDOUT, timeout=1).decode('utf-8')
+                msg += "file: %s\n\n" % self.bootlog
+                msg += out
+            except (subprocess.CalledProcessError, subprocess.TimeoutExpired, FileNotFoundError) as err:
+                msg += "Error running command: %s\n%s\n" % (blcmd, err)
+            msg += "\n\n===== end: snippet =====\n"
+
+            raise RuntimeError("FAILED to start qemu - check the task log and the boot log %s" % (msg))
 
     def stop(self):
         self.runner.stop()
-- 
2.29.2

