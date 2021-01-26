Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.16040.1611682280660642658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 09:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=G0VcKC+g;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPos0tj3UEV8O8iZmvbkUrSnHVwoeDBKBiDwoa0v3KaSMh4feSlBg5mhIAfYO+Hg75MkWEoo5+Domj2oI/3K0A5VH2cIoBvwlYoZ29HWiroaEsT32JtcCpdcGixJWQI0jWNIlYPxBNpvuxmR9t54bQ6ZsxykxRGB4ZKquUd+AgkYTVdd7LYG9k1eDmen1bzy2i3TLajSOUylJGqOsMt3DQ/PlnfmVH4MqV8bTsZf5stPz7xxwWVdyO0nfGnR1H3plMIZrjngAuxNhu6SVmiShMFaS+dVlZGkxN8OfgHg+G6T1jfEIQtMv1CGf1Eu9ilCRZgphRN80UTlsflrPpAfGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Akbk+NHMIKLo3nG1F3OFzO28dSE6et7nKnjV8aKvme0=;
 b=l39lA20noGH5AHQDbSF3OPLmLHANpVle2Zr8xWw758J14kuAfZT2RQG07JBU5RHqV9H5ngKKz2w19jmApONr3KoUuf2TgtRJfCbqBHXlGa4UgR+bH39U3+so7b1xfiuQ18033ND+MPxPphWUJzIGCtTCOYY5y8UMnrx3k1GiS0W89+/AY5g61e3p3Nw++XzoYJa+ix6ontTVwHKRE2kNvkal0Ic4GWRCqeWgR9K406WzSksUl4HFrFK9uPr4E1hj1r6t1fOclgAym02KF4u0pa1e+Xt+4Q7XKYxxgmHSivNfivVWfol4FyxNb1tTZBDBakfLZDPNKzaKqj8L/Io8/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Akbk+NHMIKLo3nG1F3OFzO28dSE6et7nKnjV8aKvme0=;
 b=G0VcKC+gRT4J3a1Ifu3fZneWgNVCFvtWYjokVhXZZTdvUKSlopdxQeXhb5s5nnXF0sg8gfVmNQWyixWFCGoL03GBTJXCL04Yu3D44UMz5DG2AqX9hM3L7PFterTo35nNGOxibk1JIbxCNjpmgch8umHhfupujPc77QdYCSUIg2k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1376.namprd11.prod.outlook.com (2603:10b6:300:1d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 26 Jan
 2021 17:31:18 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f%4]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 17:31:18 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemurunner: Add support for qmp commands
