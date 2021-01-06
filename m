Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.76])
 by mx.groups.io with SMTP id smtpd.web08.13352.1609961307751736775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 11:28:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HXUy7d2r;
 spf=pass (domain: windriver.com, ip: 40.107.244.76, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnU7Bgjc0vCS75JU3Q+pmQM9hsq/lz9APxmMefYKX9T7hcL+or5l9OxQ72MSNGM5/YL5XvhsvJbCx0dmC5e8Hhmkx5NqtthvLldpQHwxR0SC71dvQZFhR+FvY34V/IqE9Ndgm4sOl1lae4IWBiOY72cEEZNOCKPgAQc3tKQaJub9+D/7OQ5syfT+qM72tcKNCw08P5+MaxZ1cUiUGvr7P3urtvLR7MpMeZ/wkQGYFqlTCmmtF1T0tTP1jX5KojNAbcYPP0T8iUw8fwntFVvzgRG3F3z+etSQDjIgQQLyXtbESp2TnBS7xKIZqnYbjqlG0a03N444BmDJy47QX2SOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRyse7HW5wlA6rf0xDJnhyDEHEtAnxJLPk4WhkJbcZc=;
 b=oew5o56IFizRTky7Ckce+y0gZGSs6hWXNdKfgtp8TNtTVy3VaHh3ogXwETpFw3vMhIEl9yLNfJXSEooT8sF3OUK2IMArDcEDVHGQGQtigwINFJ7ftsa93ojMFjV1D2J95Kt60eSGYYTYWoV2NIM9j7JSl8i5BvziD3E/dDzDrG+z+ru95WmLGj5BQqCdU4lpfOpEcCojQlYOqZUwlNj+DboE/atDSeDFD3FCq2IRTLvQDqNaICaKhBGkYcLtgZ2SIvIUrIrjTapLaWvQkGxPsS9IPeudtgynsRe3cXMosswjdxXAcyxKGjfe2+q3kfwSVUeQ8FQddyVmdHBacPQnNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRyse7HW5wlA6rf0xDJnhyDEHEtAnxJLPk4WhkJbcZc=;
 b=HXUy7d2rczp9xOi+cP/1uavpck9UPSdPa65RLDU0Mlxg2HFq/Zxgpi0dkPusrR3ApX+wyOH6ne9yBTfeDAfPa27v7+MmEEnZE1EWsbBmbxdHwzwKTUomWh9CDJO6dSMg6Av1cZ3PEThCYg6PMPpy3kVdhC6y3yV8OjAVBfONaqw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB2031.namprd11.prod.outlook.com (2603:10b6:300:29::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Wed, 6 Jan
 2021 19:28:26 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1910:aec9:8c56:2264]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1910:aec9:8c56:2264%5]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 19:28:26 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 2/2] qemurunner: Add support for qmp commands
