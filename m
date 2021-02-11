Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.11047.1613061134875057234
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 08:32:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=d67X8q+m;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxQjBkmwQkC5CUBLQ7ujAOon4nz8suMmPm4vwY5v0P3HYAzKjNL9uNCTkgwM89XF1jpUAiVxDLbk/VpWx+ayguiD7Y/f4uFgaidQDJMhHO8qph2sVyIfNuVCPujIst+R90OfMsST7TiLI2RqdjKkv0ZKJOG0ZVPPdKoRtQYosKo6qpee5jkKwcY8GMrhNOnDgKARCgJ1Yb/w60u3k7qXrjtCEbqGoA7ahZxrl4AGdUemQuUqJ6eSf+7hA2SUvHMT+JRTsTJeQ7tS7zQGQLVOmwYLK/XPrD25hKGAWPF3FiAtVzpvrbsJexokpK86+p1ag3EnYFBNwbPn8TUxpkMdTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BrSqMWNBqJOP4jEiOnaNXxgQD4bbOknjVa3wcV4seU=;
 b=NBTxXR94J7I1vS/0/OuL7+eiOoTYYeIYeBRIaQv594BXC7/0SwwHzpZd1y1ibEDJBJqDfTgdGQv4QqmgOgw0BQA3JpPOTAZ58I+4USpNxsOCRZTtKnOr3spq9UVENFtkNLlUON2PTpvf3UAvtpMxOaQZ/mjuEaANRsKEwbpa/hP8OKIOzaFYrAzhOj4x32JcAiLPa2yfIKgo2zbHTDwta+pcjT+17bjDxM2gW+/S+8TkPhB2/hsR1+OWbUNhpQKgNDsvuFC/5sZ6eXb9ZUOZzKZROCaSJIU2/u3o/BH2Be9YrgteZHk/LBgfipevu/6OjUwJoYNWQqmq/hxe5I5sQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BrSqMWNBqJOP4jEiOnaNXxgQD4bbOknjVa3wcV4seU=;
 b=d67X8q+mBGPcYGLekIzEjTjVlr5I/wiWqx48WJF/yGUAchdez94jQyjG8Viqauc18kQ2oGI3d41gWseU/OlGgZ5Zu71313WjDUXpaS291Yi1d/YzGX+hVvQEX754swVxEamIfxVu12YzsNUuDJ76/IKKVBLFbtbRT8BARRqWQuk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 11 Feb
 2021 16:32:14 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f%4]) with mapi id 15.20.3846.027; Thu, 11 Feb 2021
 16:32:14 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemurunner: Add support for qmp commands