Date: Tue, 26 Jan 2021 09:31:07 -0800
Message-ID: <20210126173107.2204111-3-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126173107.2204111-1-saul.wold@windriver.com>
References: <20210126173107.2204111-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: CO2PR04CA0059.namprd04.prod.outlook.com
 (2603:10b6:102:1::27) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by CO2PR04CA0059.namprd04.prod.outlook.com (2603:10b6:102:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Tue, 26 Jan 2021 17:31:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b794509-fb55-4224-97a9-08d8c220309f
X-MS-TrafficTypeDiagnostic: MWHPR11MB1376:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1376DA6EF0C0DED9BC2C3332EEBC9@MWHPR11MB1376.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SLUMILb3+zjDyfadwl+/y/PO3ceVuXUJCnBfBCqmghPfNeMB5NzvVDsl6e3pHKk43m95Uy7CGVZ+QxWnKLwasjz2XFAxD531+bH5tdX1Ba8HDtVo79zIQ6YK0ceHAYcGc7siLnHGG3Vhq3Mcf8DC25wdCVh4kmJK3xzYS5BgimDYhi9t78d5yEVn9CU54WPIt3EHR7JNswQPPVya+woUdwl9LkKuZTZJ/jN+xfuCd8aikv2Q6iyerOdVXoR6G5AAOd3n9Hv/wrko63Wf9ygCZcEYhM5nFTIMtvA1X5tJf2dUFYM81qPUUlT6y8idg01Kt7Wp4PqVj7mvPBT3lJ5GtJiA+EqCxQRj2JUmV35XWQA4NaKzBn5CXjpvSiKo3E8z3ts6nIrB9jAKBZQSQZPfjwJQ8tOEDYoU7tD7aImgDRqVdTPBCoITwlouuzynChVolY7JMDxoFWo+4wwTzyP7C6kx28qtr5bujI0eJxbHCq5qeboerLxbRyl51GE/+jwbXjYvVse6ltVGZk4896jO+blKWeZ6K/FIaOqZl1h52/oxgMSs5nPiMXqSsWEojONwJro+G5FURgkOsqPZJT9F1MBqj8yXqVd6g+fgLWBb+yLU7foj/0vfKe/bnqy3ko4X+kqEYiMIGeCCpW8yABXf+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(83380400001)(26005)(478600001)(6512007)(16526019)(30864003)(8676002)(2616005)(6506007)(6666004)(44832011)(2906002)(6916009)(66556008)(66476007)(66946007)(1076003)(316002)(5660300002)(6486002)(8936002)(36756003)(966005)(186003)(86362001)(956004)(52116002)(403724002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?mCpjThjUzmjuZcBLo3d6m+Q5cJaS5egZThTAa4SyOYYU1SH5eaN9kcsc2rtS?=
 =?us-ascii?Q?S8zdEn46yDWbijPDu41i2PtS8jLFqROwrWp5nZNBOG9LXx8lPb69UmCy2NYS?=
 =?us-ascii?Q?Hh/HopjK5faNxnSgWJzfcke0FJmkiIEeIMQdagODqlBGgMWD0OJdEWX2UyAM?=
 =?us-ascii?Q?BD8t9vPXwf5M3Dia0XVYWcUwU1Fvc5s9aP0DRjObbFQYYLHK9nAcTyDWaMBa?=
 =?us-ascii?Q?MReykBrUZup79iVl/B/VCvaBzZj8KBMmOydPMU4JYFM/nL9c0Tat+Hn/VkYd?=
 =?us-ascii?Q?DkaUH7SHYanSZdE6+AEZNfS/Yvn6UK825yR3nA8P7O6PdYLqcYrgLO2VoY31?=
 =?us-ascii?Q?Rphyveu4wyQpwZ875F2YOqzN/FgyNx6X9awru0DbL5YqFJciakum21g8YkJ+?=
 =?us-ascii?Q?9Hh+dd2Pqx7ZVvmuP4+yv3RG+pggXPykA1RgCVa8I7Odn/oX/1T3hDVrDWgU?=
 =?us-ascii?Q?iKmvuNknswZ/HRCXfV5UxfrCQYLN5juNw6iAK6pctqbRhmXwK8RUqgLsBCmZ?=
 =?us-ascii?Q?aj6eRJfvSZku8WentSTu7lytAtDhhso7eR4i+SnK0up8cpApRonEGXWJglwv?=
 =?us-ascii?Q?YxNNxYkZJVBkEIwoKTt5qPhf6AFRD2TH/uoET6eLfiz6gMQaCXB7CsGtj9sy?=
 =?us-ascii?Q?HywGjGy+Pjz44YvbddmfstBOosmL9xLEGWrIt+Z4qAxvuxg7aZuO7Yn+ra6e?=
 =?us-ascii?Q?pILcl078LKBeKgTS+U9DmrYCbsZBxVCwETHuInMLtzlra/BRGVceLoeRjbld?=
 =?us-ascii?Q?EAEwBmvhxL5SccuQkOTSMEh2dK/v+L/C2gN1oby9+ympXVapucKlo6QLGXjv?=
 =?us-ascii?Q?/aWB8E187ZMfswtjqMoMO8e8Sc1tlzAO23CCkz+aqwCpVqIgVY6HW6vX1C9c?=
 =?us-ascii?Q?Yt8JUkK0bweYQPV4YxZnYBv9RSn2c0Op1lKUslJI5g29Ou2VBip77l7oHQ+B?=
 =?us-ascii?Q?TGAlnJtyQVv0LfR6XCbBEhx9Fc+RNtQzzDC3DeQw+NASIbgCBVybHwYw6+0a?=
 =?us-ascii?Q?FIlzdTaBQFZHVkay21nd3RCIyfcOlHDac4HQG4SYplSmmAstyRa7PRbQbyL1?=
 =?us-ascii?Q?pq/7iUQu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b794509-fb55-4224-97a9-08d8c220309f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 17:31:18.7176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O14vM2CENTScUT3jNFEqxGAgB0DsqDxrHLuhpX6jnH9Wy8iOAngT32MlXt4byE8FOxtnqd05UKX21ZR9QqFZRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1376
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

We use the qmp.py from qemu, which needs to get installed in the
recipe-sysroot-native of the target image.

[0] https://github.com/qemu/qemu/blob/master/docs/interop/qmp-spec.txt

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/testimage.bbclass    |  6 +++++
 meta/lib/oeqa/core/target/qemu.py |  6 +++++
 meta/lib/oeqa/core/target/ssh.py  | 17 ++++++++++++-
 meta/lib/oeqa/targetcontrol.py    |  3 +++
 meta/lib/oeqa/utils/dump.py       | 31 ++++++++++++++++++++---
 meta/lib/oeqa/utils/qemurunner.py | 41 +++++++++++++++++++++++++++++--
 6 files changed, 98 insertions(+), 6 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclas=
s
index 78da4b09bdf..5db384d342f 100644
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
index 0f29414df54..a73d82d9aff 100644
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
index 461448dbc56..923a223b25b 100644
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
index 19f5a4ea7e9..15709ad5d16 100644
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
index 09a44329e01..7391126c8bb 100644
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
index 77ec939ad72..0e52053ffee 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -20,8 +20,10 @@ import string
 import threading
 import codecs
 import logging
+import tempfile
 from oeqa.utils.dump import HostDumper
 from collections import defaultdict
+import importlib
=20
 # Get Unicode non printable control chars
 control_range =3D list(range(0,32))+list(range(127,160))
@@ -168,6 +170,21 @@ class QemuRunner:
         return self.launch(launch_cmd, qemuparams=3Dqemuparams, get_ip=3Dg=
et_ip, extra_bootparams=3Dextra_bootparams, env=3Denv)
=20
     def launch(self, launch_cmd, get_ip =3D True, qemuparams =3D None, ext=
ra_bootparams =3D None, env =3D None):
+        # use logfile to determine the recipe-sysroot-native path and
+        # then add in the site-packages path components and add that
+        # to the python sys.path so qmp.py can be found.
+        python_path =3D os.path.dirname(os.path.dirname(self.logfile))
+        python_path +=3D "/recipe-sysroot-native/usr/lib/python3.9/site-pa=
ckages"
+        sys.path.append(python_path)
+        importlib.invalidate_caches()
+        try:
+            qmp =3D importlib.import_module("qmp")
+        except:
+            self.logger.error("qemurunner: qmp.py missing, please ensure i=
t's installed")
+            return False
+        qmp_port =3D self.tmpdir + "/." + next(tempfile._get_candidate_nam=
es())
+        qmp_param =3D ' -S -qmp unix:%s,server,wait' % (qmp_port)
+
         try:
             if self.serial_ports >=3D 2:
                 self.threadsock, threadport =3D self.create_socket()
@@ -184,7 +201,8 @@ class QemuRunner:
         # and analyze descendents in order to determine it.
         if os.path.exists(self.qemu_pidfile):
             os.remove(self.qemu_pidfile)
-        self.qemuparams =3D 'bootparams=3D"{0}" qemuparams=3D"-pidfile {1}=
"'.format(bootparams, self.qemu_pidfile)
+        self.qemuparams =3D 'bootparams=3D"{0}" qemuparams=3D"-pidfile {1}=
 {2}"'.format(bootparams, self.qemu_pidfile, qmp_param)
+
         if qemuparams:
             self.qemuparams =3D self.qemuparams[:-1] + " " + qemuparams + =
" " + '\"'
=20
@@ -251,6 +269,19 @@ class QemuRunner:
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
@@ -376,7 +407,6 @@ class QemuRunner:
                         sock.close()
                         stopread =3D True
=20
-
         if not reachedlogin:
             if time.time() >=3D endtime:
                 self.logger.warning("Target didn't reach login banner in %=
d seconds (%s)" %
@@ -391,6 +421,7 @@ class QemuRunner:
             self.stop()
             return False
=20
+        self._dump_host()
         # If we are not able to login the tests can continue
         try:
             (status, output) =3D self.run_serial(self.boot_patterns['send_=
login_user'], raw=3DTrue, timeout=3D120)
@@ -437,6 +468,9 @@ class QemuRunner:
             self.runqemu.stdout.close()
             self.runqemu_exited =3D True
=20
+        if hasattr(self, 'qmp') and self.qmp:
+            self.qmp.close()
+            self.qmp =3D None
         if hasattr(self, 'server_socket') and self.server_socket:
             self.server_socket.close()
             self.server_socket =3D None
@@ -495,6 +529,9 @@ class QemuRunner:
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

