Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web08.13352.1609961307751736775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 11:28:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Yp/KbySU;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVjOH3I3yoVdu5FwuR0eJAm0wWmp0aAFRKPoYGjPJHn+W17e9ZPN7X746NjJnNTuZ4P8Lpd2pIvqzrLKYfpEPEZx6LdTXTfrc79Mbx4Ruk9K0Eg8sFxHfGKqC2U4NVNJMjeLDXsphUr8uIUiI8Spel5SajNBuQm5n5TbCNnsiibGHgPo3XxxKU/Cc55zmNQHIEV9BMuRYBpZ0574bwk7h0Av6YAF5SKADbKTW5sjH8DwUttJo3NE/hufFOtU6azqYE4lcjGTBAfi9MGrd008DXgaeaGBFl6mhSpokwGlunbpf8Gor+UlcjXnzBjMadxB/0EXeByCISwB4uQucxweMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRyse7HW5wlA6rf0xDJnhyDEHEtAnxJLPk4WhkJbcZc=;
 b=gpuJXDSeeAUIbl0vDT5nBqGTBLRMrga8TATnTEaOOMI6TIMTSWpfOxdlwOXNq/IJW/OV3qSLP4hPewDrfY5yKOkFb4j90P8Y00wXMGsUuO04Aj5WU/63M36BylqfMKRCXnCS8k6HAMucsnkdYNXyeJHQf5jP7QRrh33OFyEP64j6/pAcHTjU+g7mzMHGHOMaNdUEr4hUtzFVwNiyEi4z20YZhfuvyTygj8J9w1/1PSJSS+bxNfKIzgi5/I0kOO2pWoejkJaCkLVvY3hvxnAwlcqA7yTExhhZYQOwtNvcjZoxk4RBiv3o847cQpA03V2fIyWqXL9RdCSm8yOaFgCcCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRyse7HW5wlA6rf0xDJnhyDEHEtAnxJLPk4WhkJbcZc=;
 b=Yp/KbySU30LLQBzgB0cRhGcWJQAVcwhB0SXvdYrea2AUD3M6mEQIiNKGc4XCauyZGLM3pXUqEpLNOXFg3MzwKBTjyhVEAtd1hqpV7nP4aIpMDHNpVQpEDIJ6sVsGIpJ93NGzde2vTY7Jl+8m/KJ87gr3oVG4zpoL1CEEbpaOr3s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB2031.namprd11.prod.outlook.com (2603:10b6:300:29::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Wed, 6 Jan
 2021 19:28:27 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1910:aec9:8c56:2264]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1910:aec9:8c56:2264%5]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 19:28:27 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemurunner: Add support for qmp commands