Date: Wed,  6 Jan 2021 11:28:05 -0800
Message-ID: <20210106192806.1335560-3-saul.wold@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: e767181d-3e49-4055-5ebf-08d8b2793d9d
X-MS-TrafficTypeDiagnostic: MWHPR11MB2031:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB2031BFCC0EED71A6671E8ACBEED00@MWHPR11MB2031.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VOKRo8LoL8IG+pY7kkHdQokwxVMh9pXDItjmUDU91VTqx1KqUevm1HZhGP1mI2CvwH08hPXDQsBgJngNEN62lwd6lZ1icP/2ZI0i6ZcB9lKxgZnObe4qDvVO+Cjksqjextiq5nFcY+4eH66dZpnqXUMJVYwxxtnshyWEyvX7scejfjNmruDaTwdtur88fhCqCCs3Zr3dJiAGvsnYM9s2e7xcjwvW3j2W0Xp3b0atFYosovv56CoSZq7TyRJ7l1fvZvMFVzjk/dkidekrRmKRbUNa4Z904BOpu5FBh4r6kLCPMqjMJwVTvaQdnMO/otVILAsg63cG7cXS0llXc1n48WcjtemKKyVmqMWdd04SR8XpPvkPuwJgwVujKXrsU8etLqtig4Jvl4zT+EkaT6qOOwAEyGrvultQS/dp3BkmZq39bG0BiHymdhjPWVmoqHprxvElNJ9Ug11K3LJBCRGRo2YiA1RclmITVn4q5kkEx33rMw2jhBvOtSy+eRfVxTyx/UP1FZRVDSYlbPAT5t+rVA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(66556008)(66476007)(6916009)(5660300002)(316002)(26005)(6506007)(966005)(2906002)(30864003)(66946007)(52116002)(8676002)(83380400001)(36756003)(478600001)(1076003)(956004)(2616005)(8936002)(86362001)(6666004)(6512007)(44832011)(6486002)(186003)(16526019)(403724002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?kLh70j8n+svef4Vr19hb+UbqvIQV0DYf2dCj8w7oYJ/ZFiJmGXIyiNIDi9Af?=
 =?us-ascii?Q?WjyyAeshGrf9zrkSwVvJGsqWDlsUxlewTFWdxqizpT55r3MhfKXm7N2GN9Bh?=
 =?us-ascii?Q?ZpLQMPL6Cl4ukf/ncuoXYoy8efEe8iBxjOfuaZ0UYdo5dEIRwVIvZ9l0nT8e?=
 =?us-ascii?Q?a0r+lMuG4/obL0fCyx5AwgSnDd742aaePbP/Li3SHLTQRmVTO08ATi/RGdaX?=
 =?us-ascii?Q?8e3tCHFPBhTI4HxUbodqc4uTk6rjFxmUwb5RFgnE01UA3/Zk/TijXAkva/oC?=
 =?us-ascii?Q?wPdqy+BEOXiCm5htX8nxmDNJ4j5JumnVERfXN32IQ6I6KHhcXcl22p3za8Sd?=
 =?us-ascii?Q?qoYUVKzDwPY7g5AatFPAJK41/apQ9CAvjZi0piU+dSMUg0Qa67U3Sqxi78pe?=
 =?us-ascii?Q?O+NOUEn7IulE91qJ0GlxI3mXvSlzW8P6mHYruoND0O38UhPK8fZ01D11EjfC?=
 =?us-ascii?Q?tiGJ8kLK7vv17Pc1YWlF4Gr7oc9VkBsJBUD4pQwlg3aMtO0B1a9Zf3o307SI?=
 =?us-ascii?Q?CxS0qmLIb+ueNqVTPs1V7aPiFCSnVPqJRdji9/7Y6s3fdf/+cyoL4EgMUV7x?=
 =?us-ascii?Q?Wl98QBHM95uk7KXSP8wjDa9RkWY3ws9eNmabTkCVKIW5EfRDsmbLD4IsQjaG?=
 =?us-ascii?Q?rxt/6hainv3MDihExtzB99R6NKV5Uo3xygVe/gATmLSaMd1o6KwG0KyAzpMr?=
 =?us-ascii?Q?nnLATSa9elPa0ddtdlAmkS1pApsYR1Kt+W73u9PwQDwwFmfRNqoy02VTbp09?=
 =?us-ascii?Q?n5VSUgMcE3Sc0rshQH/hlJzmOCCu3KN8CR59z6hJXp+t9CwGZCwbWOZjDDQ/?=
 =?us-ascii?Q?5fE3H/LptJGfKdteWprEPAX6i2xk2NFscaUhq0rsP8FCOoDUozwWsmdx6l09?=
 =?us-ascii?Q?TcjAPAE8bqNGG+8W1yNafsjQ9wRc9KJd0iQmqu6dw9AGn1AP45XYZmTBYxDr?=
 =?us-ascii?Q?RssmLL+v3hZe04eOaHuV9hhk9ENhDOpK7nabeTbsy8HPFljGRaGAIw7/A50s?=
 =?us-ascii?Q?+jVn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 19:28:25.8425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: e767181d-3e49-4055-5ebf-08d8b2793d9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mA0cSWhqeWw7SwDj9g8hxibnx/W52Cr98JZvYslRcADaHuMhciW9WWEkzomPwjZEg1h4jS5e+H6IKEO3z4WkDw==
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