Date: Thu, 11 Feb 2021 08:28:10 -0800
Message-ID: <20210211162810.3702567-3-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211162810.3702567-1-saul.wold@windriver.com>
References: <20210211162810.3702567-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:300:13d::15) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MWHPR20CA0005.namprd20.prod.outlook.com (2603:10b6:300:13d::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend Transport; Thu, 11 Feb 2021 16:32:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1aba6f9-1f0f-4242-14eb-08d8ceaa96c0
X-MS-TrafficTypeDiagnostic: CO1PR11MB4801:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB480191AE5AF395F3BED9D9A1EE8C9@CO1PR11MB4801.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9UVfz8zLcE9D+sWdj4y15e2r4du2kj5ofpQwOUX164cwOVhi/6IPh/09Ksi83ODPYdIUZ8ILHm1gKFviMV41PYk83lSAsVpgTxAnIUansq5oBw8T4ueT1eFBOq4m9p3J2tc3TAnf6a1ufshzHVEsANQBqRrf8LJboMlGzCBdi2oesImUE8tg8AhkXCCUVZLcNy6kHZ/Kogb4xjOKYm3KKanU9Ri2fHXbCHLpzn9hadcPtLiJTIGbTdxP9yDyqelTLQlIjs4uTciScjIjMfiDRmAT5E/oQKyY+QOYDpQmzCOQSagrr+4Oy3PEwBi3VMBdmPkpPKb8Q/9Gof8ssVTAWwiiyVkrOSKQ3840NzurjJQDnpxTNfOWDvySGkGzYgl5ibGDcXUye2XCIIujQo7ONfMOSHew9uiBBc1UpzwaOYgKi7UKZffvLSJZJckzZLvHl/gGAi7PQ68AMAnmbF7vrkgDUxgYDl4ouztLl+oVKf9CZ1/Z4YAHAwAlOLDP764s8Q20bl38GqTRmNileqO3VMKbe/2BZB6KO7KgKTLRsK0HN6zWNCj0hiowD5u+iHfrDr1yGBvQzKxuWmWd5igf4WJNPoc5rdTV4rlVMsr+piXuc5UhUBxRMTVZmwgNjoeWnvGpluEGiNCGLw/dJVyh1w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(346002)(376002)(366004)(44832011)(6916009)(316002)(2616005)(956004)(6512007)(86362001)(2906002)(6666004)(83380400001)(26005)(478600001)(8936002)(8676002)(186003)(6506007)(16526019)(36756003)(30864003)(66556008)(1076003)(66946007)(66476007)(966005)(5660300002)(6486002)(52116002)(403724002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Gm+qu5136eef/mCgxJ4YAxGYdgeOQ4q/62y2F0BdDiKUhSEMAQIzXXM/coBd?=
 =?us-ascii?Q?aAEW/gqPQtnuK7yt8DNyMOv6MIWd7mUX91estGCY98PMoLWs9wUcbrRviTFo?=
 =?us-ascii?Q?aH3Nw/6MBazP2UezbVtA156kJkZ6hayknUqFCU2n6xACNbAQnmlPvBS8iLzj?=
 =?us-ascii?Q?26bThFfAXvVryRfSoXKC3A+pB8ZIzJUB2MY857TXNgB8VFUB03yNsUZb2+1j?=
 =?us-ascii?Q?fWugfqKXE9kFiPQBmq7oBIfy0z8C7Pjz2NXvF8WRkVurNnLxqCEYhoZXSoRG?=
 =?us-ascii?Q?t5L1dADlymOYe9vP2vUVxsHHyPG7t7vZvvXZGPNF1Gubsh9SpNkxwWR6DWAj?=
 =?us-ascii?Q?NthIl3eTB76nwNVpegH9cJOBysqvic+HnjXTuooL2oFcC9bKnbFUb/D+XBHn?=
 =?us-ascii?Q?FQ512Eor9ngVrQbyWJC3Ex7+hFujgI8754zkZQxR5l84123OTSMhmYDsDM7g?=
 =?us-ascii?Q?1j8t4O81VK7RqSQUqNAZU0t5U5HbVT76R1Tca/K4Ut3K8lmGLfe5sx+4lfAb?=
 =?us-ascii?Q?TDhcqJX1VVo3tW3VOisimsWiypn6q02HKQxPgNRqqRHy8fhTO01Jja8WJ4ac?=
 =?us-ascii?Q?Xa6i1qL+c+fvK40St+5qXwUI79+VdwpD/CXY/PlkI6v6mbrGbKgm8x6Ua6vp?=
 =?us-ascii?Q?jehZx+u9KKVrsbvHNwDgJZgKzF4ejBXd2woEbF1i+vNXs3ZF4ivmVe+bNdB5?=
 =?us-ascii?Q?pFsMvymWWxK85K2mXnB7sDcFYVSZc7Ee816qXTjhgmT/LDCxY1ydPAmIQBXT?=
 =?us-ascii?Q?xR44iOCfrsTtZYIg1I4IJII+n6+2x7XQqTkTnfNDKiwV3EfCZswoyyxnj81L?=
 =?us-ascii?Q?TI+otoPv3J8G4Ut2u3aWsG1VOVugOllq1J67KDpyhakekm26T7JRrtwqiB7C?=
 =?us-ascii?Q?VL65iyBNdZpEObr8HU/9reMnAPsb2NAjNWj8hMbQd34d88YWwUxm+hKgy5AY?=
 =?us-ascii?Q?bHMXqa4DngSMW4gf9/P006FKLBqlTdKbYvsvihk3DBnspl7RGtedgCWyvJJp?=
 =?us-ascii?Q?NwSuHSaDa7ecBxi8YGwVwCTJKDuqpJsKbcqUM1qzJtpuM5G54YKCCI9mt0QF?=
 =?us-ascii?Q?i7hzaUULMWuz8zhdHU+pdUu1Z0kBbI5LASSlPwgN0gsx50oxPMry+OnkY1uR?=
 =?us-ascii?Q?4S0VYGrPvTtIPYfLJmIs2OqCOlcxJv9RU0mPgdzD6XZTplRFgEg0N9/l+4Uh?=
 =?us-ascii?Q?ywsCSQ87YDZtiVz+l6LAD1jqg+uiykBKupwRx6JkUgK00AMz3U4Z/KfPv5L9?=
 =?us-ascii?Q?jjJn8k+FTP6yA34zRVun039tnA7/xIuZQes77q0fWfuw363T251vpp+9X9F6?=
 =?us-ascii?Q?vVLjuyrTfEPhZaimYWun/ESL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1aba6f9-1f0f-4242-14eb-08d8ceaa96c0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 16:32:14.4277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwpEhp8olcP2+71SHgzjL0GGSIERFUM/qwAZEkfr19kcqqKNg/BU/oqmRJ3D4ebtnuJJIkdLtJraQp2iYO9SeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
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
v3: added warning messages into qemurunner
    fixed extraneous warning from dumping host info

 meta/classes/testimage.bbclass    |  6 ++++
 meta/lib/oeqa/core/target/qemu.py |  6 ++++
 meta/lib/oeqa/core/target/ssh.py  | 17 +++++++++-
 meta/lib/oeqa/targetcontrol.py    |  3 ++
 meta/lib/oeqa/utils/dump.py       | 31 +++++++++++++++--
 meta/lib/oeqa/utils/qemurunner.py | 56 +++++++++++++++++++++++++++++--
 6 files changed, 113 insertions(+), 6 deletions(-)

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
index 77ec939ad72..721e8005cd5 100644
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
@@ -238,6 +256,7 @@ class QemuRunner:
         while not self.is_alive() and time.time() < endtime:
             if self.runqemu.poll():
                 if self.runqemu_exited:
+                    self.logger.warning("runqemu during is_alive() test")
                     return False
                 if self.runqemu.returncode:
                     # No point waiting any longer
@@ -249,8 +268,36 @@ class QemuRunner:
             time.sleep(0.5)
=20
         if self.runqemu_exited:
+            self.logger.warning("runqemu after timeout")
+            return False
+
+        if self.runqemu.returncode:
+            self.logger.warning('runqemu exited with code %d' % self.runqe=
mu.returncode)
             return False
=20
+        if not self.is_alive():
+            self.logger.warning('is_alive() failed later')
+            return False
+
+        # Create the client socket for the QEMU Monitor Control Socket
+        # This will allow us to read status from Qemu if the the process
+        # is still alive
+        self.logger.debug("QMP Connecting to %s" % (qmp_port))
+        try:
+            self.qmp =3D qmp.QEMUMonitorProtocol(qmp_port)
+        except OSError as msg:
+            self.logger.warning("Failed to initialize qemu monitor socket:=
 %s File: %s" % (msg, msg.filename))
+            return False
+
+        try:
+            self.qmp.connect()
+        except OSError as msg:
+            self.logger.warning("Failed to connect qemu monitor socket: %s=
 File: %s" % (msg, msg.filename))
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
@@ -376,7 +423,6 @@ class QemuRunner:
                         sock.close()
                         stopread =3D True
=20
-
         if not reachedlogin:
             if time.time() >=3D endtime:
                 self.logger.warning("Target didn't reach login banner in %=
d seconds (%s)" %
@@ -437,6 +483,9 @@ class QemuRunner:
             self.runqemu.stdout.close()
             self.runqemu_exited =3D True
=20
+        if hasattr(self, 'qmp') and self.qmp:
+            self.qmp.close()
+            self.qmp =3D None
         if hasattr(self, 'server_socket') and self.server_socket:
             self.server_socket.close()
             self.server_socket =3D None
@@ -495,6 +544,9 @@ class QemuRunner:
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