Date: Wed,  6 Jan 2021 11:28:06 -0800
Message-ID: <20210106192806.1335560-4-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106192806.1335560-1-saul.wold@windriver.com>
References: <20210106192806.1335560-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR21CA0070.namprd21.prod.outlook.com
 (2603:10b6:300:db::32) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.localdomain (71.238.119.71) by MWHPR21CA0070.namprd21.prod.outlook.com (2603:10b6:300:db::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.0 via Frontend Transport; Wed, 6 Jan 2021 19:28:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cbe42fc-7561-44a6-09c5-08d8b2793de2
X-MS-TrafficTypeDiagnostic: MWHPR11MB2031:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB2031BF3994BC3DEF3E145616EED00@MWHPR11MB2031.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7xQYS30JENM8+sJq5KWybHmfYw/T6vl2DP5r+Y6mQ0XzRevSOOWSBEj01pUoDnGjvS/xSAfPu1jvZOxbJdDWXTiXOBzDXVXRG4Dlj7TG3KnXtEZRT/GBVSB4nqUDqcjLx7DvX3r09J/bjh9C8CGoBnZhRugTfZTSAMmgPJJbb7Du1Ylt8aGgGzjGugauwKQFITtsnew2r/yqnMVELrp8TLltrkR34LHz69zN4Jxk/baLaV0aAzA3qTx6W5aNabKTQuYw03mNzYJQBILP8NO3qwkyvqo4FVw98Q9SayQn5EbQ+VeFb6lUr228WSX+7SrbZ/xuYNnhR2ehI+zmOWlZ7OPHoi/5ggRLyb21F1+afDapPrGTtZs7haDmt/Wb+DyzxsgzodptLQIQX8yjZD8oCrYU5XIEoUeO+lZ8c+n8Q1AtQ4vjqqokHNMaWotABLRElTylqsc8kqUc5fXB+N0TfEYie2DLKR5pnhaPOuBirSEYUfw1aFhq2T3qIfDdaw9ieSTDyqn9FpRuy+hVxaRD+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(66556008)(66476007)(6916009)(5660300002)(316002)(26005)(6506007)(966005)(2906002)(30864003)(66946007)(52116002)(8676002)(83380400001)(36756003)(478600001)(1076003)(956004)(2616005)(8936002)(86362001)(6666004)(6512007)(44832011)(6486002)(186003)(16526019)(403724002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?gG/kfMEGyWpebWYD5ft3pakrLbrSdmMD2iMFGeC5vf3id6mZ7bSJo4VgjPH1?=
 =?us-ascii?Q?FVPWpdRGOEHz/TaZIXhKnflxJyBpKkrkSGI11YD9ZMLuXSjYbO0znLO9tYfI?=
 =?us-ascii?Q?66m523Ti2Agus5VwMc62qaIObadTAuga3ubtxOf57K2U1/otdHTGA+13U18Z?=
 =?us-ascii?Q?2ibHW941p+JZC0780tX/csfXh8M/ah483UY8qHSWPXQzQ27iQvAhUkIsVpYQ?=
 =?us-ascii?Q?P2a4RwPNe2xMJZ8AT/95rPf6WHigoWEsXGRB/xFdDoWeMYxS4DspRFmVwbNY?=
 =?us-ascii?Q?hxLAN0ZW1SF2UJfXb0DM6VvgVkr8l/qo2M3RTl7DTjSfo/lwuUojMfp+HWmH?=
 =?us-ascii?Q?wVzR2Nt7e3FW1a9aAaJlTtuoBQURsnQCL6sQnmgjT/DM/JTvXMVKC4jSOJ69?=
 =?us-ascii?Q?O4fkI0neuFGasECiHnZUqpfC6yiBDf2q5v8EyhtPsTGZ5EdJ9fqePl9tWYM7?=
 =?us-ascii?Q?Hkd0lIUW7bcr2DX7dHpq217tVAhkIF4UQ8h3KC4VQGo3+k9EV+cfXxFI1n0C?=
 =?us-ascii?Q?FwAFZ0HEJ2ncACrvUyQuZyriPXIh5RfUfHsMOfe6GzOA0jcnunXbpHiKju8L?=
 =?us-ascii?Q?y0xON90DhBFTaP/S939xLvkVSIT6bkxAwlcvmbtoJobTex/rOft1aPdMrpBW?=
 =?us-ascii?Q?Nx14Gw+j3SxjES+ZbGmC0IUJMqsp6LJMPspsEYESRNw7bDlGargh0xGiQaK5?=
 =?us-ascii?Q?J8gP4PKz7iNA1B/wvhY+nqBThDKTWNR6kG85S4jiyPknlbsuNH+AQgomjs/7?=
 =?us-ascii?Q?mNONpgHjUOl0srLgrmxB5QsuJItLrr3HJdsEeh2F1B7iTFOvpyHjAA420ebw?=
 =?us-ascii?Q?IfQyYdsgqvbXZOyG8BxTmJbCzTxqDMzIBOBIJEpWlO3fx6ysVYvJKR4ifG8N?=
 =?us-ascii?Q?YSn3YlZMVH7/5jMWW/acPjFm8o2Cmp9T3exb7QCossiYNNybF9f9lyRW8K77?=
 =?us-ascii?Q?3MTpHJX2yp1a6c0SBq5SC4KZ27c7sQYsoisQZiL42dq8nyrUtjyOkyNve/+1?=
 =?us-ascii?Q?e/wQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 19:28:26.4389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbe42fc-7561-44a6-09c5-08d8b2793de2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mcnfREQIdCq3/DI4gj34qCH+uZnNujqqjgqss6EykV+yNJkFvIZU214F7TBOx1SKb6JTNMKS1OeVmH6brQpHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2031
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This adds support for the Qemu Machine Protocol [0] extending
the current dump process for Host and Target. The commands are
added in the testimage.bbclass.

Currently, we setup qemu to stall until qmp gets connected and
sends the initialization and continue commands, this works
correctly.

With this version, the monitor_dumper is created in OEQemuTarget
but then set in OESSHTarget as that's where we get the SSH failure
happens. Python's @property is used to create a setter/getter type
of setup in OESSHTarget to get overridden by OEQemuTarget.

By default the data is currently dumped to files for each command in
TMPDIR/log/runtime-hostdump/<date>_qmp/unknown_<seq>_qemu_monitor as
this is the naming convenstion in the dump.py code.

We use the qmp.py from qemu, which needs to get installed in a known
static location.

[0] https://github.com/qemu/qemu/blob/master/docs/interop/qmp-spec.txt

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/testimage.bbclass    |  6 ++++++
 meta/lib/oeqa/core/target/qemu.py |  6 ++++++
 meta/lib/oeqa/core/target/ssh.py  | 17 ++++++++++++++++-
 meta/lib/oeqa/targetcontrol.py    |  3 +++
 meta/lib/oeqa/utils/dump.py       | 31 ++++++++++++++++++++++++++++---
 meta/lib/oeqa/utils/qemurunner.py | 29 ++++++++++++++++++++++++++++-
 6 files changed, 87 insertions(+), 5 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclas=
s
index 78da4b09bd..5db384d342 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -127,6 +127,11 @@ testimage_dump_host () {
     netstat -an
 }
=20
+testimage_dump_monitor () {
+    query-status
+    query-block
+}
+
 python do_testimage() {
     testimage_main(d)
 }
@@ -319,6 +324,7 @@ def testimage_main(d):
     target_kwargs['powercontrol_extra_args'] =3D d.getVar("TEST_POWERCONTR=
OL_EXTRA_ARGS") or ""
     target_kwargs['serialcontrol_cmd'] =3D d.getVar("TEST_SERIALCONTROL_CM=
D") or None
     target_kwargs['serialcontrol_extra_args'] =3D d.getVar("TEST_SERIALCON=
TROL_EXTRA_ARGS") or ""
+    target_kwargs['testimage_dump_monitor'] =3D d.getVar("testimage_dump_m=
onitor") or ""
     target_kwargs['testimage_dump_target'] =3D d.getVar("testimage_dump_ta=
rget") or ""
=20
     def export_ssh_agent(d):
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/=
qemu.py
index 0f29414df5..a73d82d9af 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -12,6 +12,7 @@ from collections import defaultdict
=20
 from .ssh import OESSHTarget
 from oeqa.utils.qemurunner import QemuRunner
+from oeqa.utils.dump import MonitorDumper
 from oeqa.utils.dump import TargetDumper
=20
 supported_fstypes =3D ['ext3', 'ext4', 'cpio.gz', 'wic']
@@ -43,6 +44,11 @@ class OEQemuTarget(OESSHTarget):
                                  dump_host_cmds=3Ddump_host_cmds, logger=
=3Dlogger,
                                  serial_ports=3Dserial_ports, boot_pattern=
s =3D boot_patterns,=20
                                  use_ovmf=3Dovmf)
+        dump_monitor_cmds =3D kwargs.get("testimage_dump_monitor")
+        self.monitor_dumper =3D MonitorDumper(dump_monitor_cmds, dump_dir,=
 self.runner)
+        if self.monitor_dumper:
+            self.monitor_dumper.create_dir("qmp")
+
         dump_target_cmds =3D kwargs.get("testimage_dump_target")
         self.target_dumper =3D TargetDumper(dump_target_cmds, dump_dir, se=
lf.runner)
         self.target_dumper.create_dir("qemu")
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/s=
sh.py
index 461448dbc5..923a223b25 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -43,6 +43,7 @@ class OESSHTarget(OETarget):
         if port:
             self.ssh =3D self.ssh + [ '-p', port ]
             self.scp =3D self.scp + [ '-P', port ]
+        self._monitor_dumper =3D None
=20
     def start(self, **kwargs):
         pass
@@ -50,6 +51,15 @@ class OESSHTarget(OETarget):
     def stop(self, **kwargs):
         pass
=20
+    @property
+    def monitor_dumper(self):
+        return self._monitor_dumper
+
+    @monitor_dumper.setter
+    def monitor_dumper(self, dumper):
+        self._monitor_dumper =3D dumper
+        self.monitor_dumper.dump_monitor()
+
     def _run(self, command, timeout=3DNone, ignore_status=3DTrue):
         """
             Runs command in target using SSHProcess.
@@ -87,9 +97,14 @@ class OESSHTarget(OETarget):
             processTimeout =3D self.timeout
=20
         status, output =3D self._run(sshCmd, processTimeout, True)
-        self.logger.debug('Command: %s\nOutput:  %s\n' % (command, output)=
)
+        self.logger.debug('Command: %s\nStatus: %d Output:  %s\n' % (comma=
nd, status, output))
         if (status =3D=3D 255) and (('No route to host') in output):
+            if self.monitor_dumper:
+                self.monitor_dumper.dump_monitor()
+        if status =3D=3D 255:
             self.target_dumper.dump_target()
+            if self.monitor_dumper:
+                self.monitor_dumper.dump_monitor()
         return (status, output)
=20
     def copyTo(self, localSrc, remoteDst):
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.p=
y
index 19f5a4ea7e..15709ad5d1 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -17,6 +17,7 @@ from oeqa.utils.sshcontrol import SSHControl
 from oeqa.utils.qemurunner import QemuRunner
 from oeqa.utils.qemutinyrunner import QemuTinyRunner
 from oeqa.utils.dump import TargetDumper
+from oeqa.utils.dump import MonitorDumper
 from oeqa.controllers.testtargetloader import TestTargetLoader
 from abc import ABCMeta, abstractmethod
=20
@@ -108,6 +109,7 @@ class QemuTarget(BaseTarget):
         self.qemulog =3D os.path.join(self.testdir, "qemu_boot_log.%s" % s=
elf.datetime)
         dump_target_cmds =3D d.getVar("testimage_dump_target")
         dump_host_cmds =3D d.getVar("testimage_dump_host")
+        dump_monitor_cmds =3D d.getVar("testimage_dump_monitor")
         dump_dir =3D d.getVar("TESTIMAGE_DUMP_DIR")
         if not dump_dir:
             dump_dir =3D os.path.join(d.getVar('LOG_DIR'), 'runtime-hostdu=
mp')
@@ -147,6 +149,7 @@ class QemuTarget(BaseTarget):
                             serial_ports =3D len(d.getVar("SERIAL_CONSOLES=
").split()))
=20
         self.target_dumper =3D TargetDumper(dump_target_cmds, dump_dir, se=
lf.runner)
+        self.monitor_dumper =3D MonitorDumper(dump_monitor_cmds, dump_dir,=
 self.runner)
=20
     def deploy(self):
         bb.utils.mkdirhier(self.testdir)
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 09a44329e0..7391126c8b 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -4,6 +4,7 @@
=20
 import os
 import sys
+import json
 import errno
 import datetime
 import itertools
@@ -51,6 +52,8 @@ class BaseDumper(object):
             prefix =3D "host"
         elif isinstance(self, TargetDumper):
             prefix =3D "target"
+        elif isinstance(self, MonitorDumper):
+            prefix =3D "qmp"
         else:
             prefix =3D "unknown"
         for i in itertools.count():
@@ -58,9 +61,12 @@ class BaseDumper(object):
             fullname =3D os.path.join(self.dump_dir, filename)
             if not os.path.exists(fullname):
                 break
-        with open(fullname, 'w') as dump_file:
-            dump_file.write(output)
-
+        if isinstance(self, MonitorDumper):
+            with open(fullname, 'w') as json_file:
+                json.dump(output, json_file, indent=3D4)
+        else:
+            with open(fullname, 'w') as dump_file:
+                dump_file.write(output)
=20
 class HostDumper(BaseDumper):
     """ Class to get dumps from the host running the tests """
@@ -96,3 +102,22 @@ class TargetDumper(BaseDumper):
             except:
                 print("Tried to dump info from target but "
                         "serial console failed")
+                print("Failed CMD: %s" % (cmd))
+
+class MonitorDumper(BaseDumper):
+    """ Class to get dumps via the Qemu Monitor, it only works with QemuRu=
nner """
+
+    def __init__(self, cmds, parent_dir, runner):
+        super(MonitorDumper, self).__init__(cmds, parent_dir)
+        self.runner =3D runner
+
+    def dump_monitor(self, dump_dir=3D""):
+        if dump_dir:
+            self.dump_dir =3D dump_dir
+        for cmd in self.cmds:
+            try:
+                output =3D self.runner.run_monitor(cmd)
+                self._write_dump(cmd, output)
+            except:
+                print("Failed to dump montor data")
+                print("Failed CMD: %s" % (cmd))
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemuru=
nner.py
index 77ec939ad7..4459244d45 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -20,9 +20,13 @@ import string
 import threading
 import codecs
 import logging
+import tempfile
 from oeqa.utils.dump import HostDumper
 from collections import defaultdict
=20
+sys.path.append('./tmp/hosttools')
+import qmp
+
 # Get Unicode non printable control chars
 control_range =3D list(range(0,32))+list(range(127,160))
 control_chars =3D [chr(x) for x in control_range
@@ -168,6 +172,8 @@ class QemuRunner:
         return self.launch(launch_cmd, qemuparams=3Dqemuparams, get_ip=3Dg=
et_ip, extra_bootparams=3Dextra_bootparams, env=3Denv)
=20
     def launch(self, launch_cmd, get_ip =3D True, qemuparams =3D None, ext=
ra_bootparams =3D None, env =3D None):
+        qmp_port =3D self.tmpdir + "/." + next(tempfile._get_candidate_nam=
es())
+
         try:
             if self.serial_ports >=3D 2:
                 self.threadsock, threadport =3D self.create_socket()
@@ -185,6 +191,8 @@ class QemuRunner:
         if os.path.exists(self.qemu_pidfile):
             os.remove(self.qemu_pidfile)
         self.qemuparams =3D 'bootparams=3D"{0}" qemuparams=3D"-pidfile {1}=
"'.format(bootparams, self.qemu_pidfile)
+        qemuparams +=3D ' -S -qmp unix:%s,server,wait' % (qmp_port)
+        qemuparams +=3D ' -monitor tcp:localhost:4444,server,nowait'
         if qemuparams:
             self.qemuparams =3D self.qemuparams[:-1] + " " + qemuparams + =
" " + '\"'
=20
@@ -251,6 +259,19 @@ class QemuRunner:
         if self.runqemu_exited:
             return False
=20
+        # Create the client socket for the QEMU Monitor Control Socket
+        # This will allow us to read status from Qemu if the the process
+        # is still alive
+        try:
+            self.qmp =3D qmp.QEMUMonitorProtocol(qmp_port)
+            self.qmp.connect()
+        except socket.error as msg:
+            self.logger.error("Failed to connect qemu monitor socket: %s" =
% msg[1])
+            return False
+
+        # Release the qemu porcess to continue running
+        self.run_monitor('cont')
+
         if not self.is_alive():
             self.logger.error("Qemu pid didn't appear in %s seconds (%s)" =
%
                               (self.runqemutime, time.strftime("%D %H:%M:%=
S")))
@@ -376,7 +397,6 @@ class QemuRunner:
                         sock.close()
                         stopread =3D True
=20
-
         if not reachedlogin:
             if time.time() >=3D endtime:
                 self.logger.warning("Target didn't reach login banner in %=
d seconds (%s)" %
@@ -391,6 +411,7 @@ class QemuRunner:
             self.stop()
             return False
=20
+        self._dump_host()
         # If we are not able to login the tests can continue
         try:
             (status, output) =3D self.run_serial(self.boot_patterns['send_=
login_user'], raw=3DTrue, timeout=3D120)
@@ -437,6 +458,9 @@ class QemuRunner:
             self.runqemu.stdout.close()
             self.runqemu_exited =3D True
=20
+        if hasattr(self, 'qmp') and self.qmp:
+            self.qmp.close()
+            self.qmp =3D None
         if hasattr(self, 'server_socket') and self.server_socket:
             self.server_socket.close()
             self.server_socket =3D None
@@ -495,6 +519,9 @@ class QemuRunner:
                         return True
         return False
=20
+    def run_monitor(self, command, timeout=3D60):
+        return self.qmp.cmd(command)
+
     def run_serial(self, command, raw=3DFalse, timeout=3D60):
         # We assume target system have echo to get command status
         if not raw:
--=20
2.25.1

