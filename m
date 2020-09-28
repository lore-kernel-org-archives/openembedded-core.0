Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2180.1601318865039599263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 11:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: saul.wold@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08SIlC0H031907
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 11:47:33 -0700
Received: from soho-swold-l2.corp.ad.wrs.com (147.11.14.244) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Mon, 28 Sep 2020 11:47:21 -0700
From: "Saul Wold" <Saul.Wold@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [RFC v2 1/2] testimage: Add testimage_dump_target to kwargs
Date: Mon, 28 Sep 2020 11:47:19 -0700
Message-ID: <20200928184720.1195777-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This passes the list of commands to run on the OEQemuTarget when
the TargetDumper needs to run in a test context due to a failure
on the target.

This is added here as a kwargs because the 'd' dictionary is not
available in the staticmethod getTarget in the
OERuntimeTestContextExecutor class. The OEQemuTarget is different
from the QemuTarget which already uses the list of commands from
testimage_dump_target from 'd'. The create_dir() is needed to
initialize the TargetDumper's dump_dir variable.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/testimage.bbclass    | 1 +
 meta/lib/oeqa/core/target/qemu.py | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 6c8bedcd65..e3feef02f8 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -319,6 +319,7 @@ def testimage_main(d):
     target_kwargs['powercontrol_extra_args'] = d.getVar("TEST_POWERCONTROL_EXTRA_ARGS") or ""
     target_kwargs['serialcontrol_cmd'] = d.getVar("TEST_SERIALCONTROL_CMD") or None
     target_kwargs['serialcontrol_extra_args'] = d.getVar("TEST_SERIALCONTROL_EXTRA_ARGS") or ""
+    target_kwargs['testimage_dump_target'] = d.getVar("testimage_dump_target") or ""
 
     def export_ssh_agent(d):
         import os
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 295e8765e9..0f29414df5 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -12,6 +12,7 @@ from collections import defaultdict
 
 from .ssh import OESSHTarget
 from oeqa.utils.qemurunner import QemuRunner
+from oeqa.utils.dump import TargetDumper
 
 supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
 
@@ -42,6 +43,9 @@ class OEQemuTarget(OESSHTarget):
                                  dump_host_cmds=dump_host_cmds, logger=logger,
                                  serial_ports=serial_ports, boot_patterns = boot_patterns, 
                                  use_ovmf=ovmf)
+        dump_target_cmds = kwargs.get("testimage_dump_target")
+        self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
+        self.target_dumper.create_dir("qemu")
 
     def start(self, params=None, extra_bootparams=None, runqemuparams=''):
         if self.use_slirp and not self.server_ip:
-- 
2.25.1

