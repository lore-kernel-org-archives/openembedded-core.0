Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.70])
 by mx.groups.io with SMTP id smtpd.web09.18.1610493103975311912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 15:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=h+uQn9PQ;
 spf=pass (domain: windriver.com, ip: 40.107.220.70, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXMLCatpHWuDv/5NoQwCgPh5zdtzad6sq1Mu8rBDgdlhfS/njBz+oFZ/i+U3Ksxg48ylxD2eNWByUyaOjPKrnJ5mvtbGNgRID7Nud/HCac2+DPvubVIDWVxVanLAmV/l4g6i8mUIWSedRurqiAv5kXiKIFkSxobIseeWYuukydYSNTtm8CB52zUVP73T1wgNcWATvU4Gys0xjZVhEzwG1K5z+NLrXaoKu44mK2We35DYpWJoy7k81cKGhC2Z5YZLagT2om7ts3leBdOUt9zs7PLufUdVCjXlgaL1V7c5fttBqrh5qyniQ68oKI1CdBsG9XRjZezqxm5b5k/00gWGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vDGuACdC98oOJBPdJnQVS9YupLnRfFiJhrBZO4Ckbw=;
 b=k4c4xRNJfWWb+ccM1QTOmknbT4uUEsQV9pVBTmH2fdkh4PD8acLY2OHbZYgVBCXfcMKSFP1nWptd9TlPPzimRMkrYvcuLlJlheo86gtIjXL8ZWv3/M6hGyLLC+nE1+TJqmvqyb5TpRdGP676tpKvF7kZBORTe8Mcj2TmMhDB1R7LK2wD+4guO4xSxhl/yUSlgLFyQOy+R/LhD8BVCgMhLvkHWEib/LO/irm5i03lW83Kr1uv+0Oaqrb9rEBdHvchDADDKI7ow7h5wWR7TiHnmEZRk02xeBnEhZcLjO82kyobleH7oWIhrFhigAnKEuTt9FsZIgg6c0cVEDK5LamO3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vDGuACdC98oOJBPdJnQVS9YupLnRfFiJhrBZO4Ckbw=;
 b=h+uQn9PQmoMB3Uhty/KvdMwaCzh7shenuYyxHIhC7rgb1+BAOSo+2Pk/h8nUZk3NoiXZ9Q2tDMxY2c5Qd1wY6/wo1zSZOLCAK5JK1EM9RNSKaf6cXfjVn6EQZBvzt+ckLWvi+zg4fUKwD8YQMob/UekBH5PmhcJDt5wNN9RW3Mc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1534.namprd11.prod.outlook.com (2603:10b6:301:c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 12 Jan
 2021 23:11:43 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f%4]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 23:11:43 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemurunner: Add support for qmp commands
Date: Tue, 12 Jan 2021 15:11:08 -0800
Message-ID: <20210112231109.4048330-3-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112231109.4048330-1-saul.wold@windriver.com>
References: <20210112231109.4048330-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:303:114::34) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.localdomain (71.238.119.71) by MW4PR03CA0389.namprd03.prod.outlook.com (2603:10b6:303:114::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 23:11:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85ede8ea-6e2f-4d67-ccb5-08d8b74f6cf7
X-MS-TrafficTypeDiagnostic: MWHPR11MB1534:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1534909F8B46C1BACC3BDA50EEAA0@MWHPR11MB1534.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SvWdi6kQEj33Zm08QlPK95S16Eq9UR8Fri8xksbebuZqNWrZ7SbYpZGjzb7T8Nb0VXxUzLCsQPuwr7RXh7BlDAgo3n/MLZ3L/O5mJhQtrpQ+jvvmxpkEKfkADZGYgWklauHw2r/f0xuEsqvUDzqkHU4qvdtn3oQyZRuYtsLHXSZrLhgtw7rBwFkfRgvVMHBNaiNIcZSrVIBjgvq8Oa7PfvnLOfaL2W71mY8P/yjZUuilQBouOyeuWJ2O+NbJkhb7BACNXBMuVD2MwojxIJLQ5AB0sIkI5t6PwA9GihuWBtagHMrAFa42/PVAdCg0/1xYL121ePfPasjtjjRzeVUPRhdre/zqqRZ6/m8shZCqJBY9x7fX0K9UaY4pfA/KR51N/CF2DrBPYLQ3KIjIocVh2Z3w0AlGcAs0vzgstGMGs43bFsl34uAcaVMS4QHL3CS+Z437wGAL6ZdGARSJDCErx9jacWxed2GB/DLzWudlKihrhvcnp71gyxtF6/Q/Tfu/IDymYxn257Yq2OPw8EbDdg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39840400004)(396003)(376002)(366004)(136003)(186003)(26005)(6506007)(16526019)(66946007)(83380400001)(8676002)(36756003)(316002)(2906002)(52116002)(6486002)(86362001)(6666004)(956004)(478600001)(2616005)(966005)(6916009)(30864003)(44832011)(8936002)(6512007)(5660300002)(1076003)(66476007)(66556008)(403724002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?7veG/s8YHueKC5cZUVco+vMGcubDI3LQ1iF4fYsy2KbauPBYYfMVLKUaQyhS?=
 =?us-ascii?Q?zBi8Q/ZkrpTWYVPnWNtNXXYsSj3vUSKq291qv3ECvBkNw1di+WA3Gy9Pv+7s?=
 =?us-ascii?Q?N3U+nMj3EMZW86AjW8fKGe/zRMOS0vWJZX8YSIYpl5kJWrnNbGaHXG3P6Ueb?=
 =?us-ascii?Q?5sDVJ8BDorEve8wRpqk4GSDeID0zrcPjCAYLqNJhttdCpXHxBuCzyOea6dUd?=
 =?us-ascii?Q?hiQQ0Hg0RYW+6UsTQvfWouzJyTOFZ3N5+bKHH6W2Tgzf1Kb8brFMBE+Guj2A?=
 =?us-ascii?Q?fbLV2ucODfbN0GF9OLOloZ8fcoou8G3n8SrgW0iuqIVmIhrcAf36v7g3uAP0?=
 =?us-ascii?Q?ZipT4eva3eHUhnObnAGDXprXTLlEF88XlKQx1KwI11DwSJP6LcCsJ1kPGAKP?=
 =?us-ascii?Q?1PKIBaJlOVGSVJKnI7Fn7O2sjMLEzzohtRPyTnHuEQwqAL5tjzyqvOb3ejAV?=
 =?us-ascii?Q?4uECfbu8/XffqeAlJaOM+xzvyoYZKkpWbLvm5HdcNWWAPzWx+W7It3hQ2Kn1?=
 =?us-ascii?Q?Aval/tg5kifCRzOAJD9ZDo71Bo99sv1//zI0qGzUdDiEDuVkZyqAtG34lt+l?=
 =?us-ascii?Q?FAFpqexDz7fxGwJOxWj87VyMgT8YeHZ4aPAx3NH3iHUOA37/YU9ytxqtmTkH?=
 =?us-ascii?Q?vNwGoLj+pia+x+3NOZHPaJlkmZG/t2iU1QkoybgENSeN60MHulQ7bJpg+6w+?=
 =?us-ascii?Q?HO+9o6SXdWd/LtVbaRTwIPh2nU3w2qDr7psEA/RCHFDmd+7CSRKdylm6C0Kr?=
 =?us-ascii?Q?5EH2oE4qHPqVc9+6lxk+EN3fKUBpkQkc3JObeu48PqL/4dMA1WDrf2Pec9g0?=
 =?us-ascii?Q?AKIsj+sPSvPGG74GWKKoqliRba/dvfBJvOTW4HAjT2xiORUnk9wlVKqHizVv?=
 =?us-ascii?Q?itZJEA4b4P5ub4H4sgU3lLEofLgDCGS+60PyJeoaP++e3Ychtm2AZ/Xg6U6G?=
 =?us-ascii?Q?iA/T0o2Y3OhPhPSHdtj4w4/FmsXgJD0dkBxwAQJvvk6r6rKIQRTF9qCsDCxu?=
 =?us-ascii?Q?kbIU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 23:11:43.0487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ede8ea-6e2f-4d67-ccb5-08d8b74f6cf7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgOU+xh5yGTq9nOmitrGcT8e0d5TETIKeJmqvE0QyMXhjpG9aK0mb/5TtJXxVO9GPIvwTjiEHtiStB1AXbXoPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1534
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
 meta/classes/testimage.bbclass    |  6 ++++++
 meta/lib/oeqa/core/target/qemu.py |  6 ++++++
 meta/lib/oeqa/core/target/ssh.py  | 17 +++++++++++++++-
 meta/lib/oeqa/targetcontrol.py    |  3 +++
 meta/lib/oeqa/utils/dump.py       | 31 +++++++++++++++++++++++++---
 meta/lib/oeqa/utils/qemurunner.py | 34 ++++++++++++++++++++++++++++++-
 6 files changed, 92 insertions(+), 5 deletions(-)

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
index 77ec939ad7..49df8d3b0f 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -20,9 +20,18 @@ import string
 import threading
 import codecs
 import logging
+import tempfile
 from oeqa.utils.dump import HostDumper
 from collections import defaultdict
=20
+# find the qemu binary in order to get the recipe-sysroot-native
+# path and then add in the site-packages path components and add
+# that to the python sys.path so qmp.py can be found.
+stream =3D os.popen('which qemu-system-x86_64')
+python_path=3Dstream.read()[0:-23] + "lib/python3.9/site-packages"
+sys.path.append(python_path)
+import qmp
+
 # Get Unicode non printable control chars
 control_range =3D list(range(0,32))+list(range(127,160))
 control_chars =3D [chr(x) for x in control_range
@@ -168,6 +177,8 @@ class QemuRunner:
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
@@ -185,6 +196,8 @@ class QemuRunner:
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
@@ -251,6 +264,19 @@ class QemuRunner:
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
@@ -376,7 +402,6 @@ class QemuRunner:
                         sock.close()
                         stopread =3D True
=20
-
         if not reachedlogin:
             if time.time() >=3D endtime:
                 self.logger.warning("Target didn't reach login banner in %=
d seconds (%s)" %
@@ -391,6 +416,7 @@ class QemuRunner:
             self.stop()
             return False
=20
+        self._dump_host()
         # If we are not able to login the tests can continue
         try:
             (status, output) =3D self.run_serial(self.boot_patterns['send_=
login_user'], raw=3DTrue, timeout=3D120)
@@ -437,6 +463,9 @@ class QemuRunner:
             self.runqemu.stdout.close()
             self.runqemu_exited =3D True
=20
+        if hasattr(self, 'qmp') and self.qmp:
+            self.qmp.close()
+            self.qmp =3D None
         if hasattr(self, 'server_socket') and self.server_socket:
             self.server_socket.close()
             self.server_socket =3D None
@@ -495,6 +524,9 @@ class QemuRunner:
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

